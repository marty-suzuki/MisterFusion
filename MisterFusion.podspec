#
# Be sure to run `pod lib lint MisterFusion.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MisterFusion"

  s.version          = "5.0.0"

  s.summary          = "MisterFusion makes more easier to use AutoLayout in Swift & Objective-C code."

  s.homepage         = "https://github.com/marty-suzuki/MisterFusion"

  s.license          = 'MIT'
  s.author           = { "Taiki Suzuki" => "s1180183@gmail.com" }
  s.source           = { :git => "https://github.com/marty-suzuki/MisterFusion.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/marty_suzuki'

  s.ios.deployment_target  = "8.0"
  s.tvos.deployment_target = "10.0"
  s.osx.deployment_target = "10.11"
  s.requires_arc = true
  s.swift_version = '5.0'

  s.source_files = 'MisterFusion/*.{swift}'
end
