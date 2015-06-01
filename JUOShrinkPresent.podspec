#
# Be sure to run `pod lib lint JUOShrinkPresent.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JUOShrinkPresent"
  s.version          = "0.1.0"
  s.summary          = "Custom presentation delegate that shrinks the VC in the back."
  s.description      = <<-DESC
                        JUOShrinkPresent is a custom presentation delegate that shrinks the ViewController
                        that stays in the back like the mail app does in iOS8 when composing a new email.
                       DESC
  s.homepage         = "https://github.com/juanuribeo13/JUOShrinkPresent"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Juan Uribe" => "juanuribeo13@gmail.com.co" }
  s.source           = { :git => "https://github.com/juanuribeo13/JUOShrinkPresent.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'JUOShrinkPresent' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
