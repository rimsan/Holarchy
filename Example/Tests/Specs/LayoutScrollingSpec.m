//
//  RPLayoutScrollingSpec.m
//  RPVerticalFlowScrollView
//
//  Created by Roman Petryshen on 29/07/15.
//  Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import "Specta/Specta.h"
#import "Expecta/Expecta.h"
#import "Masonry/Masonry.h"
#import "HOLVerticalFlowView.h"
#import "Helpers.h"


@interface HOLVerticalFlowView (RPLayoutScrollingSpec)
@property (nonatomic, strong) NSArray *views;
@end

SpecBegin(RPLayoutScrollingSpec)

    describe(@"Layout's scrollView after adding views", ^{

        CGSize defaultRootViewSize = CGSizeMake(300, 200);
        UIView *rootView = createViewFoSize(defaultRootViewSize.width, defaultRootViewSize.height);
        HOLVerticalFlowView *flowScrollView = createFlowViewOnView(rootView);

        NSNumber *expectedHeight = @300;
        flowScrollView.addView(expectedHeight);
        [flowScrollView setNeedsLayout];
        [flowScrollView layoutIfNeeded];

        it(@"must update it's contentSize to container size", ^{
            expect(flowScrollView.contentSize.width).to.equal(defaultRootViewSize.width);
            expect(flowScrollView.contentSize.height).to.equal(expectedHeight);
        });


    });

SpecEnd