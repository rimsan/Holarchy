//
// Created by Roman Petryshen on 22/07/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import "UIView+HOLAdditions.h"

@implementation UIView (HOLAdditions)

- (nonnull NSLayoutConstraint *)hol_makeExternalPrimaryEdgeEqualTo:(nonnull UIView *)view withDirection:(HOLFlowDirection)direction {
    return [self hol_make:[self attributeForExternalPrimaryEdgeWithDirection:direction]
                  equalTo:view];
}

- (NSLayoutAttribute)attributeForExternalPrimaryEdgeWithDirection:(HOLFlowDirection)direction {
    return [self hol_isVertical:direction] ? NSLayoutAttributeLeft : NSLayoutAttributeTop;
}


- (nonnull NSLayoutConstraint *)hol_makeExternalSecondaryEdgeEqualTo:(nonnull UIView *)view withDirection:(HOLFlowDirection)direction {
    return [self hol_make:[self hol_attributeForExternalSecondaryEdgeWithDirection:direction]
                  equalTo:view];
}

- (NSLayoutAttribute)hol_attributeForExternalSecondaryEdgeWithDirection:(HOLFlowDirection)direction {
    return [self hol_isVertical:direction] ? NSLayoutAttributeRight : NSLayoutAttributeBottom;
}


- (nonnull NSLayoutConstraint *)hol_makeLeadingEdgeEqualTo:(nonnull UIView *)view withDirection:(HOLFlowDirection)direction {
    return [self hol_make:[self hol_attributeForLeadingEdgeWithDirection:direction]
                  equalTo:view];
}

- (NSLayoutAttribute)hol_attributeForLeadingEdgeWithDirection:(HOLFlowDirection)direction {
    NSLayoutAttribute attribute = NSLayoutAttributeNotAnAttribute;

    switch (direction) {

        case HOLFlowDirectionNone:
            break;
        case HOLFlowDirectionRight:
            attribute = NSLayoutAttributeLeft;
            break;
        case HOLFlowDirectionLeft:
            attribute = NSLayoutAttributeRight;
            break;
        case HOLFlowDirectionTop:
            attribute = NSLayoutAttributeBottom;
            break;
        case HOLFlowDirectionBottom:
            attribute = NSLayoutAttributeTop;
            break;
    }

    NSAssert(attribute != NSLayoutAttributeNotAnAttribute, @"attribute must be defined");

    return attribute;
}


- (nonnull NSLayoutConstraint *)hol_makeTrailingEdgeEqualTo:(nonnull UIView *)view withDirection:(HOLFlowDirection)direction {
    return [self hol_make:[self hol_attributeForTrailingEdgeWithDirection:direction]
                  equalTo:view];
}

- (NSLayoutAttribute)hol_attributeForTrailingEdgeWithDirection:(HOLFlowDirection)direction {
    NSLayoutAttribute attribute = NSLayoutAttributeNotAnAttribute;

    switch (direction) {

        case HOLFlowDirectionNone:
            break;
        case HOLFlowDirectionRight:
            attribute = NSLayoutAttributeRight;
            break;
        case HOLFlowDirectionLeft:
            attribute = NSLayoutAttributeLeft;
            break;
        case HOLFlowDirectionTop:
            attribute = NSLayoutAttributeTop;
            break;
        case HOLFlowDirectionBottom:
            attribute = NSLayoutAttributeBottom;
            break;
    }

    NSAssert(attribute != NSLayoutAttributeNotAnAttribute, @"attribute must be defined");


    return attribute;
}

- (nonnull NSLayoutConstraint *)hol_makeLeadingEqualToTrailingOf:(nonnull UIView *)view
                                                   withDirection:(HOLFlowDirection)direction {

    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:[self hol_attributeForLeadingEdgeWithDirection:direction]
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:view
                                                                  attribute:[self hol_attributeForTrailingEdgeWithDirection:direction]
                                                                 multiplier:1
                                                                   constant:0];
    [self.superview addConstraint:constraint];
    return constraint;
}


- (BOOL)hol_isVertical:(HOLFlowDirection)direction {
    return direction > HOLFlowDirectionLeft;
}

- (nonnull NSLayoutConstraint *)hol_makeWidthEqualTo:(nonnull UIView *)view {
    return [self hol_make:NSLayoutAttributeWidth equalTo:view];
}

- (nonnull NSLayoutConstraint *)hol_makeHeightEqualTo:(nonnull UIView *)view {
    return [self hol_make:NSLayoutAttributeHeight equalTo:view];
}

- (nonnull NSLayoutConstraint *)hol_makeHeightEqualToConstant:(nonnull NSNumber *)constant {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeHeight
                                                                 multiplier:1
                                                                   constant:constant.floatValue];
    [self addConstraint:constraint];
    return constraint;
}


- (nonnull NSLayoutConstraint *)hol_makeWidthEqualToConstant:(nonnull NSNumber *)constant {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeWidth
                                                                 multiplier:1
                                                                   constant:constant.floatValue];
    [self addConstraint:constraint];
    return constraint;
}

- (nonnull NSLayoutConstraint *)hol_makeRightEqualTo:(nonnull UIView *)view {
    return [self hol_make:NSLayoutAttributeRight equalTo:view];
}

- (nonnull NSLayoutConstraint *)hol_makeLeftEqualTo:(nonnull UIView *)view {
    return [self hol_make:NSLayoutAttributeLeft equalTo:view];
}

- (nonnull NSLayoutConstraint *)hol_makeTopEqualTo:(nonnull UIView *)view {
    return [self hol_make:NSLayoutAttributeTop equalTo:view];
}

- (nonnull NSLayoutConstraint *)hol_makeBottomEqualTo:(nonnull UIView *)view {
    return [self hol_make:NSLayoutAttributeBottom equalTo:view];
}


- (nonnull NSLayoutConstraint *)hol_make:(NSLayoutAttribute)attribute equalTo:(nonnull UIView *)view {
    NSLayoutConstraint *constraint = [self hol_make:attribute equalTo:view withOffset:0];
    return constraint;
}

- (nonnull NSLayoutConstraint *)hol_make:(NSLayoutAttribute)attribute equalTo:(nonnull UIView *)view withOffset:(CGFloat)offset {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:attribute
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:view
                                                                  attribute:attribute
                                                                 multiplier:1
                                                                   constant:offset];

    UIView *superview = [self hol_closestCommonSuperview:view];

    NSAssert2(superview, @"Couldn't find common superview for views %@ and %@", self, view);

    [superview addConstraint:constraint];
    return constraint;
}

- (nonnull instancetype)hol_closestCommonSuperview:(nonnull UIView *)view {

    UIView *closestCommonSuperview = nil;
    UIView *secondViewSuperview = view;

    while (!closestCommonSuperview && secondViewSuperview) {
        UIView *firstViewSuperview = self;
        while (!closestCommonSuperview && firstViewSuperview) {
            if (secondViewSuperview == firstViewSuperview) {
                closestCommonSuperview = secondViewSuperview;
            }
            firstViewSuperview = firstViewSuperview.superview;
        }
        secondViewSuperview = secondViewSuperview.superview;
    }
    return closestCommonSuperview;
}


- (nonnull NSArray *)hol_findHeightConstraints {

    return [self hol_findSizeConstraintsWithAttributesEqualTo:NSLayoutAttributeHeight];
}

- (nonnull NSArray *)hol_findWidthConstraints {

    return [self hol_findSizeConstraintsWithAttributesEqualTo:NSLayoutAttributeWidth];
}

- (nonnull NSArray *)hol_findSizeConstraintsWithAttributesEqualTo:(NSLayoutAttribute)attribute {

    NSMutableSet *set = [NSMutableSet new];

    [self.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * obj, NSUInteger idx, BOOL * stop) {
        if (attribute == obj.firstAttribute && self == obj.firstItem && nil == obj.secondItem) {
            [set addObject:obj];
        }
    }];

    return set.allObjects;
}

@end