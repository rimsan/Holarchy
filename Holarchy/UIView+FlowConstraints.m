//
// Created by Roman Petryshen on 22/07/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import "UIView+FlowConstraints.h"

@implementation UIView (FlowConstraints)

- (NSLayoutConstraint *)makeExternalPrimaryEdgeEqualTo:(UIView *)view withDirection:(HOLFlowViewDirection)direction {
    return [self make:[self attributeForExternalPrimaryEdgeWithDirection:direction]
              equalTo:view];
}

- (NSLayoutAttribute)attributeForExternalPrimaryEdgeWithDirection:(HOLFlowViewDirection)direction {
    return [self isVertical:direction] ? NSLayoutAttributeLeft : NSLayoutAttributeTop;
}


- (NSLayoutConstraint *)makeExternalSecondaryEdgeEqualTo:(UIView *)view withDirection:(HOLFlowViewDirection)direction {
    return [self make:[self attributeForExternalSecondaryEdgeWithDirection:direction]
              equalTo:view];
}

- (NSLayoutAttribute)attributeForExternalSecondaryEdgeWithDirection:(HOLFlowViewDirection)direction {
    return [self isVertical:direction] ? NSLayoutAttributeRight : NSLayoutAttributeBottom;
}


- (NSLayoutConstraint *)makeLeadingEdgeEqualTo:(UIView *)view withDirection:(HOLFlowViewDirection)direction {
    return [self make:[self attributeForLeadingEdgeWithDirection:direction]
              equalTo:view];
}

- (NSLayoutAttribute)attributeForLeadingEdgeWithDirection:(HOLFlowViewDirection)direction {
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


- (NSLayoutConstraint *)makeTrailingEdgeEqualTo:(UIView *)view withDirection:(HOLFlowViewDirection)direction {
    return [self make:[self attributeForTrailingEdgeWithDirection:direction]
              equalTo:view];
}

- (NSLayoutAttribute)attributeForTrailingEdgeWithDirection:(HOLFlowViewDirection)direction {
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

- (NSLayoutConstraint *)makeLeadingEqualToTrailingOf:(UIView *)view
                                       withDirection:(HOLFlowViewDirection)direction {

    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:[self attributeForLeadingEdgeWithDirection:direction]
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:view
                                                                  attribute:[self attributeForTrailingEdgeWithDirection:direction]
                                                                 multiplier:1
                                                                   constant:0];
    [self.superview addConstraint:constraint];
    return constraint;
}


- (BOOL)isVertical:(HOLFlowViewDirection)direction {
    return direction > HOLFlowViewDirectionLeft;
}

- (NSLayoutConstraint *)makeWidthEqualTo:(UIView *)view {
    return [self make:NSLayoutAttributeWidth equalTo:view];
}

- (NSLayoutConstraint *)makeHeightEqualTo:(UIView *)view {
    return [self make:NSLayoutAttributeHeight equalTo:view];
}

- (void)makeEdgesEqualTo:(UIView *)view {
    [self make:NSLayoutAttributeLeading equalTo:view];
    [self make:NSLayoutAttributeTrailing equalTo:view];
    [self make:NSLayoutAttributeTop equalTo:view];
    [self make:NSLayoutAttributeBottom equalTo:view];
}

- (NSLayoutConstraint *)makeHeightEqualToConstant:(NSNumber *)constant {
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


- (NSLayoutConstraint *)makeWidthEqualToConstant:(NSNumber *)constant {
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

- (NSLayoutConstraint *)makeRightEqualTo:(UIView *)view {
    return [self make:NSLayoutAttributeRight equalTo:view];
}

- (NSLayoutConstraint *)makeLeftEqualTo:(UIView *)view {
    return [self make:NSLayoutAttributeLeft equalTo:view];
}

- (NSLayoutConstraint *)makeTopEqualTo:(UIView *)view {
    return [self make:NSLayoutAttributeTop equalTo:view];
}

- (NSLayoutConstraint *)makeBottomEqualTo:(UIView *)view {
    return [self make:NSLayoutAttributeBottom equalTo:view];
}


- (NSLayoutConstraint *)make:(NSLayoutAttribute)attribute equalTo:(UIView *)view {
    NSLayoutConstraint *constraint = [self make:attribute equalTo:view withOffset:0];
    return constraint;
}

- (NSLayoutConstraint *)make:(NSLayoutAttribute)attribute equalTo:(UIView *)view withOffset:(CGFloat)offset {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:attribute
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:view
                                                                  attribute:attribute
                                                                 multiplier:1
                                                                   constant:offset];
    //TODO replace with findFirstParentView
    [self.superview addConstraint:constraint];
    return constraint;
}

@end