//
//  HOLFrameAdditions.h.h
//  RPVerticalFlowScrollView
//
//  Created by Roman Petryshen on 30/06/15.
//  Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Holarchy/Holarchy.h>
#import <Masonry/Masonry.h>
#import <Holarchy/UIView+HOLFrameHelpers.h>

static UIView *createViewFoSize(CGFloat width, CGFloat height) {
    UIView *view = [UIView new];
    view.autoresizingMask = UIViewAutoresizingNone;
    view.f_width = width;
    view.f_height = height;
    return view;
}


static HOLVerticalFlowView *createFlowViewOnView(UIView *view) {
    HOLVerticalFlowView *flowView = [[HOLVerticalFlowView alloc] initWithRootView:[UIScrollView new]];
    [view addSubview:flowView.rootView];

    [flowView.rootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view);
    }];

    return flowView;
};

static UIView *viewWithHeight(NSNumber *height) {
    UIView *item = [UIView new];
    [item mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(height);
    }];
    return item;
};