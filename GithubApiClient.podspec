#
# Be sure to run `pod lib lint GithubApiClient.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GithubApiClient'
  s.version          = '0.1.0'
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
  s.source           = { :git => 'https://github.com/MohamedMatloub/GithubApiClient.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'GithubApiClient/**/*.{h,m}'
  s.default_subspec = 'L'
  
  s.subspec 'L' do |l|
    l.source_files = 'GithubApiClient/**/*.{h,m}'
  end

  s.subspec 'Networking' do |networking|
    networking.dependency 'AFNetworking', '~> 4.0'
  end
end



