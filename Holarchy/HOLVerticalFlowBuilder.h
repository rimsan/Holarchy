//
// Created by Roman Petryshen on 28/05/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//


#import "HOLFlowBuilder.h"

@class HOLVerticalFlowBuilder;

@protocol HOLVerticalFlowBuilderSuperMethods
@optional
- (HOLVerticalFlowBuilder *(^)(id))addView;

- (HOLVerticalFlowBuilder *(^)(NSArray *))addElements;

- (HOLVerticalFlowBuilder *(^)(void (^)(UIView *)))customize;
@end

@interface HOLVerticalFlowBuilder : HOLFlowBuilder <HOLVerticalFlowBuilderSuperMethods>

- (HOLVerticalFlowBuilder *(^)(CGFloat))withLeftMargin;

- (HOLVerticalFlowBuilder *(^)(CGFloat))withRightMargin;

- (HOLVerticalFlowBuilder *(^)(CGFloat))withTopMargin;

- (HOLVerticalFlowBuilder *(^)(CGFloat))withBottonMargin;

- (HOLVerticalFlowBuilder *(^)(CGFloat))withHeight;

- (HOLVerticalFlowBuilder *(^)(UIEdgeInsets))withInsets;

- (instancetype)initWithScrollView:(UIScrollView *)scrollView DEPRECATED_MSG_ATTRIBUTE("use initWithRootView instead.");

- (instancetype)initWithRootView:(UIScrollView *)rootView;

@end