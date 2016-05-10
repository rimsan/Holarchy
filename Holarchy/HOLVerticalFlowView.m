//
// Created by Roman Petryshen on 28/05/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import "HOLVerticalFlowView.h"
#import "HOLFlowView+PrivateHeader.h"

@implementation HOLVerticalFlowView

- (instancetype)init {

    [NSException raise:@"Invalid initializer" format:@"Use -initWithRootView"];

    return nil;
}


- (instancetype)initWithScrollView:(UIScrollView *)scrollView {

    return [self initWithRootView:scrollView];
}

- (instancetype)initWithRootView:(UIView *)rootView {

    self = [super initWithRootView:rootView direction:HOLFlowViewDirectionBottom];
    return self;
}


- (HOLVerticalFlowView *(^)(CGFloat))withLeftMargin {

    return (HOLVerticalFlowView *(^)(CGFloat)) [self withExternalPrimaryEdgeMargin];
}


- (HOLVerticalFlowView *(^)(CGFloat))withRightMargin {

    return (HOLVerticalFlowView *(^)(CGFloat)) [self withExternalSecondaryEdgeMargin];
}


- (HOLVerticalFlowView *(^)(CGFloat))withHeight {

    return (HOLVerticalFlowView *(^)(CGFloat)) [self withLastViewSizeConstant];
}


@end