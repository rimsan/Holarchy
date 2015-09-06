//
// Created by Roman Petryshen on 20/06/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HOLFlowView.h"
#import <objc/runtime.h>

static BOOL isObjectIsSubclassOfUIView(id object) {
    return class_isMetaClass(object_getClass(object)) && [(Class) object isSubclassOfClass:[UIView class]];
}

typedef NS_ENUM(NSInteger, HOLFlowViewDirection) {
    HOLFlowViewDirectionNone,
    HOLFlowViewDirectionRight,
    HOLFlowViewDirectionLeft,
    HOLFlowViewDirectionTop,
    HOLFlowViewDirectionBottom,
};


@interface HOLFlowView ()

@property (nonatomic, assign) HOLFlowViewDirection direction;
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



- (instancetype)initWithDirection:(HOLFlowViewDirection)direction;

- (HOLFlowView *(^)(CGFloat))withExternalPrimaryEdgeMargin;

- (HOLFlowView *(^)(CGFloat))withExternalSecondaryEdgeMargin;


@end