//
//  LayoutCustomizeSpec.m
//  RPVerticalFlowScrollView
//
//  Created by Roman Petryshen on 29/07/15.
//  Copyright (c) 2015 Roman Petryshen. All rights reserved.
//


#import "Specta/Specta.h"
#import "Expecta/Expecta.h"
#import "Masonry/Masonry.h"
#import <Holarchy/Holarchy.h>
#import "Helpers.h"


@interface HOLVerticalFlowView (LayoutCustomizeSpec)
@property (nonatomic, strong) NSArray *views;
@end

SpecBegin(LayoutCustomizeSpec)

    describe(@"Customize function", ^{

        CGSize defaultRootViewSize = CGSizeMake(300, 200);
        UIView *rootView = createViewFoSize(defaultRootViewSize.width, defaultRootViewSize.height);
        HOLVerticalFlowView *flowScrollView = createFlowViewOnView(rootView);

        UIColor *color1 = [UIColor redColor];
        UIColor *color3 = [UIColor greenColor];

        flowScrollView.addView(@10).customize(^(UIView *view) {
            view.backgroundColor = color1;
        });

        flowScrollView.addView(@10);

        flowScrollView.addView(@10).customize(^(UIView *view) {
            view.backgroundColor = color3;
        });

        it(@"should update color of 1st view", ^{
            expect([(UIView *) flowScrollView.views.firstObject backgroundColor]).to.equal(color1);
        });

        it(@"should update color of 3rd view", ^{
            expect([(UIView *) flowScrollView.views.lastObject backgroundColor]).to.equal(color3);
        });

    });

SpecEnd


