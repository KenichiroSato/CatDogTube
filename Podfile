source "https://github.com/CocoaPods/Old-Specs"

platform :ios, '9.0'
use_frameworks!
xcodeproj './CatDogTube.xcodeproj'

pod 'HMSegmentedControl'
pod 'SDWebImage', '~>3.7'
pod 'SwiftyJSON', :git => 'https://github.com/IBM-Swift/SwiftyJSON.git'
pod 'youtube-ios-player-helper', '0.1.6'
pod 'PopupDialog', :git => 'https://github.com/Orderella/PopupDialog.git', :branch => 'Swift3'

pod 'Fabric'
pod 'Crashlytics'

post_install do | installer |
  require 'fileutils'
  FileUtils.cp_r('Pods/Target Support Files/Pods/Pods-Acknowledgements.plist', 'CatDogTube/Settings.bundle/Acknowledgements.plist', :remove_destination => true)
end