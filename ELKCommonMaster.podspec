
Pod::Spec.new do |spec|

    spec.name         = 'ELKCommonMaster'
    spec.version      = '0.1.4'
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
    

    spec.subspec 'ELKModule' do |modSpec|
        modSpec.source_files = 'ELKCommonMaster/ELKModule/**/*.{h,m}'
        modSpec.public_header_files = 'ELKCommonMaster/ELKModule/**/*.h'
        
        modSpec.ios.frameworks = 'Foundation', 'UIKit'
    end
    
    spec.subspec 'ELKTencent' do |tenSpec|
        tenSpec.source_files = 'ELKCommonMaster/ELKTencent/**/*.{h,m}'
        
        tenSpec.dependency 'ELKCommonMaster/ELKModule'
        tenSpec.dependency 'ELKTencentOpenSDK'
        
        tenSpec.frameworks = 'Security', 'SystemConfiguration', 'CoreGraphics', 'CoreTelephony', 'WebKit'
        tenSpec.libraries   = 'iconv', 'z', 'c++', 'sqlite3'
    end

    
    
end
