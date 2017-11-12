<br >

<p align="center" >
    <img src="https://raw.githubusercontent.com/AlexGivens/EqualizerIndicatorView/master/Title.gif" alt="EqualizerIndicatorView" title="EqualizerIndicatorView" width="520" height:"41"
</p>

<br >
<br >

[![Version](https://img.shields.io/cocoapods/v/EqualizerIndicatorView.svg?style=flat)](http://cocoapods.org/pods/EqualizerIndicatorView)
[![License](https://img.shields.io/cocoapods/l/EqualizerIndicatorView.svg?style=flat)](http://cocoapods.org/pods/EqualizerIndicatorView)
[![Platform](https://img.shields.io/cocoapods/p/EqualizerIndicatorView.svg?style=flat)](http://cocoapods.org/pods/EqualizerIndicatorView)
[![Twitter](https://img.shields.io/badge/twitter-%40AlexGivens_-blue.svg)](http://twitter.com/AlexGivens_)

## Introduction
`EqualizerIndicatorView` is Swift UI component to indicate the current status of audio. The design is inspired by Apple's Music app.

## Demo

An example project is included to demonstrate how to use an indicator with storyboards. To run the project, run `pod install` from the **Example** directory first.

## Installation

Install the library through [CocoaPods](http://cocoapods.org). Add the following line to your **Podfile**, then run `pod install`.

```ruby
pod 'EqualizerIndicatorView', '~> 2.0'
```

Be sure to import the library when needed.

```swift
import EqualizerIndicatorView
```

## Usage

`EqualizerIndicatorView` can reflect the play, pause, and stop states of audio. Initialize and animate an indicator as follows.

```swift
let frame = CGRect(x: 0, y: 0, width: 24, height: 18)
let equalizerIndicatorView = EqualizerIndicatorView(frame: frame)
equalizerIndicatorView.setState(.play, animated: true)
equalizerIndicatorView.setState(.pause, animated: true)
equalizerIndicatorView.setState(.stop, animated: true)
```

`EqualizerIndicatorView` may be used in storyboards, and fully supports AutoLayout. Add a plain UIView first, then set the view's Class *and* Module to `EqualizerIndicatorView`.

## Migration

### Version 2.0.0

This version requires Xcode 9.0 and Swift 4.

### Version 1.0.0

`EqualizerIndicatorView` supports iOS 9.0+ and tvOS 9.0+. Also supports Swift 3 and Xcode 8.0.

## Credits

Created by [Alex Givens](http://alexgivens.com) in California.

## License

The MIT License (MIT)

Copyright (c) 2017 Alex Givens http://alexgivens.com
