//
//  ATBaseViewController.m
//  demo
//
//  Created by linzhiman on 2018/8/21.
//  Copyright © 2018年 linzhiman. All rights reserved.
//

#import "ATBaseViewController.h"

@interface ATBaseViewController ()

@end

@implementation ATBaseViewController

+ (CGFloat)transformViewWidthFor:(ATTransformViewType)type
{
    CGFloat barHeight = type == ATTransformViewType_FullScreen ? 0 : AT_STATUSBAR_AND_NAVIGATION_BAR_HEIGHT;
    if (AT_SCREEN_HEIGHT >= AT_IPHONE6_HEIGHT) {
        return AT_SCREEN_WIDTH;
    }
    
    return AT_SCREEN_WIDTH / ((AT_SCREEN_HEIGHT - barHeight) / (AT_IPHONE6_HEIGHT - barHeight));
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.usingTransformView) {
        self.transformView = [[UIView alloc] initWithFrame:CGRectZero];
        self.transformView.bounds = CGRectMake(0, 0, [self transformViewWidth], [self transformViewHeight]);
        [self.view addSubview:self.transformView];
    }
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if (self.transformView) {
        self.transformView.center = CGPointMake(CGRectGetWidth(self.view.frame) / 2,
                                                CGRectGetHeight(self.view.frame) / 2 );
        
        if (AT_SCREEN_HEIGHT < AT_IPHONE6_HEIGHT) {//6以下才缩放
            float sy = self.view.bounds.size.height / [self transformViewHeight];
            self.transformView.transform = CGAffineTransformMakeScale(sy, sy);
        }
    }
}

/**
 * 4、4s           320×480
 * 5、5s、5c、SE    320×568
 * 6、6s、7、8      375×667
 * 6+、6s+、7+、8+  414×736
 * XR              414×896
 * X、XS           375×812
 * XS Max          414×896
 */
- (CGFloat)transformViewWidth
{
    if (self.usingTransformView == NO) {
        return 0;
    }
    ATTransformViewType type = ATTransformViewType_NavBarShow;
    if ([self navigationBarHidden]) {
        type = ATTransformViewType_FullScreen;
    }
    return [ATBaseViewController transformViewWidthFor:type];
}

- (CGFloat)transformViewHeight
{
    if (self.usingTransformView == NO || AT_SCREEN_HEIGHT >= AT_IPHONE6_HEIGHT) {
        return self.view.bounds.size.height;
    }
    CGFloat barHeight = [self navigationBarHidden] ? 0 : AT_STATUSBAR_AND_NAVIGATION_BAR_HEIGHT;
    return AT_IPHONE6_HEIGHT - barHeight;
}

@end
