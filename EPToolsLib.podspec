Pod::Spec.new do |s|
  s.name         = "EPToolsLib" # 项目名称
  s.version      = "0.0.2"        # 版本号 与 你仓库的 标签号 对应
  s.license      = "MIT"          # 开源证书
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.summary      = "EP工具类" # 项目简介
  s.author             = { "BY" => "qiubaiying@gmail.com" } 
  s.social_media_url   = "http://qiubaiying.github.io" 

  s.homepage     = "https://github.com/qiubaiying/EPToolsLib.git" # 仓库的主页
  s.source       = { :git => "https://github.com/qiubaiying/EPToolsLib.git", :tag => "#{s.version}" } #你的仓库地址，s.version 表示上面这个仓库的版本好
  # s.source = { :git => "https://github.com/xiaofei86/LPPushService.git", :commit => "68defea" } #commit => "68defea" 表示将这个Pod版本与Git仓库中某个commit绑定
  # s.source = { :git => "https://github.com/xiaofei86/LPPushService.git", :tag => 1.0.0 }        #tag => 1.0.0 表示将这个Pod版本与Git仓库中某个版本的comit绑定

  s.requires_arc = true # 是否启用ARC
  s.platform     = :ios, "9.0" #平台及支持的最低版本
  s.frameworks   = "UIKit", "Foundation" #支持的框架
  # s.dependency   = "AFNetworking" # 依赖库

  # s.source_files = "EpToolsLib/*.{h,m}", "EpToolsLib/**/*.{h,m}"
  # “*” 表示匹配所有文件
  # “*.{h,m}” 表示匹配所有以.h和.m结尾的文件
  # “**” 表示匹配所有子目录

  s.subspec 'CategoryKit' do |ss|
    ss.source_files = 'EPToolsLib/CategoryKit/*.{h,m}'
  end
  s.subspec 'WebViewJavascriptBridge' do |ss|
    ss.source_files = 'EPToolsLib/WebViewJavascriptBridge/*.{h,m}'
  end
  s.subspec 'CustomComponents' do |ss|
    ss.subspec 'MobileTextField' do |sss|
      sss.source_files = 'EPToolsLib/CustomComponents/MobileTextField/*.{h,m}'
    end
  end
  
  
 

end