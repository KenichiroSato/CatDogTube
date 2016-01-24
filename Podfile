platform :ios, '8.0'
use_frameworks!
xcodeproj './CatDogTube.xcodeproj'

pod 'HMSegmentedControl'
pod 'SDWebImage', '~>3.7'
pod 'SwiftyJSON', :git => 'https://github.com/SwiftyJSON/SwiftyJSON.git'

post_install do | installer |
  require 'fileutils'
  FileUtils.cp_r('Pods/Target Support Files/Pods/Pods-Acknowledgements.plist', 'CatDogTube/Settings.bundle/Acknowledgements.plist', :remove_destination => true)
end