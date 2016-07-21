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


- (HOLVerticalFlowBuilder *(^)(CGFloat))withLeftMargin {

    return (HOLVerticalFlowBuilder *(^)(CGFloat)) [self withExternalPrimaryEdgeMargin];
}


- (HOLVerticalFlowBuilder *(^)(CGFloat))withRightMargin {

    return (HOLVerticalFlowBuilder *(^)(CGFloat)) [self withExternalSecondaryEdgeMargin];
}


- (HOLVerticalFlowBuilder *(^)(CGFloat))withHeight {

    return (HOLVerticalFlowBuilder *(^)(CGFloat)) [self withLastViewSizeConstant];
}


@end