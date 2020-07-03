#
# Be sure to run `pod lib lint GithubApiClient.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GithubApiClient'
  s.version          = '1.0.1'
  s.summary          = 'A short description of GithubApiClient.'
  s.license          = 'MIT'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/MohamedMatloub/GithubApiClient'
  s.author           = { 'MohamedMatloub' => 'Mohamed.a.matloub@gmail.com' }
  s.source           = { :http => 'https://raw.githubusercontent.com/MohamedMatloub/GithubApiClient/master/GithubApiClient.framework.zip' }
  # s.source           = { :git => 'https://github.com/MohamedMatloub/GithubApiClient.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  # s.source_files = 'GithubApiClient/**/*.{h}'

  s.ios.vendored_frameworks = 'GithubApiClient.framework'
  s.default_subspecs = 'Default'
  
  s.subspec 'Default' do |s|
    s.ios.vendored_frameworks = 'GithubApiClient.framework'
  end

  s.subspec 'Networking' do |networking|
    networking.dependency 'AFNetworking', '~> 4.0'
  end
end



