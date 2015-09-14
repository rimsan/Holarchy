//
//  LayoutSpec.m
//  RPVerticalFlowScrollView
//
//  Created by Roman Petryshen on 15/06/15.
//  Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import "Specta/Specta.h"
#import "Expecta/Expecta.h"
#import "Masonry/Masonry.h"
#import "HOLVerticalFlowView.h"
#import "Helpers.h"


@interface HOLVerticalFlowView (LayoutSpec)
@property(nonatomic, strong) NSArray *views;
@property(nonatomic, strong) UIView *container;
@end

SpecBegin(LayoutSpec)

    describe(@"Layout", ^{

        CGSize defaultRootViewSize = CGSizeMake(300, 200);

        CGSize (^layoutSizeWithViews)(NSArray *) = ^(NSArray *items) {
            UIView *rootView = createViewFoSize(defaultRootViewSize.width, defaultRootViewSize.height);
            HOLVerticalFlowView *flowScrollView = createFlowViewOnView(rootView);
            [items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                flowScrollView.addView(obj);
            }];
            [flowScrollView layoutIfNeeded];
            return flowScrollView.container.frame.size;
        };

        //Tests

        it(@"should adopt correct height for different numeric item sets", ^{
            CGSize size = layoutSizeWithViews(@[
                    @100,
            ]);
            expect(size.height).to.equal(@100);
        });

        it(@"should adopt correct height for 2 numeric items", ^{
            CGSize size = layoutSizeWithViews(@[
                    @100,
                    @200,
            ]);
            expect(size.height).to.equal(@300);
        });

        it(@"should adopt correct height for view", ^{
            CGSize size = layoutSizeWithViews(@[
                    viewWithHeight(@50),
            ]);
            expect(size.height).to.equal(@50);
        });

        it(@"should adopt correct height with mix of views", ^{
            CGSize size = layoutSizeWithViews(@[
                    @10,
                    viewWithHeight(@10),
                    viewWithHeight(@10),
                    @10,
                    viewWithHeight(@10),
                    @10,
                    @10,
            ]);
            expect(size.height).to.equal(@70);
        });

        it(@"should adopt correct height with views from array", ^{
            UIView *rootView = createViewFoSize(defaultRootViewSize.width, defaultRootViewSize.height);
            HOLVerticalFlowView *flowScrollView = createFlowViewOnView(rootView);

            flowScrollView.addElements(@[
                    @10,
                    viewWithHeight(@10),
                    viewWithHeight(@10),
                    @10,
                    viewWithHeight(@10),
                    @10,
                    @10,
            ]);

            [flowScrollView layoutIfNeeded];
            CGSize size = flowScrollView.container.frame.size;

            expect(size.height).to.equal(@70);
        });

    });

SpecEnd

