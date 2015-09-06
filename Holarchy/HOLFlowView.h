//
// Created by Roman Petryshen on 17/06/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HOLFlowView : UIScrollView

@property (nonatomic, readonly) UIView *viewsContainer;

@property (nonatomic, assign) UIEdgeInsets containerInsets;

@end