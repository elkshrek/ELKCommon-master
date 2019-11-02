
Pod::Spec.new do |spec|

  spec.name         = "ELKCommonMaster"
  spec.version      = "1.0.0"
  spec.summary      = "通用三方库集成：1）微信登录、分享、支付；2）QQ登录、分享；3）新浪微博登录、分享"

  spec.description  = <<-DESC
                    通用三方库集成：1）微信登录、分享、支付功能；2）QQ登录、分享功能；3）新浪微博登录、分享功能
                   DESC

  spec.homepage     = "https://github.com/elkshrek/ELKCommon-master"

  spec.license      = "MIT"

  spec.author       = { "Jonathan" => "Jonathan_dk@163.com" }

  spec.platform     = :ios
  

  spec.source       = { :git => "https://github.com/elkshrek/ELKCommon-master.git", :tag => "#{spec.version}" }


  
  spec.subspec 'ELKWeChat' do |weSpec|
      weSpec.source_files = 'ELKCommonMaster/ELKWeChat/**/*.{h,m}'
      weSpec.vendored_libraries  = "ELKCommonMaster/ELKWeChat/WeChatSDK/*.a"
      weSpec.frameworks = "Security", "CoreGraphics", "WebKit"
      weSpec.libraries   = "iconv", "z", "c++", "sqlite3"
      
    #  weSpec.dependency 'WechatOpenSDK'
    #  weSpec.ios.frameworks = 'Foundation', 'UIKit'
  end
  
  spec.subspec 'ELKTencent' do |tenSpec|
      tenSpec.source_files = 'ELKCommonMaster/ELKTencent/**/*.{h,m}'
      tenSpec.ios.vendored_frameworks = "ELKCommonMaster/ELKTencent/TencentSDK/*.framework"
      tenSpec.frameworks = "Security", "SystemConfiguration", "CoreGraphics", "CoreTelephony", "WebKit"
      tenSpec.libraries   = "iconv", "z", "c++", "sqlite3"
    #  tenSpec.dependency 'ELKTencentOpenSDK'
     # tenSpec.ios.frameworks = 'Foundation', 'UIKit'
  end
  
  spec.subspec 'ELKSina' do |sinaSpec|
      sinaSpec.source_files = 'ELKCommonMaster/ELKSina/**/*.{h,m}'
      sinaSpec.vendored_libraries  = "ELKCommonMaster/ELKSina/SinaSDK/*.a"
      sinaSpec.resources           = "ELKCommonMaster/ELKSina/SinaSDK/*.bundle"
      
      sinaSpec.frameworks          = 'Photos', 'ImageIO', 'SystemConfiguration', 'CoreText', 'QuartzCore', 'Security', 'UIKit', 'Foundation', 'CoreGraphics','CoreTelephony'
      sinaSpec.libraries           = 'sqlite3', 'z'
    #  sinaSpec.dependency 'ELKWeiboSDK'
     # sinaSpec.ios.frameworks = 'Foundation', 'UIKit'
  end
  
  spec.subspec 'ELKModule' do |modSpec|
      modSpec.source_files = 'ELKCommonMaster/ELKModule/**/*.{h,m}'
  #    modSpec.ios.frameworks = 'Foundation', 'UIKit'
  end
  
  spec.source_files  = "ELKCommonMaster", "ELKCommonMaster/ELKCommonMaster.{h,m}"
 # spec.source_files  = "ELKCommonMaster", "ELKCommonMaster/**/*.{h,m}"
  spec.ios.frameworks = 'Foundation', 'UIKit', 'ImageIO', 'QuartzCore', 'CoreText', 'WebKit', 'CoreGraphics', 'CoreTelephony', 'Security', 'SystemConfiguration'
  spec.libraries           = 'sqlite3', 'z', 'c++', 'iconv'
  
#  spec.dependency 'WechatOpenSDK'
#  spec.dependency 'ELKTencentOpenSDK'
 # spec.dependency 'ELKWeiboSDK'
  
  spec.requires_arc = true
  

end
