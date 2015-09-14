//
//  UIView+HOLFrameHelpers.m
//  Resume Designer in Style
//
//  Created by Roman Petryshen on 7/28/13.
//  Copyright (c) 2013 Roman Petryshen. All rights reserved.
//

#import "UIView+HOLFrameHelpers.h"

@implementation UIView (HOLFrameHelpers)

- (CGFloat)f_height {
    return self.frame.size.height;
}

- (CGFloat)f_width {
    return self.frame.size.width;
}

- (CGFloat)f_x {
    return self.frame.origin.x;
}

- (CGFloat)f_y {
    return self.frame.origin.y;
}

- (CGFloat)f_centerY {
    return self.center.y;
}

- (CGFloat)f_centerX {
    return self.center.x;
}

- (void)setF_centerX:(CGFloat)x {
    CGPoint center = self.center;
    center.x = x;
    self.center = center;
}

- (void)setF_centerY:(CGFloat)y {
    CGPoint center = self.center;
    center.y = y;
    self.center = center;
}

- (void)setF_height:(CGFloat)newF_height {
    CGRect frame = self.frame;
    frame.size.height = newF_height;
    self.frame = frame;
}

- (void)setF_width:(CGFloat)newF_width {
    CGRect frame = self.frame;
    frame.size.width = newF_width;
    self.frame = frame;
}

- (void)setF_x:(CGFloat)newF_x {
    CGRect frame = self.frame;
    frame.origin.x = newF_x;
    self.frame = frame;
}

- (void)setF_y:(CGFloat)newF_y {
    CGRect frame = self.frame;
    frame.origin.y = newF_y;
    self.frame = frame;
}

- (CGFloat)f_maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)f_maxY {
    return CGRectGetMaxY(self.frame);
}


@end
