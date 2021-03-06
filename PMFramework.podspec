#
# Be sure to run `pod lib lint PMFramework.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PMFramework"
  s.version          = "0.1.1"
  s.summary          = "A short description of PMFramework."
  s.description      = <<-DESC
                       An optional longer description of PMFramework

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/brbulic/PMFramework"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Bruno Bulic" => "brbulic@gmail.com" }
  s.source           = { :git => "https://github.com/brbulic/PMFramework.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/brbulic'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'PMFramework' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'PMPracticFunction'
end
