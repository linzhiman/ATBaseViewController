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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (_usingTransformView) {
        _transformView = [[UIView alloc] initWithFrame:CGRectZero];
        if (_navigationBarHidden) {
            _transformView.bounds = CGRectMake(0, 0, KXTransformViewWidth, KXTransformViewHeight);
        }
        else {
            _transformView.bounds = CGRectMake(0, 0, KXTransformViewWidthWithoutNavBar, KXTransformViewHeightWithoutNavBar);
        }
        [self.view addSubview:_transformView];
    }
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if (_transformView) {
        _transformView.center = self.view.center;
        
        if (self.view.bounds.size.width != iphone6OriginalWidth) {
            float sy = self.view.bounds.size.height / (_navigationBarHidden ? KXTransformViewHeight : KXTransformViewHeightWithoutNavBar);
            _transformView.transform = CGAffineTransformMakeScale(sy, sy);
        }
    }
}

@end
