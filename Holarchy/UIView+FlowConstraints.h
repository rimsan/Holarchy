//
// Created by Roman Petryshen on 22/07/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HOLFlowView+PrivateHeader.h"

@interface UIView (FlowConstraints)
- (NSLayoutConstraint *)makeExternalPrimaryEdgeEqualTo:(UIView *)view withDirection:(HOLFlowViewDirection)direction;

- (NSLayoutConstraint *)makeExternalSecondaryEdgeEqualTo:(UIView *)view withDirection:(HOLFlowViewDirection)direction;

- (NSLayoutConstraint *)makeLeadingEdgeEqualTo:(UIView *)view withDirection:(HOLFlowViewDirection)direction;

- (NSLayoutConstraint *)makeTrailingEdgeEqualTo:(UIView *)view withDirection:(HOLFlowViewDirection)direction;

- (NSLayoutConstraint *)makeLeadingEqualToTrailingOf:(UIView *)view withDirection:(HOLFlowViewDirection)direction;

- (NSLayoutConstraint *)makeWidthEqualTo:(UIView *)view;

- (NSLayoutConstraint *)makeHeightEqualTo:(UIView *)view;

- (NSLayoutConstraint *)makeHeightEqualToConstant:(NSNumber *)constant;

- (NSLayoutConstraint *)makeWidthEqualToConstant:(NSNumber *)constant;

- (NSLayoutConstraint *)make:(NSLayoutAttribute)attribute equalTo:(UIView *)view;

- (void)makeEdgesEqualTo:(UIView *)view;
@end