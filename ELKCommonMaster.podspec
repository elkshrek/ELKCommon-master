
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
  
 # spec.public_header_files = 'ELKCommonMaster/ELKCommonMaster.h'
 # spec.source_files = 'ELKCommonMaster/ELKCommonMaster.{h,m}'
  
  
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
  
  spec.subspec 'ELKTencentSDK' do |tenSDKSpec|

    tenSDKSpec.ios.vendored_frameworks = "ELKCommonSDK/ELKTencentSDK/TencentOpenAPI.framework"

    tenSDKSpec.ios.frameworks = 'Foundation', 'UIKit', 'ImageIO', 'QuartzCore', 'CoreText', 'WebKit', 'CoreGraphics', 'CoreTelephony', 'Security', 'SystemConfiguration'
    tenSDKSpec.libraries           = 'sqlite3', 'z', 'c++', 'iconv'

  end

  spec.subspec 'ELKWeChatSDK' do |weSDKSpec|

    weSDKSpec.source_files = 'ELKCommonSDK/ELKWeChatSDK/**/*.{h,m}'
    weSDKSpec.vendored_libraries  = 'ELKCommonSDK/ELKWeChatSDK/libWeChatSDK.a'

    weSDKSpec.ios.frameworks = 'Foundation', 'UIKit', 'ImageIO', 'QuartzCore', 'CoreText', 'WebKit', 'CoreGraphics', 'CoreTelephony', 'Security', 'SystemConfiguration'
    weSDKSpec.libraries           = 'sqlite3', 'z', 'c++', 'iconv'

  end
  
  spec.subspec 'ELKSina' do |sinaSpec|
  
    sinaSpec.source_files = 'ELKCommonMaster/ELKSina/**/*.{h,m}'
    
    sinaSpec.ios.dependency 'ELKCommonMaster/ELKModule'
    sinaSpec.ios.dependency 'ELKCommonMaster/ELKSinaSDK'
    
  end
  
 # spec.subspec 'ELKTencent' do |tenSpec|
    
 #   tenSpec.source_files = 'ELKCommonMaster/ELKTencent/**/*.{h,m}'
    
  #  tenSpec.dependency 'ELKCommonMaster/ELKModule'
   # tenSpec.dependency 'ELKCommonMaster/ELKTencentSDK'

#  end
  
#  spec.subspec 'ELKWeChat' do |weSpec|
  
#    weSpec.source_files = 'ELKCommonMaster/ELKWeChat/**/*.{h,m}'
    
#    weSpec.dependency 'ELKCommonMaster/ELKModule'
#    weSpec.dependency 'ELKCommonMaster/ELKWeChatSDK'
    
#  end
  
  
end
