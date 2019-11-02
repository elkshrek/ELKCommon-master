
Pod::Spec.new do |spec|

  spec.name         = "ELKCommonMaster"
  spec.version      = "1.0.0"
  spec.summary      = "通用三方库集成：1）微信登录、分享、支付；2）QQ登录、分享；3）新浪微博登录、分享"

  spec.description  = <<-DESC
                    通用三方库集成：1）微信登录、分享、支付功能；2）QQ登录、分享功能；3）新浪微博登录、分享功能
                   DESC

  spec.homepage     = "https://github.com/elkshrek/ELKCommon-master"

  spec.license      = "MIT"

  spec.author             = { "Jonathan" => "Jonathan_dk@163.com" }

  spec.platform     = :ios
  

  spec.source       = { :git => "https://github.com/elkshrek/ELKCommon-master.git", :tag => "#{spec.version}" }


  
  spec.subspec 'ELKWeChat' do |weSpec|
      weSpec.source_files = 'ELKCommon-master/ELKCommonMaster/ELKWeChat/**/*.{h,m}'
    #  weSpec.dependency 'WechatOpenSDK'
      weSpec.ios.frameworks = 'Foundation', 'UIKit'
  end
  
  spec.subspec 'ELKTencent' do |tenSpec|
      tenSpec.source_files = 'ELKCommon-master/ELKCommonMaster/ELKTencent/**/*.{h,m}'
    #  tenSpec.dependency 'ELKTencentOpenSDK'
      tenSpec.ios.frameworks = 'Foundation', 'UIKit'
  end
  
  spec.subspec 'ELKSina' do |sinaSpec|
      sinaSpec.source_files = 'ELKCommon-master/ELKCommonMaster/ELKSina/**/*.{h,m}'
    #  sinaSpec.dependency 'ELKWeiboSDK'
      sinaSpec.ios.frameworks = 'Foundation', 'UIKit'
  end
  
  spec.subspec 'ELKModule' do |modSpec|
      modSpec.source_files = 'ELKCommon-master/ELKCommonMaster/ELKModule/**/*.{h,m}'
      modSpec.ios.frameworks = 'Foundation', 'UIKit'
  end
  
  spec.source_files  = "ELKCommonMaster", "ELKCommon-master/ELKCommonMaster/ELKCommonMaster.{h,m}"
 # spec.source_files  = "ELKCommonMaster", "ELKCommon-master/ELKCommonMaster/**/*.{h,m}"
  spec.ios.frameworks = 'Foundation', 'UIKit'
  
  spec.dependency 'ELKChainedAlloy'
  
  spec.requires_arc = true
  

end
