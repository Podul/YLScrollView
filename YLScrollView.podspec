#
#  Be sure to run `pod spec lint YLScrollView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "YLScrollView"
  s.version      = "0.0.1"
  s.summary      = "延迟加载 childViewController 的 view."

  s.description  = <<-DESC 
                          init
                   DESC
  
  s.homepage     = "https://github.com/Podul/YLScrollView"
  s.license      = "MIT"
  s.author             = { "Podul" => "ylpodul@gmail.com" }
  s.source       = { :git => "https://github.com/Podul/YLScrollView.git", :tag => "#{s.version}" }
  s.source_files  = "YLScrollView/*.{h,m}"

end
