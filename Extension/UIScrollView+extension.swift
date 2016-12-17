//
//  String+extension.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/01/23.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    public func width() -> CGFloat {
        return self.frame.size.width
    }
    
    public func height() -> CGFloat {
        return self.frame.size.height
    }
    
    public func currentIndex() -> Int {
        guard width() != 0 else {return 0}
        let offsetX = self.contentOffset.x
        let index = offsetX/width()
        return Int(index)
    }
    
    public func move(to index:Int) {
        let move = self.width() * CGFloat(index);
        self.scrollRectToVisible(
            CGRect(x: move , y: 0, width: width(), height: height()), animated: true)
    }
}
