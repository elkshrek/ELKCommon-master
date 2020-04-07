
Pod::Spec.new do |spec|

    spec.name         = 'ELKCommonMaster'
    spec.version      = '0.2.4'
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
    

    spec.subspec 'ELKModule' do |modSpec|
        modSpec.source_files = 'ELKCommonMaster/ELKModule/**/*.{h,m}'
        modSpec.public_header_files = 'ELKCommonMaster/ELKModule/**/*.h'
        
        modSpec.ios.frameworks = 'Foundation', 'UIKit'
    end
    
    spec.subspec 'ELKTencentSDK' do |ets|
        ets.ios.vendored_frameworks = "ELKCommonSDK/ELKTencentSDK/*.framework"
        
        ets.frameworks = "Security", "SystemConfiguration", "CoreGraphics", "CoreTelephony", "WebKit"
        ets.libraries  = "iconv", "z", "c++", "sqlite3"
    end
    
    spec.subspec 'ELKTencent' do |tenSpec|
        tenSpec.source_files = 'ELKCommonMaster/ELKTencent/**/*.{h,m}'
        tenSpec.public_header_files = 'ELKCommonMaster/ELKTencent/**/*.h'
        
        tenSpec.dependency 'ELKCommonMaster/ELKTencentSDK'
        tenSpec.dependency 'ELKCommonMaster/ELKModule'
    end

    
    spec.subspec 'ELKSinaSDK' do |ews|
        ews.ios.vendored_frameworks = "ELKCommonSDK/ELKSinaSDK/*.framework"
        ews.resources           = "ELKCommonSDK/ELKSinaSDK/WeiboSDK.bundle"
        
        ews.frameworks          = 'Photos', 'ImageIO', 'SystemConfiguration', 'CoreText', 'QuartzCore', 'Security', 'UIKit', 'Foundation', 'CoreGraphics','CoreTelephony'
        ews.libraries           = 'sqlite3', 'z'
    end
    
#    spec.subspec 'ELKSina' do |sinaSpec|
#        sinaSpec.source_files = 'ELKCommonMaster/ELKSina/**/*.{h,m}'
#        sinaSpec.public_header_files = 'ELKCommonMaster/ELKSina/**/*.h'
        
#        sinaSpec.dependency 'ELKCommonMaster/ELKSinaSDK'
#        sinaSpec.dependency 'ELKCommonMaster/ELKModule'
#    end
    
    
    
    
    
end
