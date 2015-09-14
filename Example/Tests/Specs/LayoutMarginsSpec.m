//
//  RPLayoutMarginsSpec.m
//  RPVerticalFlowScrollView
//
//  Created by Roman Petryshen on 30/06/15.
//  Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import "Specta/Specta.h"
#import "Expecta/Expecta.h"
#import "Masonry/Masonry.h"
#import "HOLVerticalFlowView.h"
#import "Helpers.h"
#import "HOLFlowView+PrivateHeader.h"

@interface HOLVerticalFlowView (RPLayoutMarginsSpec)
@property(nonatomic, strong) NSArray *views;
@property(nonatomic, strong) UIView *container;
@end

SpecBegin(RPLayoutMarginsSpec)

    describe(@"Layout", ^{

        CGSize defaultRootViewSize = CGSizeMake(300, 200);

        it(@"should update margin constraint and view size", ^{
            UIView *rootView = createViewFoSize(defaultRootViewSize.width, defaultRootViewSize.height);
            HOLVerticalFlowView *flowScrollView = createFlowViewOnView(rootView);

            int margin = 50;

            flowScrollView.addView(@100).withLeftMargin(margin);
            [flowScrollView layoutIfNeeded];
            CGRect frame = [(UIView *) flowScrollView.views.lastObject frame];

            expect(frame.size.height).to.equal(100);
            expect(frame.size.width).to.equal(defaultRootViewSize.width - margin);
            expect(frame.origin.x).to.equal(margin);


            flowScrollView.withLeftMargin(0);
            [flowScrollView layoutIfNeeded];
            frame = [(UIView *) flowScrollView.views.lastObject frame];
            expect(frame.size.width).to.equal(defaultRootViewSize.width);
            expect(frame.origin.x).to.equal(0);

            flowScrollView.withRightMargin(margin);
            [flowScrollView layoutIfNeeded];
            frame = [(UIView *) flowScrollView.views.lastObject frame];
            expect(frame.size.width).to.equal(defaultRootViewSize.width - margin);
            expect(frame.origin.x).to.equal(0);

            flowScrollView.withLeftMargin(margin);
            [flowScrollView layoutIfNeeded];
            frame = [(UIView *) flowScrollView.views.lastObject frame];
            expect(frame.size.width).to.equal(defaultRootViewSize.width - margin - margin);
            expect(frame.origin.x).to.equal(margin);
        });

    });

SpecEnd

