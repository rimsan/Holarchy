//
// Created by Roman Petryshen on 20/06/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HOLFlowView.h"


typedef NS_ENUM(NSInteger, HOLFlowViewDirection) {
    HOLFlowViewDirectionNone,
    HOLFlowViewDirectionRight,
    HOLFlowViewDirectionLeft,
    HOLFlowViewDirectionTop,
    HOLFlowViewDirectionBottom,
};


@interface HOLFlowView ()

@property (nonatomic, assign) HOLFlowViewDirection direction;
@property (nonatomic, strong) UIScrollView *scrollView;
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

- (instancetype)initWithDirection:(HOLFlowViewDirection)direction;

- (instancetype)initWithScrollView:(UIScrollView *)scrollView direction:(HOLFlowViewDirection)direction;

- (HOLFlowView *(^)(CGFloat))withExternalPrimaryEdgeMargin;

- (HOLFlowView *(^)(CGFloat))withExternalSecondaryEdgeMargin;

- (HOLFlowView *(^)(CGFloat))withLastViewSizeConstant;

@end