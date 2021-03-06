//
// Created by Roman Petryshen on 17/06/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import "HOLFlowView.h"
#import "HOLFlowView+PrivateHeader.h"
#import "UIView+HOLAdditions.h"
#import <objc/runtime.h>

static BOOL isObjectIsSubclassOfUIView(id object) {
    return class_isMetaClass(object_getClass(object)) && [(Class) object isSubclassOfClass:[UIView class]];
}

@implementation HOLFlowView


- (instancetype)initWithScrollView:(UIScrollView *)scrollView direction:(HOLFlowViewDirection)direction {

    self = [super init];

    if (self) {

        self = [super init];
        self.direction = direction;
        self.scrollView = scrollView;
        [self setupView];
    }

    return self;
}

- (instancetype)initWithDirection:(HOLFlowViewDirection)direction {
    self = [super init];
    self.direction = direction;
    self.scrollView = [UIScrollView new];
    [self setupView];
    return self;
}

- (void)ifV:(void (^)())vertical ifH:(void (^)())horizontal {
    if (self.isVerticalFlow) {
        vertical();
    }
    else {
        horizontal();
    }
}

#pragma mark Public methods

- (HOLFlowView *(^)(id))addView {
    return ^id(id o) {
        [self addElement:o];
        return self;
    };
}

- (HOLFlowView *(^)(NSArray *))addElements {
    return ^HOLFlowView *(NSArray *elements) {
        [elements enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [self addElement:obj];
        }];

        return self;
    };
}

- (HOLFlowView *(^)(void (^)(UIView *)))customize {
    return ^HOLFlowView *(void (^customizeBlock)(UIView *lastAddedView)) {
        UIView *lastView = self.views.lastObject;
        if (lastView && customizeBlock) {
            customizeBlock(lastView);
        }

        return self;
    };
}

#pragma mark Implementation

- (BOOL)isVerticalFlow {
    return self.direction > HOLFlowViewDirectionLeft;
}

- (void)setupView {
    self.views = @[];
    self.container = [UIView new];
    self.container.translatesAutoresizingMaskIntoConstraints = NO;
    [self addContainer:self.container];
}


- (void)addContainer:(UIView *)container {

    [self.scrollView addSubview:container];

    self.containerConstraintLeft = [container hol_make:NSLayoutAttributeLeading equalTo:self.scrollView];
    self.containerConstraintRight = [container hol_make:NSLayoutAttributeTrailing equalTo:self.scrollView];
    self.containerConstraintTop = [container hol_make:NSLayoutAttributeTop equalTo:self.scrollView];
    self.containerConstraintBottom = [container hol_make:NSLayoutAttributeBottom equalTo:self.scrollView];

    [self ifV:^{
        self.containerConstraintWidth = [container hol_makeWidthEqualTo:self.scrollView];
    }     ifH:^{
        self.containerConstraintHeight = [container hol_makeHeightEqualTo:self.scrollView];
    }];
}


- (void)addElement:(id)element {

    NSAssert(nil != element, @"Element can't be nil");

    if (nil == element) {
        return;
    }


    if ([element isKindOfClass:[NSNumber class]]) {
        [self addElementWithNumber:element];
    }
    else if ([element isKindOfClass:[UIView class]]) {
        [self addElementWithView:element];
    }
    else if (isObjectIsSubclassOfUIView(element)) {
        [self addElementWithClass:element];
    }
}


- (void)addElementWithClass:(id)element {
    UIView *view = [UIView new];
    [self addElementWithView:view];
}


- (void)addElementWithNumber:(NSNumber *)element {

    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];

    [view hol_makeHeightEqualToConstant:element];

    [self addElementWithView:view];
}

- (void)addElementWithView:(UIView *)element {

    element.translatesAutoresizingMaskIntoConstraints = NO;

    if (0 == self.views.count) {
        [self addFirstElementWithView:element];
    }
    else {
        [self addNextElementWithView:element];
    }
}

- (void)addFirstElementWithView:(UIView *)view {

    [self.container addSubview:view];

    self.lastExternalPrimaryEdgeConstraint = [view hol_makeExternalPrimaryEdgeEqualTo:self.container
                                                                        withDirection:self.direction];

    self.lastExternalSecondaryEdgeConstraint = [view hol_makeExternalSecondaryEdgeEqualTo:self.container
                                                                            withDirection:self.direction];

    [view hol_makeLeadingEdgeEqualTo:self.container
                       withDirection:self.direction];

    self.lastTrailingConstraint = [view hol_makeTrailingEdgeEqualTo:self.container
                                                      withDirection:self.direction];


    [self.container layoutIfNeeded];

    self.views = [self.views arrayByAddingObject:view];
}


- (void)addNextElementWithView:(UIView *)view {

    [self.container addSubview:view];

    UIView *previousView = self.views.lastObject;

    [self.container removeConstraint:self.lastTrailingConstraint];


    self.lastExternalPrimaryEdgeConstraint = [view hol_makeExternalPrimaryEdgeEqualTo:self.container
                                                                        withDirection:self.direction];

    self.lastExternalSecondaryEdgeConstraint = [view hol_makeExternalSecondaryEdgeEqualTo:self.container
                                                                            withDirection:self.direction];

    [view hol_makeLeadingEqualToTrailingOf:previousView
                             withDirection:self.direction];

    self.lastTrailingConstraint = [view hol_makeTrailingEdgeEqualTo:self.container
                                                      withDirection:self.direction];

    [self.container setNeedsLayout];
    self.views = [self.views arrayByAddingObject:view];
}


- (HOLFlowView *(^)(CGFloat))withExternalPrimaryEdgeMargin {

    return ^id(CGFloat margin) {

        self.lastExternalPrimaryEdgeConstraint.constant = margin;
        [self.scrollView invalidateIntrinsicContentSize];
        [self.scrollView setNeedsLayout];
        return self;
    };
}

- (HOLFlowView *(^)(CGFloat))withExternalSecondaryEdgeMargin {

    return ^id(CGFloat margin) {

        self.lastExternalSecondaryEdgeConstraint.constant = -1 * margin;
        [self.scrollView invalidateIntrinsicContentSize];
        [self.scrollView setNeedsLayout];
        return self;
    };
}


- (UIView *)contentView {

    return self.container;
}


- (UIEdgeInsets)contentViewInsets {

    return UIEdgeInsetsMake(
            self.containerConstraintTop.constant,
            self.containerConstraintRight.constant,
            self.containerConstraintBottom.constant,
            self.containerConstraintLeft.constant
    );
}

- (void)setContentViewInsets:(UIEdgeInsets)contentViewInsets {

    self.containerConstraintTop.constant = ABS(contentViewInsets.top);
    self.containerConstraintRight.constant = -1 * ABS(contentViewInsets.right);
    self.containerConstraintBottom.constant = -1 * ABS(contentViewInsets.bottom);
    self.containerConstraintLeft.constant = ABS(contentViewInsets.left);


    [self ifV:^{
                self.containerConstraintWidth.constant = -1 * (ABS(contentViewInsets.right) + ABS(contentViewInsets.left));
            }
          ifH:^{
              self.containerConstraintHeight.constant = -1 * (ABS(contentViewInsets.top) + ABS(contentViewInsets.bottom));
          }];

    [self.scrollView setNeedsLayout];
    [self.scrollView layoutIfNeeded];
}


- (UIView *)lastAddedView {

    return self.views.lastObject;
}

- (HOLFlowView *(^)(CGFloat))withLastViewSizeConstant {

    return ^id(CGFloat height) {

        if (!self.lastAddedView) {
            return self;
        }

        __block NSArray *currentSizeConstraints = nil;

        [self ifV:^{
            currentSizeConstraints = [self.lastAddedView hol_findHeightConstraints];
        }     ifH:^{
            currentSizeConstraints = [self.lastAddedView hol_findWidthConstraints];
        }];

        if (currentSizeConstraints) {
            [self.lastAddedView removeConstraints:currentSizeConstraints];
        }


        [self ifV:^{
            [self.lastAddedView hol_makeHeightEqualToConstant:@(ABS(height))];
        }     ifH:^{
            [self.lastAddedView hol_makeWidthEqualToConstant:@(ABS(height))];
        }];

        [self.scrollView invalidateIntrinsicContentSize];
        [self.scrollView setNeedsLayout];

        return self;
    };

}


@end