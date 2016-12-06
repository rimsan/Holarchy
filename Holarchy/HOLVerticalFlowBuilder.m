//
// Created by Roman Petryshen on 28/05/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import "HOLVerticalFlowBuilder.h"
#import "HOLFlowBuilder+PrivateHeader.h"

@implementation HOLVerticalFlowBuilder

- (instancetype)init {

    [NSException raise:@"Invalid initializer" format:@"Use -initWithRootView"];

    return nil;
}

- (instancetype)initWithScrollView:(UIScrollView *)scrollView {

    return [self initWithRootView:scrollView];
}

- (instancetype)initWithRootView:(UIView *)rootView {

    self = [super initWithRootView:rootView direction:HOLFlowDirectionBottom];
    return self;
}

#pragma mark - Insets

- (HOLVerticalFlowBuilder *(^)(CGFloat))withLeftMargin {

    return (HOLVerticalFlowBuilder *(^)(CGFloat)) [self withExternalPrimaryEdgeMargin];
}

- (HOLVerticalFlowBuilder *(^)(CGFloat))withRightMargin {

    return (HOLVerticalFlowBuilder *(^)(CGFloat)) [self withExternalSecondaryEdgeMargin];
}

- (HOLVerticalFlowBuilder *(^)(CGFloat))withTopMargin {

    return (HOLVerticalFlowBuilder *(^)(CGFloat)) [self withLeadingEdgeMargin];
}

- (HOLVerticalFlowBuilder *(^)(CGFloat))withBottonMargin {

    return (HOLVerticalFlowBuilder *(^)(CGFloat)) [self withTrailingEdgeMargin];
}

- (HOLVerticalFlowBuilder *(^)(UIEdgeInsets))withInsets {

    return ^HOLVerticalFlowBuilder *(UIEdgeInsets insets) {
        return (HOLVerticalFlowBuilder *) [self withPrimarySecondaryLeadingTrailingMargins](insets.left, insets.right, insets.top, insets.bottom);
    };
}


#pragma mark - Size

- (HOLVerticalFlowBuilder *(^)(CGFloat))withHeight {

    return (HOLVerticalFlowBuilder *(^)(CGFloat)) [self withLastViewSizeConstant];
}


@end