//
// Created by Roman Petryshen on 17/06/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import "HOLFlowView.h"
#import "HOLFlowView+PrivateHeader.h"
#import "UIView+FlowConstraints.h"
#import <objc/runtime.h>

static BOOL isObjectIsSubclassOfUIView(id object) {
    return class_isMetaClass(object_getClass(object)) && [(Class) object isSubclassOfClass:[UIView class]];
}

@implementation HOLFlowView

- (instancetype)initWithDirection:(HOLFlowViewDirection)direction {
    self = [super initWithFrame:CGRectZero];
    self.direction = direction;
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

    [self addSubview:container];

    self.containerConstraintLeft = [container make:NSLayoutAttributeLeading equalTo:self];
    self.containerConstraintRight = [container make:NSLayoutAttributeTrailing equalTo:self];
    self.containerConstraintTop = [container make:NSLayoutAttributeTop equalTo:self];
    self.containerConstraintBottom = [container make:NSLayoutAttributeBottom equalTo:self];

    [self ifV:^{
        self.containerConstraintWidth = [container makeWidthEqualTo:self];
    }     ifH:^{
        self.containerConstraintHeight = [container makeHeightEqualTo:self];
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
    view.backgroundColor = [UIColor greenColor];

    [view makeHeightEqualToConstant:element];

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

    self.lastExternalPrimaryEdgeConstraint = [view makeExternalPrimaryEdgeEqualTo:self.container
                                                                    withDirection:self.direction];

    self.lastExternalSecondaryEdgeConstraint = [view makeExternalSecondaryEdgeEqualTo:self.container
                                                                        withDirection:self.direction];

    [view makeLeadingEdgeEqualTo:self.container
                   withDirection:self.direction];

    self.lastTrailingConstraint = [view makeTrailingEdgeEqualTo:self.container
                                                  withDirection:self.direction];


    [self.container layoutIfNeeded];

    self.views = [self.views arrayByAddingObject:view];
}


- (void)addNextElementWithView:(UIView *)view {

    [self.container addSubview:view];

    UIView *previousView = self.views.lastObject;

    [self.container removeConstraint:self.lastTrailingConstraint];


    self.lastExternalPrimaryEdgeConstraint = [view makeExternalPrimaryEdgeEqualTo:self.container
                                                                    withDirection:self.direction];

    self.lastExternalSecondaryEdgeConstraint = [view makeExternalSecondaryEdgeEqualTo:self.container
                                                                        withDirection:self.direction];

    [view makeLeadingEqualToTrailingOf:previousView
                         withDirection:self.direction];

    self.lastTrailingConstraint = [view makeTrailingEdgeEqualTo:self.container
                                                  withDirection:self.direction];

    [self.container setNeedsLayout];
    self.views = [self.views arrayByAddingObject:view];
}


- (HOLFlowView *(^)(CGFloat))withExternalPrimaryEdgeMargin {

    return ^id(CGFloat margin) {

        self.lastExternalPrimaryEdgeConstraint.constant = margin;
        [self invalidateIntrinsicContentSize];
        [self setNeedsLayout];
        return self;
    };
}

- (HOLFlowView *(^)(CGFloat))withExternalSecondaryEdgeMargin {

    return ^id(CGFloat margin) {

        self.lastExternalSecondaryEdgeConstraint.constant = -1 * margin;
        [self invalidateIntrinsicContentSize];
        [self setNeedsLayout];
        return self;
    };
}

- (UIView *)viewsContainer {
    return self.container;
}

- (UIEdgeInsets)containerInsets {

    return UIEdgeInsetsMake(
            self.containerConstraintTop.constant,
            self.containerConstraintRight.constant,
            self.containerConstraintBottom.constant,
            self.containerConstraintLeft.constant
    );
}

- (void)setContainerInsets:(UIEdgeInsets)containerInsets {

    self.containerConstraintTop.constant = ABS(containerInsets.top);
    self.containerConstraintRight.constant = -1 * ABS(containerInsets.right);
    self.containerConstraintBottom.constant = -1 * ABS(containerInsets.bottom);
    self.containerConstraintLeft.constant = ABS(containerInsets.left);


    [self ifV:^{
                self.containerConstraintWidth.constant = -1 * (ABS(containerInsets.right) + ABS(containerInsets.left));
            }
          ifH:^{
              self.containerConstraintHeight.constant = -1 * (ABS(containerInsets.top) + ABS(containerInsets.bottom));
          }];

    [self setNeedsLayout];
    [self layoutIfNeeded];
}


@end