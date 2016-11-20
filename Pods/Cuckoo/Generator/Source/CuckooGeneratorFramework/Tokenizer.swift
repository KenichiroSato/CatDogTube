//
//  Tokenizer.swift
//  CuckooGenerator
//
//  Created by Tadeas Kriz on 12/01/16.
//  Copyright © 2016 Brightify. All rights reserved.
//

import SourceKittenFramework

public struct Tokenizer {
    private let file: File
    private let source: String
    
    public init(sourceFile: File) {
        self.file = sourceFile
        
        source = sourceFile.contents
    }
    
    public func tokenize() -> FileRepresentation {
        let structure = Structure(file: file)
        
        let declarations = tokenize(structure.dictionary[Key.Substructure.rawValue] as? [SourceKitRepresentable] ?? [])
        let imports = tokenize(imports: declarations)
        
        return FileRepresentation(sourceFile: file, declarations: declarations + imports)
    }
    
    private func tokenize(_ representables: [SourceKitRepresentable]) -> [Token] {
        return representables.flatMap(tokenize)
    }
    
    private func tokenize(_ representable: SourceKitRepresentable) -> Token? {
        guard let dictionary = representable as? [String: SourceKitRepresentable] else { return nil }
        
        // Common fields
        let name = dictionary[Key.Name.rawValue] as? String ?? "name not set"
        let kind = dictionary[Key.Kind.rawValue] as? String ?? "unknown type"
        
        // Optional fields
        let range = extractRange(from: dictionary, offset: .Offset, length: .Length)
        let nameRange = extractRange(from: dictionary, offset: .NameOffset, length: .NameLength)
        let bodyRange = extractRange(from: dictionary, offset: .BodyOffset, length: .BodyLength)
        
        let accessibility = (dictionary[Key.Accessibility.rawValue] as? String).flatMap { Accessibility(rawValue: $0) }
        let type = dictionary[Key.TypeName.rawValue] as? String
        
        switch kind {
        case Kinds.ProtocolDeclaration.rawValue:
            let subtokens = tokenize(dictionary[Key.Substructure.rawValue] as? [SourceKitRepresentable] ?? [])
            let initializers = subtokens.only(Initializer.self)
            let children = subtokens.noneOf(Initializer.self)
            
            return ProtocolDeclaration(
                name: name,
                accessibility: accessibility!,
                range: range!,
                nameRange: nameRange!,
                bodyRange: bodyRange!,
                initializers: initializers,
                children: children)
            
        case Kinds.ClassDeclaration.rawValue:
            let subtokens = tokenize(dictionary[Key.Substructure.rawValue] as? [SourceKitRepresentable] ?? [])
            let initializers = subtokens.only(Initializer.self)
            let children = subtokens.noneOf(Initializer.self).map { child -> Token in
                if var property = child as? InstanceVariable {
                    property.overriding = true
                    return property
                } else {
                    return child
                }
            }
            
            return ClassDeclaration(
                name: name,
                accessibility: accessibility!,
                range: range!,
                nameRange: nameRange!,
                bodyRange: bodyRange!,
                initializers: initializers,
                children: children)
            
        case Kinds.ExtensionDeclaration.rawValue:
            return ExtensionDeclaration(range: range!)
            
        case Kinds.InstanceVariable.rawValue:
            let setterAccessibility = (dictionary[Key.SetterAccessibility.rawValue] as? String).flatMap(Accessibility.init)
            
            if String(describing: source.utf8.dropFirst(range!.startIndex)).takeUntil(occurence: name)?.trimmed.hasPrefix("let") == true {
                return nil
            }
            
            return InstanceVariable(
                name: name,
                type: type!,
                accessibility: accessibility!,
                setterAccessibility: setterAccessibility,
                range: range!,
                nameRange: nameRange!,
                overriding: false)
            
        case Kinds.InstanceMethod.rawValue:
            let parameters = tokenize(methodName: name, parameters: dictionary[Key.Substructure.rawValue] as? [SourceKitRepresentable] ?? [])
            
            var returnSignature: String
            if let bodyRange = bodyRange {
                returnSignature = source[nameRange!.endIndex..<bodyRange.startIndex].takeUntil(occurence: "{")?.trimmed ?? ""
            } else {
                returnSignature = source[nameRange!.endIndex..<range!.endIndex].trimmed
                if returnSignature.isEmpty {
                    let untilThrows = String(source.utf8.dropFirst(nameRange!.endIndex))?
                        .takeUntil(occurence: "throws").map { $0 + "throws" }?
                        .trimmed
                    if let untilThrows = untilThrows, untilThrows == "throws" || untilThrows == "rethrows" {
                        returnSignature = "\(untilThrows)"
                    }
                }
            }
            if returnSignature.isEmpty == false {
                returnSignature = " " + returnSignature
            }
            
            // When bodyRange != nil, we need to create .ClassMethod instead of .ProtocolMethod
            if let bodyRange = bodyRange {
                return ClassMethod(
                    name: name,
                    accessibility: accessibility!,
                    returnSignature: returnSignature,
                    range: range!,
                    nameRange: nameRange!,
                    parameters: parameters,
                    bodyRange: bodyRange)
            } else {
                return ProtocolMethod(
                    name: name,
                    accessibility: accessibility!,
                    returnSignature: returnSignature,
                    range: range!,
                    nameRange: nameRange!,
                    parameters: parameters)
            }

        case Kinds.Mark.rawValue:
            // Do not log warning
            return nil
            
        default:
            fputs("Unknown kind: \(kind)", stderr)
            return nil
        }
    }
    
    private func tokenize(methodName: String, parameters: [SourceKitRepresentable]) -> [MethodParameter] {
        // Takes the string between `(` and `)`
        let parameterNames = methodName.components(separatedBy: "(").last?.characters.dropLast(1).map { "\($0)" }.joined(separator: "")
        let parameterLabels: [String?] = parameterNames?.components(separatedBy: ":").map { $0 != "_" ? $0 : nil } ?? []
        
        return zip(parameterLabels, parameters).flatMap(tokenize)
    }
    
    private func tokenize(parameterLabel: String?, parameter: SourceKitRepresentable) -> MethodParameter? {
        guard let dictionary = parameter as? [String: SourceKitRepresentable] else { return nil }
        
        let name = dictionary[Key.Name.rawValue] as? String ?? "name not set"
        let kind = dictionary[Key.Kind.rawValue] as? String ?? "unknown type"
        let range = extractRange(from: dictionary, offset: .Offset, length: .Length)
        let nameRange = extractRange(from: dictionary, offset: .NameOffset, length: .NameLength)
        let type = dictionary[Key.TypeName.rawValue] as? String
        
        switch kind {
        case Kinds.MethodParameter.rawValue:
            return MethodParameter(label: parameterLabel, name: name, type: type!, range: range!, nameRange: nameRange!)
            
        default:
            fputs("Unknown method parameter kind: \(kind)", stderr)
            return nil
        }
    }
    
    private func tokenize(imports otherTokens: [Token]) -> [Token] {
        let rangesToIgnore: [CountableRange<Int>] = otherTokens.flatMap { token in
            switch token {
            case let container as ContainerToken:
                return container.range
            case let extensionToken as ExtensionDeclaration:
                return extensionToken.range
            default:
                return nil
            }
        }
        do {
            let regex = try NSRegularExpression(pattern: "(?:\\b|;)import(?:\\s|(?:\\/\\/.*\\n)|(?:\\/\\*.*\\*\\/))+([^\\s;\\/]+)", options: [])
            let results = regex.matches(in: source, options: [], range: NSMakeRange(0, source.characters.count))
            return results.filter { result in
                    rangesToIgnore.filter { $0 ~= result.range.location }.isEmpty
                }.map {
                    let libraryRange = $0.rangeAt(1)
                    let fromIndex = source.index(source.startIndex, offsetBy: libraryRange.location)
                    let toIndex = source.index(fromIndex, offsetBy: libraryRange.length)
                    let library = source.substring(with: fromIndex..<toIndex)
                    let range = $0.range.location..<($0.range.location + $0.range.length)
                    return Import(range: range, library: library)
                }
        } catch let error as NSError {
            fatalError("Invalid regex:" + error.description)
        }
    }
}
