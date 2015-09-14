# Holarchy

[![CI Status](http://img.shields.io/travis/rimsan/Holarchy.svg?style=flat)](https://travis-ci.org/rimsan/Holarchy)
[![Version](https://img.shields.io/cocoapods/v/Holarchy.svg?style=flat)](http://cocoapods.org/pods/Holarchy)
[![License](https://img.shields.io/cocoapods/l/Holarchy.svg?style=flat)](http://cocoapods.org/pods/Holarchy)
[![Platform](https://img.shields.io/cocoapods/p/Holarchy.svg?style=flat)](http://cocoapods.org/pods/Holarchy)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Holarchy is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Holarchy"
```

## Examples

```objc
self.flowScrollView = [HOLVerticalFlowView new];

self.flowScrollView
  .addView([UILabel new])
  .withLeftMargin(10)
  .addView(@120)
  .customize(^(UIView *view) {
      view.backgroundColor = [UIColor redColor];
    })
    .addView([MyCustomControl class])
    .withLeftMargin(10);
```

## Author

Roman Petryshen, https://twitter.com/RomanPetryshen

## License

Holarchy is available under the MIT license. See the LICENSE file for more info.
