//
// Created by Roman Petryshen on 22/07/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import "UIView+HOLAdditions.h"

@implementation UIView (HOLAdditions)

- (NSLayoutConstraint *)hol_makeExternalPrimaryEdgeEqualTo:(UIView *)view withDirection:(HOLFlowViewDirection)direction {
    return [self hol_make:[self attributeForExternalPrimaryEdgeWithDirection:direction]
                  equalTo:view];
}

- (NSLayoutAttribute)attributeForExternalPrimaryEdgeWithDirection:(HOLFlowViewDirection)direction {
    return [self hol_isVertical:direction] ? NSLayoutAttributeLeft : NSLayoutAttributeTop;
}


- (NSLayoutConstraint *)hol_makeExternalSecondaryEdgeEqualTo:(UIView *)view withDirection:(HOLFlowViewDirection)direction {
    return [self hol_make:[self hol_attributeForExternalSecondaryEdgeWithDirection:direction]
                  equalTo:view];
}

- (NSLayoutAttribute)hol_attributeForExternalSecondaryEdgeWithDirection:(HOLFlowViewDirection)direction {
    return [self hol_isVertical:direction] ? NSLayoutAttributeRight : NSLayoutAttributeBottom;
}


- (NSLayoutConstraint *)hol_makeLeadingEdgeEqualTo:(UIView *)view withDirection:(HOLFlowViewDirection)direction {
    return [self hol_make:[self hol_attributeForLeadingEdgeWithDirection:direction]
                  equalTo:view];
}

- (NSLayoutAttribute)hol_attributeForLeadingEdgeWithDirection:(HOLFlowViewDirection)direction {
    NSLayoutAttribute attribute = NSLayoutAttributeNotAnAttribute;

    switch (direction) {

        case HOLFlowViewDirectionNone:
            break;
        case HOLFlowViewDirectionRight:
            attribute = NSLayoutAttributeLeft;
            break;
        case HOLFlowViewDirectionLeft:
            attribute = NSLayoutAttributeRight;
            break;
        case HOLFlowViewDirectionTop:
            attribute = NSLayoutAttributeBottom;
            break;
        case HOLFlowViewDirectionBottom:
            attribute = NSLayoutAttributeTop;
            break;
    }

    NSAssert(attribute != NSLayoutAttributeNotAnAttribute, @"attribute must be defined");

    return attribute;
}


- (NSLayoutConstraint *)hol_makeTrailingEdgeEqualTo:(UIView *)view withDirection:(HOLFlowViewDirection)direction {
    return [self hol_make:[self hol_attributeForTrailingEdgeWithDirection:direction]
                  equalTo:view];
}

- (NSLayoutAttribute)hol_attributeForTrailingEdgeWithDirection:(HOLFlowViewDirection)direction {
    NSLayoutAttribute attribute = NSLayoutAttributeNotAnAttribute;

    switch (direction) {

        case HOLFlowViewDirectionNone:
            break;
        case HOLFlowViewDirectionRight:
            attribute = NSLayoutAttributeRight;
            break;
        case HOLFlowViewDirectionLeft:
            attribute = NSLayoutAttributeLeft;
            break;
        case HOLFlowViewDirectionTop:
            attribute = NSLayoutAttributeTop;
            break;
        case HOLFlowViewDirectionBottom:
            attribute = NSLayoutAttributeBottom;
            break;
    }

    NSAssert(attribute != NSLayoutAttributeNotAnAttribute, @"attribute must be defined");


    return attribute;
}

- (NSLayoutConstraint *)hol_makeLeadingEqualToTrailingOf:(UIView *)view
                                           withDirection:(HOLFlowViewDirection)direction {

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


- (BOOL)hol_isVertical:(HOLFlowViewDirection)direction {
    return direction > HOLFlowViewDirectionLeft;
}

- (NSLayoutConstraint *)hol_makeWidthEqualTo:(UIView *)view {
    return [self hol_make:NSLayoutAttributeWidth equalTo:view];
}

- (NSLayoutConstraint *)hol_makeHeightEqualTo:(UIView *)view {
    return [self hol_make:NSLayoutAttributeHeight equalTo:view];
}

- (NSLayoutConstraint *)hol_makeHeightEqualToConstant:(NSNumber *)constant {
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


- (NSLayoutConstraint *)hol_makeWidthEqualToConstant:(NSNumber *)constant {
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

- (NSLayoutConstraint *)hol_makeRightEqualTo:(UIView *)view {
    return [self hol_make:NSLayoutAttributeRight equalTo:view];
}

- (NSLayoutConstraint *)hol_makeLeftEqualTo:(UIView *)view {
    return [self hol_make:NSLayoutAttributeLeft equalTo:view];
}

- (NSLayoutConstraint *)hol_makeTopEqualTo:(UIView *)view {
    return [self hol_make:NSLayoutAttributeTop equalTo:view];
}

- (NSLayoutConstraint *)hol_makeBottomEqualTo:(UIView *)view {
    return [self hol_make:NSLayoutAttributeBottom equalTo:view];
}


- (NSLayoutConstraint *)hol_make:(NSLayoutAttribute)attribute equalTo:(UIView *)view {
    NSLayoutConstraint *constraint = [self hol_make:attribute equalTo:view withOffset:0];
    return constraint;
}

- (NSLayoutConstraint *)hol_make:(NSLayoutAttribute)attribute equalTo:(UIView *)view withOffset:(CGFloat)offset {
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

- (instancetype)hol_closestCommonSuperview:(UIView *)view {

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
@end