
Pod::Spec.new do |spec|

  spec.name         = "ELKCommonMaster"
  spec.version      = "0.0.1"
  spec.summary      = "通用三方库集成：1）微信登录、分享、支付；2）QQ登录、分享；3）新浪微博登录、分享"

  spec.description  = <<-DESC
                    通用三方库集成：
                    1）微信登录、分享、支付功能；
                    2）QQ登录、分享功能；
                    3）新浪微博登录、分享功能。
                   DESC

  spec.homepage     = "https://github.com/elkshrek/ELKCommon-master"

  spec.license      = "MIT"

  spec.author       = { "Jonathan" => "Jonathan_dk@163.com" }

  spec.platform     = :ios
  
  spec.source       = { :git => "https://github.com/elkshrek/ELKCommon-master.git", :tag => "#{spec.version}" }
  
  spec.requires_arc = true
  
  
  
  spec.subspec 'ELKModule' do |modSpec|
  
    modSpec.source_files = 'ELKCommonMaster/ELKModule/**/*.{h,m}'
    modSpec.ios.frameworks = 'Foundation', 'UIKit'
    
  end
  
  spec.subspec 'ELKSinaSDK' do |sinaSDKSpec|
  
    sinaSDKSpec.source_files = 'ELKCommonSDK/ELKSinaSDK/**/*.{h,m}'
    sinaSDKSpec.vendored_libraries  = 'ELKCommonSDK/ELKSinaSDK/libWeiboSDK.a'
    sinaSDKSpec.resources           = 'ELKCommonSDK/ELKSinaSDK/WeiboSDK.bundle'
         
    sinaSDKSpec.frameworks          = 'Photos', 'ImageIO', 'SystemConfiguration', 'CoreText', 'QuartzCore', 'Security', 'UIKit', 'Foundation', 'CoreGraphics','CoreTelephony'
    sinaSDKSpec.libraries           = 'sqlite3', 'z'
    
  end
  
  spec.subspec 'ELKSina' do |sinaSpec|
  
    sinaSpec.source_files = 'ELKCommonMaster/ELKSina/**/*.{h,m}'
    
    sinaSpec.dependency 'ELKCommonMaster/ELKModule'
    sinaSpec.dependency 'ELKCommonMaster/ELKSinaSDK'
    
  end
  
  
  

end
