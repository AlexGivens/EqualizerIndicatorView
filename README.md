# EqualizerIndicatorView

[![Version](https://img.shields.io/cocoapods/v/EqualizerIndicatorView.svg?style=flat)](http://cocoapods.org/pods/EqualizerIndicatorView)
[![License](https://img.shields.io/cocoapods/l/EqualizerIndicatorView.svg?style=flat)](http://cocoapods.org/pods/EqualizerIndicatorView)
[![Platform](https://img.shields.io/cocoapods/p/EqualizerIndicatorView.svg?style=flat)](http://cocoapods.org/pods/EqualizerIndicatorView)
[![Twitter](https://img.shields.io/badge/twitter-%40AlexGivens_-blue.svg)](http://twitter.com/AlexGivens_)

## Installation

EqualizerIndicatorView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EqualizerIndicatorView', '~> 2.0.0'
```

## Usage

EqualizerIndicatorView can reflect the play, pause, and stop states of audio. After installing the Cocoapod in your project, create and animate an indicator like so:

```swift
let equalizerIndicatorView = EqualizerIndicatorView()
addSubview(equalizerIndicatorView)
equalizerIndicatorView.setState(.play, animated: true) // The state can be set to .play, .pause, or .stop
```

EqualizerIndicatorView is designable in storyboards as well. Add a UIView to your storyboard view and set the parent class to `EqualizerIndicatorView`. Then you can set the number of bars and bar spacing, as well as tint color like any other view.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

EqualizerIndicatorView requires iOS 9.0, macOS 10.9, tvOS 9.0, or watchOS 2.0.

## Author

Alex Givens, http://alexgivens.com

## License

EqualizerIndicatorView is available under the MIT license. See the LICENSE file for more info.
