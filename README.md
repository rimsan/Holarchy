# Holarchy

[![CI Status](http://img.shields.io/travis/rimsan/Holarchy.svg?style=flat)](https://travis-ci.org/rimsan/Holarchy)
[![Version](https://img.shields.io/cocoapods/v/Holarchy.svg?style=flat)](http://cocoapods.org/pods/Holarchy)
[![License](https://img.shields.io/cocoapods/l/Holarchy.svg?style=flat)](http://cocoapods.org/pods/Holarchy)
[![Platform](https://img.shields.io/cocoapods/p/Holarchy.svg?style=flat)](http://cocoapods.org/pods/Holarchy)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

Holarchy is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Holarchy"
```

## Examples

Holarchy solves a problem of bulding long scrollable layouts (like forms) without Autolayout/UITableView/UICollectionView.
As for now only one class is available - 'HOLVerticalFlowView'. With this class you can build vertical layouts, adding views one by one.

**Few remarks about how it works**
* When you add a view to layout - it will be shrinked to the full width of FlowView (like UITableViewCell).
* Your custom view should return appropriate intrinsicContentSize (FlowView needs height, width will be ignored).
* Views are pinned to each other - so you can easily animate expanding/collapsing.
* You can use nice chaining when work with FlowView


**So what we have here?**

Create FlowView and add it to your controller:
```objc
self.flowScrollView = [HOLVerticalFlowView new];

[self.flowScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
  make.edges.equalTo(self.view);
}];
```

Add an already created view:
```objc
self.flowScrollView.addView(self.titleLabel);
```

Add a UIView subclass (with predefined height inside):
```objc
self.flowScrollView.addView([MYSeparatorView class]);
```

Add just a number - transparent view of corresponding height will be created (you can use it for creating margins between your components):
```objc
self.flowScrollView.addView(@20);
```

Set margins for previously added view:
```objc
self.flowScrollView
            .addView(self.titleLabel)
            .withLeftMargin(10)
            .withRightMargin(10);
```

Set height for previously added view (existing height constraints will be removed):
```objc
self.flowScrollView
            .addView(self.titleLabel)
            .withHeight(10);
```

Customize or create a pointer to previously added view:
```objc
self.flowScrollView
            .addView(@50)
            .customize(^(UIView *view) {
                view.backgroundColor = [UIColor redColor];
                self.redDelimiterView = view;
            });
```

Set inner insets for the whole content view:
```objc
self.flowScrollView.contentViewInsets = UIEdgeInsetsMake(10,10,10,10);
```

## Author

Roman Petryshen, https://twitter.com/RomanPetryshen

## License

Holarchy is available under the MIT license. See the LICENSE file for more info.
