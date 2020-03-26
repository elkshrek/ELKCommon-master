
Pod::Spec.new do |spec|

    spec.name         = "ELKCommonMaster"
    spec.version      = "0.0.3"
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
  
  
  
    spec.public_header_files = 'ELKCommonMaster/ELKCommonMaster.h'
    spec.source_files = 'ELKCommonMaster/ELKCommonMaster.{h,m}'

    spec.subspec 'ELKModule' do |modSpec|
        modSpec.source_files = 'ELKCommonMaster/ELKModule/**/*.{h,m}'
        modSpec.public_header_files = 'ELKCommonMaster/ELKModule/**/*.h'
        modSpec.ios.frameworks = 'Foundation', 'UIKit'
    end

    spec.subspec 'ELKSina' do |sinaSpec|
        sinaSpec.source_files = 'ELKCommonMaster/ELKSina/**/*.{h,m}'
        sinaSpec.public_header_files = 'ELKCommonMaster/ELKSina/**/*.h'

        sinaSpec.dependency 'ELKCommonMaster/ELKModule'
        sinaSpec.vendored_libraries 'ELKWeiboSDK'
        
        sinaSpec.frameworks          = 'Photos', 'ImageIO', 'SystemConfiguration', 'CoreText', 'QuartzCore', 'Security', 'UIKit', 'Foundation', 'CoreGraphics','CoreTelephony'
        sinaSpec.libraries           = 'sqlite3', 'z'
    end

    spec.subspec 'ELKTencent' do |tenSpec|
        tenSpec.source_files = 'ELKCommonMaster/ELKTencent/**/*.{h,m}'
        tenSpec.public_header_files = 'ELKCommonMaster/ELKTencent/**/*.h'
        
        tenSpec.dependency 'ELKCommonMaster/ELKModule'
        tenSpec.vendored_frameworks "ELKTencentOpenSDK"
        
        tenSpec.ios.frameworks = 'Foundation', 'UIKit', 'ImageIO', 'QuartzCore', 'CoreText', 'WebKit', 'CoreGraphics', 'CoreTelephony', 'Security', 'SystemConfiguration'
        tenSpec.libraries           = 'sqlite3', 'z', 'c++', 'iconv'
    end

    spec.subspec 'ELKWeChat' do |weSpec|
        weSpec.source_files = 'ELKCommonMaster/ELKWeChat/**/*.{h,m}'
        weSpec.public_header_files = 'ELKCommonMaster/ELKWeChat/**/*.h'

        weSpec.dependency 'ELKCommonMaster/ELKModule'
        weSpec.vendored_libraries 'WechatOpenSDK'

        weSpec.ios.frameworks = 'Foundation', 'UIKit', 'ImageIO', 'QuartzCore', 'CoreText', 'WebKit', 'CoreGraphics', 'CoreTelephony', 'Security', 'SystemConfiguration'
        weSpec.libraries     = 'sqlite3', 'z', 'c++', 'iconv'
    end
    
    
end
