Pod::Spec.new do |s|

  s.name         = "Xia"
  s.version      = "0.0.2"
  s.summary      = "🌟 Naughty flexible alert view above the navigation bar. Support: https://LeoDev.me"
  s.homepage     = "https://github.com/iTofu/Xia"
  s.license      = "MIT"
  s.author             = { "Leo" => "devtip@163.com" }
  s.social_media_url   = "https://LeoDev.me"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/iTofu/Xia.git", :tag => s.version }
  s.source_files = "Xia/*.swift"
  s.resource     = "Xia/Xia.bundle"
  s.requires_arc = true

  s.ios.deployment_target = "8.0"

  s.dependency "SnapKit", "~> 3.2.0"

end
