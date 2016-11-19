# Uncomment the next line to define a global platform for your project
 platform :ios, '9.0'
 project './CatDogTube.xcodeproj'

target 'CatDogTube' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CatDogTube
  pod 'HMSegmentedControl'
  pod 'SDWebImage', '~>3.7'
  pod 'SwiftyJSON', '3.0.0'
  pod 'youtube-ios-player-helper', '0.1.6'
  pod 'PopupDialog', :git => 'https://github.com/Orderella/PopupDialog.git', :branch => 'Swift3'
  pod 'Fabric'
  pod 'Crashlytics'

  target 'CatDogTubeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CatDogTubeUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do | installer |
  require 'fileutils'
  FileUtils.cp_r('Pods/Target Support Files/Pods-CatDogTube/Pods-CatDogTube-acknowledgements.plist', 'CatDogTube/Settings.bundle/Acknowledgements.plist', :remove_destination => true)
end