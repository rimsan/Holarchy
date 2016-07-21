//
// Created by Roman Petryshen on 20/06/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HOLFlowBuilder.h"


typedef NS_ENUM(NSInteger, HOLFlowDirection) {
    HOLFlowDirectionNone,
    HOLFlowDirectionRight,
    HOLFlowDirectionLeft,
    HOLFlowDirectionTop,
    HOLFlowDirectionBottom,
};


@interface HOLFlowBuilder ()

@property (nonatomic, assign) HOLFlowDirection direction;
@property (nonatomic, strong) UIView *rootView;
@property (nonatomic, strong) NSArray *views;
@property (nonatomic, strong) UIView *container;
@property (nonatomic, readonly) BOOL isVerticalFlow;
@property (nonatomic, strong) NSLayoutConstraint *lastTrailingConstraint;
@property (nonatomic, strong) NSLayoutConstraint *lastExternalPrimaryEdgeConstraint;
@property (nonatomic, strong) NSLayoutConstraint *lastExternalSecondaryEdgeConstraint;

@property (nonatomic, strong) NSLayoutConstraint *containerConstraintTop;
@property (nonatomic, strong) NSLayoutConstraint *containerConstraintRight;
@property (nonatomic, strong) NSLayoutConstraint *containerConstraintBottom;
@property (nonatomic, strong) NSLayoutConstraint *containerConstraintLeft;

@property (nonatomic, strong) NSLayoutConstraint *containerConstraintWidth;
@property (nonatomic, strong) NSLayoutConstraint *containerConstraintHeight;

@property (nonatomic, readonly) UIView *lastAddedView;

- (instancetype)initWithRootView:(UIView *)rootView direction:(HOLFlowDirection)direction;

- (HOLFlowBuilder *(^)(CGFloat))withExternalPrimaryEdgeMargin;

- (HOLFlowBuilder *(^)(CGFloat))withExternalSecondaryEdgeMargin;

- (HOLFlowBuilder *(^)(CGFloat))withLastViewSizeConstant;

@end