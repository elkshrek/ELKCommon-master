
Pod::Spec.new do |spec|

    spec.name         = "ELKCommonMaster"
    spec.version      = "0.0.5"
    spec.summary      = "简单易用通用三方库集成：1）微信登录、分享、支付；2）QQ登录、分享；3）新浪微博登录、分享"

    spec.description  = <<-DESC
                    简单易用通用三方库集成：
                    1）微信登录、分享、支付功能；
                    2）QQ登录、分享功能；
                    3）新浪微博登录、分享功能。
                   DESC

    spec.homepage     = "https://github.com/elkshrek/ELKCommon-master"

    spec.license      = "MIT"

    spec.author       = { "Jonathan" => "Jonathan_dk@163.com" }

    spec.requires_arc = true
    spec.platform     = :ios, '9.0'
  
    spec.source       = { :git => "https://github.com/elkshrek/ELKCommon-master.git", :tag => "#{spec.version}" }
  
  
  
    spec.public_header_files = 'ELKCommonMaster/**/*.h'
    spec.source_files = 'ELKCommonMaster/**/*.{h,m}'

 #   spec.subspec 'ELKModule' do |modSpec|
 #       modSpec.source_files = 'ELKCommonMaster/ELKModule/**/*.{h,m}'
 #       modSpec.public_header_files = 'ELKCommonMaster/ELKModule/**/*.h'
 #       modSpec.ios.frameworks = 'Foundation', 'UIKit'
 #   end
    
    spec.subspec 'ELKWeiboSDK' do |sinaSDKSpec|
        sinaSDKSpec.vendored_libraries  = 'ELKCommonMaster/ELKWeiboSDK/libWeiboSDK.a'
        sinaSDKSpec.resources           = 'ELKCommonMaster/ELKWeiboSDK/WeiboSDK.bundle'
        sinaSDKSpec.source_files        = 'ELKCommonMaster/ELKWeiboSDK/**/*.{h,m}'
        
        sinaSDKSpec.frameworks          = 'Photos', 'ImageIO', 'SystemConfiguration', 'CoreText', 'QuartzCore', 'Security', 'UIKit', 'Foundation', 'CoreGraphics','CoreTelephony'
        sinaSDKSpec.libraries           = 'sqlite3', 'z'
    end
    
   # spec.subspec 'ELKSina' do |sinaSpec|
   #     sinaSpec.source_files = 'ELKCommonMaster/ELKSina/**/*.{h,m}'
   #     sinaSpec.public_header_files = 'ELKCommonMaster/ELKSina/**/*.h'

   #     sinaSpec.dependency 'ELKCommonMaster/ELKModule'
   #     sinaSpec.dependency 'ELKCommonMaster/ELKWeiboSDK'
        
   # end
    
    spec.subspec 'ELKTencentOpenSDK' do |tenSDKSpec|
        tenSDKSpec.ios.vendored_frameworks = 'ELKCommonMaster/ELKTencentOpenSDK/*.framework'
        
        tenSDKSpec.ios.frameworks      = 'Foundation', 'UIKit', 'ImageIO', 'QuartzCore', 'CoreText', 'WebKit', 'CoreGraphics', 'CoreTelephony', 'Security', 'SystemConfiguration'
        tenSDKSpec.libraries           = 'sqlite3', 'z', 'c++', 'iconv'
    end
    
  #  spec.subspec 'ELKTencent' do |tenSpec|
  #      tenSpec.source_files = 'ELKCommonMaster/ELKTencent/**/*.{h,m}'
  #      tenSpec.public_header_files = 'ELKCommonMaster/ELKTencent/**/*.h'
        
   #     tenSpec.dependency 'ELKCommonMaster/ELKModule'
   #     tenSpec.dependency 'ELKCommonMaster/ELKTencentOpenSDK'
        
   # end
    
    spec.subspec 'ELKWechatOpenSDK' do |tenSDKSpec|
        tenSDKSpec.vendored_libraries  = 'ELKCommonMaster/ELKTencentOpenSDK/libWeChatSDK.a'
        tenSDKSpec.source_files        = 'ELKCommonMaster/ELKTencentOpenSDK/**/*.{h,m}'

        tenSDKSpec.ios.frameworks = 'Foundation', 'UIKit', 'ImageIO', 'QuartzCore', 'CoreText', 'WebKit', 'CoreGraphics', 'CoreTelephony', 'Security', 'SystemConfiguration'
        tenSDKSpec.libraries     = 'sqlite3', 'z', 'c++', 'iconv'
    end
    
  #  spec.subspec 'ELKWeChat' do |weSpec|
  #     weSpec.source_files = 'ELKCommonMaster/ELKWeChat/**/*.{h,m}'
  #      weSpec.public_header_files = 'ELKCommonMaster/ELKWeChat/**/*.h'

   #     weSpec.dependency 'ELKCommonMaster/ELKModule'
    #    weSpec.dependency 'ELKCommonMaster/ELKWechatOpenSDK'
        
   # end
    
    
    spec.dependency 'ELKCommonMaster/ELKWechatOpenSDK'
    spec.dependency 'ELKCommonMaster/ELKTencentOpenSDK'
    spec.dependency 'ELKCommonMaster/ELKWeiboSDK'
    
end
