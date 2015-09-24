//
// Created by Roman Petryshen on 22/07/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HOLFlowView+PrivateHeader.h"

@interface UIView (HOLAdditions)
- (NSLayoutConstraint * _Nonnull)hol_makeExternalPrimaryEdgeEqualTo:(UIView * _Nonnull)view withDirection:(HOLFlowViewDirection)direction;

- (NSLayoutConstraint * _Nonnull)hol_makeExternalSecondaryEdgeEqualTo:(UIView * _Nonnull)view withDirection:(HOLFlowViewDirection)direction;

- (NSLayoutConstraint * _Nonnull)hol_makeLeadingEdgeEqualTo:(UIView * _Nonnull)view withDirection:(HOLFlowViewDirection)direction;

- (NSLayoutConstraint * _Nonnull)hol_makeTrailingEdgeEqualTo:(UIView * _Nonnull)view withDirection:(HOLFlowViewDirection)direction;

- (NSLayoutConstraint * _Nonnull)hol_makeLeadingEqualToTrailingOf:(UIView * _Nonnull)view withDirection:(HOLFlowViewDirection)direction;

- (NSLayoutConstraint * _Nonnull)hol_makeWidthEqualTo:(UIView * _Nonnull)view;

- (NSLayoutConstraint * _Nonnull)hol_makeHeightEqualTo:(UIView * _Nonnull)view;

- (NSLayoutConstraint * _Nonnull)hol_makeHeightEqualToConstant:(NSNumber * _Nonnull)constant;

- (NSLayoutConstraint * _Nonnull)hol_makeWidthEqualToConstant:(NSNumber * _Nonnull)constant;

- (NSLayoutConstraint * _Nonnull)hol_make:(NSLayoutAttribute)attribute equalTo:(UIView * _Nonnull)view;

- (NSArray * _Nonnull)hol_findHeightConstraints;

- (NSArray * _Nonnull)hol_findWidthConstraints;
@end