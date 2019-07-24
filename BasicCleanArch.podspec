#
# Be sure to run `pod lib lint BasicCleanArch.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BasicCleanArch'
  s.version          = '5.1.0'
  s.summary          = 'A set of helpful protocols for a basic mobile version of Robert C. Martin\'s Clean Architecture.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Robert C. Martin\'s Clean Architecture is very helpful to write well structured and testable code. However, existing variants for mobile development are sometimes hard to understand for beginners or inappropriate for small projects. Basic clean architecture is a set of helpful protocols for the basic concepts of Clean Architecture like Interactors, Entities, Presenters, and Boundaries.
                       DESC

  s.homepage         = 'https://github.com/RobinNunkesser/basiccleanarch-cocoapod'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Robin Nunkesser' => 'robin.nunkesser@hshl.de' }
  s.source           = { :git => 'https://github.com/RobinNunkesser/basiccleanarch-cocoapod.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_version = '5.0'

  s.ios.deployment_target = '8.0'

  s.source_files = 'BasicCleanArch/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BasicCleanArch' => ['BasicCleanArch/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
