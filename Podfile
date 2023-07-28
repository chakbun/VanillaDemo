# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

$DYProjectFolder = 'VanillaTasDiary'
$DYImportServiceNames = Array['NetworkConfig', 'Oss', 'NetworkTime']

target 'VanillaTasDiary' do
  # Comment the next line if you don't want to use dynamic frameworks
#  use_frameworks!
  inhibit_all_warnings!

source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/aliyun/aliyun-specs.git'
source 'https://git.2tianxin.com/zygote/zygotespec.git'

  # Pods for VanillaTasDiary

pod 'Masonry'
pod 'UIColor-ColorWithHexAndAlpha'
pod 'SVProgressHUD'
pod 'AliyunOSSiOS', '2.10.15'
pod 'ZygoteNetwork', '1.1.57'
#pod 'ZygoteNetwork', :path => '../ZygoteNetwork/ZygoteNetwork.podspec'
pod 'DYBusinessServices', '0.1.999.1.SNAPSHOT'
pod 'BlocksKit','0.0.4.6.SNAPSHOT',:source => "https://git.2tianxin.com/zygote/zygotespec.git"
pod 'ZygoteFoundation', '1.0.33'
pod 'AliyunOSSiOS', '2.10.15'
pod 'YYText', '1.0.7'
pod 'ZygoteDeviceUtils', '1.0.8'
pod 'ZygoteBaseSDK', '1.0.7'
  
end

PREPROCESSOR_DEFINITIONS = Array['$(inherited)','IS_MIZHUA=1']
PREPROCESSOR_DEFINITIONS_INTELNAL = PREPROCESSOR_DEFINITIONS + Array['INTELNAL_VERSION=1']
post_install do |installer|
    # Get main project development team id
    dev_team = ""
    project = installer.aggregate_targets[0].user_project
    project.targets.each do |target|
        target.build_configurations.each do |config|
            if dev_team.empty? and !config.build_settings['DEVELOPMENT_TEAM'].nil?
                dev_team = config.build_settings['DEVELOPMENT_TEAM']
            end
        end
    end
      
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
          
            config.build_settings['DEVELOPMENT_TEAM'] = dev_team
          
            if target.name == 'ZygoteBaseSDK' || target.name == 'ZygoteCategories' || target.name == 'ZygoteFoundation' || target.name == 'DYBusinessServices' || target.name == 'ZygoteNetwork'
              if config.name != 'Release'
                config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] = PREPROCESSOR_DEFINITIONS_INTELNAL
              else
              config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] = PREPROCESSOR_DEFINITIONS
              end
            end
            if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 9.0
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
            end
        end
    end
    
  find_and_replace("Pods/matrix-wechat/matrix/matrix-iOS/Matrix/WCCrashBlockMonitor/KSCrash/Recording/Monitors/KSCrash_fishhook.c",
                   "                    indirect_symbol_bindings[i] = cur->rebindings[j].replacement;",
                   "                    if (i < (sizeof(indirect_symbol_bindings) / sizeof(indirect_symbol_bindings[0]))) { indirect_symbol_bindings[i] = cur->rebindings[j].replacement; }")

end
def find_and_replace(dir, findstr, replacestr)
  Dir[dir].each do |name|
      FileUtils.chmod("+w", name) #add
      text = File.read(name)
      replace = text.gsub(findstr,replacestr)
      if text != replace
          puts "Fix: " + name
          File.open(name, "w") { |file| file.puts replace }
          STDOUT.flush
      end
  end
  Dir[dir + '*/'].each(&method(:find_and_replace))
end
