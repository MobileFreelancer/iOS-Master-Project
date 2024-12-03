# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'SwiftMasterProject' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  
  post_install do |installer_representation|
      installer_representation.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
              config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
          end
      end
  end
  
  # Pods for SwiftMasterProject
  
pod 'SDWebImage'
pod 'Alamofire'
pod 'GoogleSignIn'
pod 'FacebookCore'
pod 'FacebookLogin'
pod 'FacebookShare'
pod 'Firebase/Analytics'
pod 'Firebase/Messaging'
pod 'Firebase/Database'
pod 'Firebase/Auth'
pod 'Firebase/Core'
pod 'Firebase/Messaging'
pod 'Cosmos'

end
