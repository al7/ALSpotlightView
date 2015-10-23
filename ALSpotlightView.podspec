Pod::Spec.new do |s|

  s.name         = "ALSpotlightView"
  s.version      = "0.0.2"
  s.summary      = "Custom control that simulates a modal spotlight effect."

  s.homepage     = "http://github.com/al7/ALSpotlightView"
  s.license      = "MIT"
  s.author       = { "Alex Leite" => "admin@al7dev.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/al7/ALSpotlightView.git", :tag => "0.0.3" }
  s.source_files = "ALSpotlightView/Source", "ALSpotlightView/Source/**/*.{h,m,swift}"
  s.requires_arc = true

end
