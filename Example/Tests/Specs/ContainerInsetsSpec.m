//
//  HOLContainerInsetsSpec.m
//  RPVerticalFlowScrollView
//
//  Created by Roman Petryshen on 06/09/15.
//  Copyright (c) 2015 Roman Petryshen. All rights reserved.
//


#import "Specta/Specta.h"
#import "Expecta/Expecta.h"
#import "Masonry/Masonry.h"
#import <Holarchy/Holarchy.h>
#import "Helpers.h"


@interface HOLVerticalFlowView (HOLContainerInsetsSpec)
@property (nonatomic, strong) NSArray *views;
@end

SpecBegin(ContainerInsetsSpec)

    describe(@"contentViewInsets property", ^{

        it(@"should set margins properly", ^{
            
            CGSize defaultRootViewSize = CGSizeMake(300, 200);
            UIView *rootView = createViewFoSize(defaultRootViewSize.width, defaultRootViewSize.height);
            HOLVerticalFlowView *flowScrollView = createFlowViewOnView(rootView);
            
            flowScrollView.addView(@200);
            
            [flowScrollView.scrollView setNeedsLayout];
            [flowScrollView.scrollView layoutIfNeeded];
            
            UIView *testView = flowScrollView.views.lastObject;
            UIView *container = flowScrollView.contentView;

            UIEdgeInsets insets = UIEdgeInsetsZero;

            expect(container.f_x).to.equal(insets.left);
            expect(container.f_y).to.equal(insets.top);
            expect(container.f_maxX).to.equal(defaultRootViewSize.width - insets.right);
            expect(container.f_maxY).to.equal(testView.f_height + insets.top);


            insets.top = 10;
            flowScrollView.contentViewInsets = insets;
            expect(container.f_x).to.equal(insets.left);
            expect(container.f_y).to.equal(insets.top);
            expect(container.f_maxX).to.equal(defaultRootViewSize.width - insets.right);
            expect(container.f_maxY).to.equal(testView.f_height + insets.top);


            insets.left = 20;
            flowScrollView.contentViewInsets = insets;
            expect(container.f_x).to.equal(insets.left);
            expect(container.f_y).to.equal(insets.top);
            expect(container.f_maxX).to.equal(defaultRootViewSize.width - insets.right);
            expect(container.f_maxY).to.equal(testView.f_height + insets.top);


            insets.right = 30;
            flowScrollView.contentViewInsets = insets;
            expect(container.f_x).to.equal(insets.left);
            expect(container.f_y).to.equal(insets.top);
            expect(container.f_maxX).to.equal(defaultRootViewSize.width - insets.right);
            expect(container.f_maxY).to.equal(testView.f_height + insets.top);


            insets.bottom = 40;
            flowScrollView.contentViewInsets = insets;
            expect(container.f_x).to.equal(insets.left);
            expect(container.f_y).to.equal(insets.top);
            expect(container.f_maxX).to.equal(defaultRootViewSize.width - insets.right);
            expect(container.f_maxY).to.equal(testView.f_height + insets.top);
            expect(flowScrollView.scrollView.contentSize.height).to.equal(testView.f_height + insets.top + insets.bottom);
        });
    });

SpecEnd


