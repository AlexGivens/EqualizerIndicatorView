<p align="center" >
    <img src="http://alexgivens.com/img/equalizer_header.gif" alt="EqualizerIndicatorView" title="EqualizerIndicatorView" style="width:520px"
</p>

[![Version](https://img.shields.io/cocoapods/v/EqualizerIndicatorView.svg?style=flat)](http://cocoapods.org/pods/EqualizerIndicatorView)
[![License](https://img.shields.io/cocoapods/l/EqualizerIndicatorView.svg?style=flat)](http://cocoapods.org/pods/EqualizerIndicatorView)
[![Platform](https://img.shields.io/cocoapods/p/EqualizerIndicatorView.svg?style=flat)](http://cocoapods.org/pods/EqualizerIndicatorView)
[![Twitter](https://img.shields.io/badge/twitter-%40AlexGivens_-blue.svg)](http://twitter.com/AlexGivens_)

## Installation

EqualizerIndicatorView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EqualizerIndicatorView', '~> 1.0.2'
```

## Usage

EqualizerIndicatorView can reflect the play, pause, and stop states of audio. After installing the Cocoapod in your project, create and animate an indicator like so:

```swift
let equalizerIndicatorView = EqualizerIndicatorView(frame: CGRect(x: 0, y: 0, width: 24, height: 18))
equalizerIndicatorView.setState(.play, animated: true)
equalizerIndicatorView.setState(.pause, animated: true)
equalizerIndicatorView.setState(.stop, animated: true)
```

EqualizerIndicatorView is designable in storyboards as well. To render an indicator in your storyboard, add a plain UIView to the view of your choice, then set the view's Class *and* Module to "EqualizerIndicatorView".

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

EqualizerIndicatorView requires iOS 9.0 or tvOS 9.0.

## Author

Alex Givens, http://alexgivens.com

## License

EqualizerIndicatorView is available under the MIT license. See the LICENSE file for more info.
