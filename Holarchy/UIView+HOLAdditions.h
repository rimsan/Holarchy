//
// Created by Roman Petryshen on 22/07/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HOLFlowBuilder+PrivateHeader.h"

@interface UIView (HOLAdditions)
- (nonnull NSLayoutConstraint *)hol_makeExternalPrimaryEdgeEqualTo:(nonnull UIView *)view withDirection:(HOLFlowViewDirection)direction;

- (nonnull NSLayoutConstraint *)hol_makeExternalSecondaryEdgeEqualTo:(nonnull UIView *)view withDirection:(HOLFlowViewDirection)direction;

- (nonnull NSLayoutConstraint *)hol_makeLeadingEdgeEqualTo:(nonnull UIView *)view withDirection:(HOLFlowViewDirection)direction;

- (nonnull NSLayoutConstraint *)hol_makeTrailingEdgeEqualTo:(nonnull UIView *)view withDirection:(HOLFlowViewDirection)direction;

- (nonnull NSLayoutConstraint *)hol_makeLeadingEqualToTrailingOf:(nonnull UIView *)view withDirection:(HOLFlowViewDirection)direction;

- (nonnull NSLayoutConstraint *)hol_makeWidthEqualTo:(nonnull UIView *)view;

- (nonnull NSLayoutConstraint *)hol_makeHeightEqualTo:(nonnull UIView *)view;

- (nonnull NSLayoutConstraint *)hol_makeHeightEqualToConstant:(nonnull NSNumber *)constant;

- (nonnull NSLayoutConstraint *)hol_makeWidthEqualToConstant:(nonnull NSNumber *)constant;

- (nonnull NSLayoutConstraint *)hol_make:(NSLayoutAttribute)attribute equalTo:(nonnull UIView *)view;

- (nonnull NSArray *)hol_findHeightConstraints;

- (nonnull NSArray *)hol_findWidthConstraints;
@end