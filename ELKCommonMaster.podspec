
Pod::Spec.new do |spec|

    spec.name         = 'ELKCommonMaster'
    spec.version      = '1.0.9'
    spec.summary      = '简单易用通用三方库集成：1）微信登录、分享、支付；2）QQ登录、分享；3）新浪微博登录、分享'
    spec.description  = <<-DESC
                    简单易用通用三方库集成：
                    1）微信登录、分享、支付功能；
                    2）QQ登录、分享功能；
                    3）新浪微博登录、分享功能。
                   DESC

    spec.homepage     = 'https://github.com/elkshrek/ELKCommon-master'
    spec.license      = 'MIT'
    spec.author       = { "Jonathan" => "Jonathan_dk@163.com" }
    spec.requires_arc = true
    spec.platform     = :ios, '9.0'
  
    spec.source       = { :git => "https://github.com/elkshrek/ELKCommon-master.git", :tag => "#{spec.version}" }
    
    spec.frameworks = 'Security', 'SystemConfiguration', 'CoreGraphics', 'CoreTelephony', 'WebKit', 'Foundation', 'UIKit'
    spec.libraries   = 'iconv', 'z', 'c++', 'sqlite3'
    
    spec.source_files = 'ELKCommonMaster/ELKCommonMaster.{h,m}'
    spec.public_header_files = 'ELKCommonMaster/ELKCommonMaster.h'
    
    spec.subspec 'ELKModule' do |modSpec|
        modSpec.ios.frameworks = 'Foundation', 'UIKit'
        
        modSpec.source_files = 'ELKCommonMaster/ELKModule/**/*.{h,m}'
        modSpec.public_header_files = 'ELKCommonMaster/ELKModule/**/*.h'
    end
    
    spec.subspec 'ELKTencentSDK' do |ets|
        ets.frameworks = "Security", "SystemConfiguration", "CoreGraphics", "CoreTelephony", "WebKit"
        ets.libraries  = "iconv", "z", "c++", "sqlite3"
        
        ets.ios.vendored_frameworks = "ELKCommonSDK/ELKTencentSDK/*.framework"
    end
    
    spec.subspec 'ELKTencent' do |tenSpec|
        tenSpec.dependency 'ELKCommonMaster/ELKTencentSDK'
        tenSpec.dependency 'ELKCommonMaster/ELKModule'
        
        tenSpec.source_files = 'ELKCommonMaster/ELKTencent/**/*.{h,m}'
        tenSpec.public_header_files = 'ELKCommonMaster/ELKTencent/**/*.h'
    end
    
    spec.subspec 'ELKWeChatSDK' do |wcs|
        wcs.vendored_libraries  = "ELKCommonSDK/ELKWechatSDK/*.a"
        wcs.source_files        = "ELKCommonSDK/ELKWechatSDK/**/*.{h,m}"
        wcs.public_header_files = "ELKCommonSDK/ELKWechatSDK/**/*.h"
        
        wcs.frameworks          = 'Photos', 'ImageIO', 'SystemConfiguration', 'CoreText', 'QuartzCore', 'Security', 'UIKit', 'Foundation', 'CoreGraphics','CoreTelephony'
        wcs.libraries           = 'sqlite3', 'z'
    end
    
    spec.subspec 'ELKWeChat' do |weSpec|
        weSpec.dependency 'ELKCommonMaster/ELKWeChatSDK'
        weSpec.dependency 'ELKCommonMaster/ELKModule'
    
        weSpec.source_files = 'ELKCommonMaster/ELKWeChat/**/*.{h,m}'
        weSpec.public_header_files = 'ELKCommonMaster/ELKWeChat/**/*.h'
    end
    
    
    spec.subspec 'ELKSinaSDK' do |ews|
        ews.frameworks          = 'Photos', 'ImageIO', 'SystemConfiguration', 'CoreText', 'QuartzCore', 'Security', 'UIKit', 'Foundation', 'CoreGraphics','CoreTelephony','WebKit'
        ews.libraries           = 'sqlite3', 'z'
        ews.requires_arc        = false
        
        ews.vendored_libraries  = "ELKCommonSDK/ELKSinaSDK/libWeiboSDK.a"
        ews.resources           = "ELKCommonSDK/ELKSinaSDK/WeiboSDK.bundle"
        ews.source_files        = "ELKCommonSDK/ELKSinaSDK/**/*.{h,m}"
    end
    
    spec.subspec 'ELKSina' do |sinaSpec|
        sinaSpec.dependency 'ELKCommonMaster/ELKSinaSDK'
        sinaSpec.dependency 'ELKCommonMaster/ELKModule'
        
        sinaSpec.source_files = 'ELKCommonMaster/ELKSina/**/*.{h,m}'
        sinaSpec.public_header_files = 'ELKCommonMaster/ELKSina/**/*.h'
    end
    
    
    
end
