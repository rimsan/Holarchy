//
//  VerticalViewHeightSpec.m
//  Holarchy
//
//  Created by Roman Petryshen on 24/09/15.
//  Copyright © 2015 Roman Petryshen. All rights reserved.
//

#import "Specta/Specta.h"
#import "Expecta/Expecta.h"
#import "Masonry/Masonry.h"
#import "HOLVerticalFlowView.h"
#import "Helpers.h"


@interface HOLVerticalFlowView (VerticalViewHeightSpec)
@property (nonatomic, strong) NSArray *views;
@end

SpecBegin(VerticalViewHeightSpec)

describe(@"HOLVerticalFlowView.withHeight() method", ^{
    
    
    
    it(@"should set correct height for the last added view", ^{

        CGSize defaultRootViewSize = CGSizeMake(300, 200);
        UIView *rootView = createViewFoSize(defaultRootViewSize.width, defaultRootViewSize.height);
        HOLVerticalFlowView *flowScrollView = createFlowViewOnView(rootView);
        
        UIView *testView = [UIView new];
        CGFloat expectedHeight = 50;
        
        flowScrollView.addView(testView).withHeight(expectedHeight);
        [flowScrollView setNeedsLayout];
        [flowScrollView layoutIfNeeded];
        
        expect(testView.f_height).to.equal(expectedHeight);
    });
    
    it(@"should update height for the last added view", ^{
        
        CGSize defaultRootViewSize = CGSizeMake(300, 200);
        UIView *rootView = createViewFoSize(defaultRootViewSize.width, defaultRootViewSize.height);
        HOLVerticalFlowView *flowScrollView = createFlowViewOnView(rootView);
        
        UIView *testView = [UIView new];
        CGFloat expectedHeight = 50;
        
        flowScrollView.addView(testView).withHeight(123);
        
        [flowScrollView setNeedsLayout];
        [flowScrollView layoutIfNeeded];

        
        flowScrollView.withHeight(expectedHeight);
        
        [flowScrollView setNeedsLayout];
        [flowScrollView layoutIfNeeded];
        
        expect(testView.f_height).to.equal(expectedHeight);
    });

    
    
});

SpecEnd
