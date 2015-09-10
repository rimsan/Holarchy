//
// Created by Roman Petryshen on 22/07/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HOLFlowView+PrivateHeader.h"

@interface UIView (HOLAdditions)
- (NSLayoutConstraint *)hol_makeExternalPrimaryEdgeEqualTo:(UIView *)view withDirection:(HOLFlowViewDirection)direction;

- (NSLayoutConstraint *)hol_makeExternalSecondaryEdgeEqualTo:(UIView *)view withDirection:(HOLFlowViewDirection)direction;

- (NSLayoutConstraint *)hol_makeLeadingEdgeEqualTo:(UIView *)view withDirection:(HOLFlowViewDirection)direction;

- (NSLayoutConstraint *)hol_makeTrailingEdgeEqualTo:(UIView *)view withDirection:(HOLFlowViewDirection)direction;

- (NSLayoutConstraint *)hol_makeLeadingEqualToTrailingOf:(UIView *)view withDirection:(HOLFlowViewDirection)direction;

- (NSLayoutConstraint *)hol_makeWidthEqualTo:(UIView *)view;

- (NSLayoutConstraint *)hol_makeHeightEqualTo:(UIView *)view;

- (NSLayoutConstraint *)hol_makeHeightEqualToConstant:(NSNumber *)constant;

- (NSLayoutConstraint *)hol_makeWidthEqualToConstant:(NSNumber *)constant;

- (NSLayoutConstraint *)hol_make:(NSLayoutAttribute)attribute equalTo:(UIView *)view;
@end