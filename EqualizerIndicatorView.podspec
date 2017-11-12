# Be sure to run `pod lib lint EqualizerIndicatorView.podspec' to ensure this is a
# valid spec before submitting.

Pod::Spec.new do |s|
  s.name             = 'EqualizerIndicatorView'
  s.version          = '2.0.0'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.summary          = 'Visually indicate the play, pause, or stop state of audio.'
  s.homepage         = 'https://github.com/AlexGivens/EqualizerIndicatorView'
  s.social_media_url = 'https://twitter.com/AlexGivens_'
  s.author           = { 'Alexander Givens' => 'mail@alexgivens.com' }
  s.source           = { :git => 'https://github.com/AlexGivens/EqualizerIndicatorView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'Source/EqualizerIndicatorView.swift'
  s.frameworks = 'UIKit'
end
