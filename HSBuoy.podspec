Pod::Spec.new do |s|  
  s.name             = "HSBuoy"  
  s.version          = "0.0.1"  
  s.summary          = "A Buoy view used on iOS."  
  s.homepage         = "https://github.com/ColorPenBoy/Buoy"
  s.license          = 'MIT'  
  s.author           = { "ColorPen" => "zq252125@163.com" }  
  s.source           = { :git => "https://github.com/ColorPenBoy/Buoy.git", :tag => s.version.to_s } 
  s.platform         = :ios, '7.0'  
  s.requires_arc     = true  
  s.source_files     = 'HSBuoyView/HSBuoy.{h,m}'  
  s.frameworks       = 'Foundation', 'UIKit'  
end  
