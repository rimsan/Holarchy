//
//  RPLayoutScrollingSpec.m
//  RPVerticalFlowScrollView
//
//  Created by Roman Petryshen on 29/07/15.
//  Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import <Holarchy/Holarchy.h>
#import "Helpers.h"


@interface HOLVerticalFlowBuilder (RPLayoutScrollingSpec)
@property (nonatomic, strong) NSArray *views;
@end

SpecBegin(RPLayoutScrollingSpec)

    describe(@"Layout's rootView after adding views", ^{

        CGSize defaultRootViewSize = CGSizeMake(300, 200);
        UIView *rootView = createViewFoSize(defaultRootViewSize.width, defaultRootViewSize.height);
        HOLVerticalFlowBuilder *flowScrollView = createFlowViewOnView(rootView);

        NSNumber *expectedHeight = @300;
        flowScrollView.addView(expectedHeight);
        [flowScrollView.rootView setNeedsLayout];
        [flowScrollView.rootView layoutIfNeeded];

        it(@"must update it's contentSize to container size", ^{
            expect([(UIScrollView *) flowScrollView.rootView contentSize].width).to.equal(defaultRootViewSize.width);
            expect([(UIScrollView *) flowScrollView.rootView contentSize].height).to.equal(expectedHeight);
        });


    });

SpecEnd