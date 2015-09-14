//
//  UIView+HOLFrameHelpers.h
//  Resume Designer in Style
//
//  Created by Roman Petryshen on 7/28/13.
//  Copyright (c) 2013 Roman Petryshen. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (HOLFrameHelpers)

@property (nonatomic, assign) CGFloat f_height;
@property (nonatomic, assign) CGFloat f_width;
@property (nonatomic, assign) CGFloat f_x;
@property (nonatomic, assign) CGFloat f_y;
@property (nonatomic, assign) CGFloat f_centerX;
@property (nonatomic, assign) CGFloat f_centerY;
@property (nonatomic, readonly) CGFloat f_maxX;
@property (nonatomic, readonly) CGFloat f_maxY;

@end
