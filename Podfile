
platform :ios, '14.0'
use_frameworks!

target "InsuranceApp" do
  pod "PromiseKit", "~> 6.8"
  pod 'Alamofire', '~> 5.2'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'SnapKit', '~> 5.0.0'
  pod("Profile", path: "Modules/Profile")
  pod("Quotes", path: "Modules/Quotes")
  pod("PopUp", path: "Modules/PopUp")
  pod("TableViewReuseableCell", path: "Modules/TableViewReuseableCell")
  
  target "InsuranceAppTests" do
    pod "PromiseKit", "~> 6.8"
    pod 'Alamofire', '~> 5.2'
    pod 'SwiftyJSON', '~> 4.0'
    pod("Profile", path: "Modules/Profile")
    pod("Quotes", path: "Modules/Quotes")
  
  end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
            config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
            config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
        end
    end
end





