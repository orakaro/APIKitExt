#
# Be sure to run `pod lib lint APIKitExt.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'APIKitExt'
  s.version          = '0.0.1'
  s.summary          = 'Useful extensions for APIKit'
  s.dependency       'ObjectMapper', '2.2.2'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
APIKitExt is a set of useful extension to work with APIKit and libraries such as ObjectMapper etc
                       DESC

  s.homepage         = 'https://github.com/DTVD/APIKitExt'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Orakaro' => 'nhatminh_179@hotmail.com' }
  s.source           = { :git => 'https://github.com/DTVD/APIKitExt.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'APIKitExt/Classes/**/*'

  # s.resource_bundles = {
  #   'APIKitExt' => ['APIKitExt/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
