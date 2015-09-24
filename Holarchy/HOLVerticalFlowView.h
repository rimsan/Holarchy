//
// Created by Roman Petryshen on 28/05/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//


#import "HOLFlowView.h"

@class HOLVerticalFlowView;

@protocol HOLVerticalFlowViewSuperMethods
@optional
- (HOLVerticalFlowView *(^)(id))addView;

- (HOLVerticalFlowView *(^)(NSArray *))addElements;

- (HOLVerticalFlowView *(^)(void (^)(UIView *)))customize;
@end

@interface HOLVerticalFlowView : HOLFlowView <HOLVerticalFlowViewSuperMethods>

- (HOLVerticalFlowView *(^)(CGFloat))withLeftMargin;

- (HOLVerticalFlowView *(^)(CGFloat))withRightMargin;

- (HOLVerticalFlowView *(^)(CGFloat))withHeight;

@end