//
// Created by Roman Petryshen on 28/05/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import "HOLVerticalFlowView.h"
#import "HOLFlowView+PrivateHeader.h"


@implementation HOLVerticalFlowView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithDirection:HOLFlowViewDirectionBottom];
    return self;
}

- (HOLVerticalFlowView *(^)(CGFloat))withLeftMargin {
    return (HOLVerticalFlowView *(^)(CGFloat))[self withExternalPrimaryEdgeMargin];
}

- (HOLVerticalFlowView *(^)(CGFloat))withRightMargin {
    return (HOLVerticalFlowView *(^)(CGFloat))[self withExternalSecondaryEdgeMargin];
}

@end