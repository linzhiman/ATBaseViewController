//
//  ViewController.m
//  demo
//
//  Created by linzhiman on 2018/8/21.
//  Copyright © 2018年 linzhiman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.usingTransformView = YES;
    self.navigationBarHidden = YES;
    
    [super viewDidLoad];
    
    {{
        UIButton *aButton = [UIButton new];
        aButton.backgroundColor = [UIColor blueColor];
        aButton.frame = CGRectMake(0, 0, 100, 30);
        [aButton setTitle:@"left top" forState:UIControlStateNormal];
        [self.transformView addSubview:aButton];
    }}
    
    {{
        UIButton *aButton = [UIButton new];
        aButton.backgroundColor = [UIColor blueColor];
        aButton.frame = CGRectMake(KXTransformViewWidth - 100, 0, 100, 30);
        [aButton setTitle:@"right top" forState:UIControlStateNormal];
        [self.transformView addSubview:aButton];
    }}
    
    {{
        UIButton *aButton = [UIButton new];
        aButton.backgroundColor = [UIColor blueColor];
        aButton.frame = CGRectMake(0, KXTransformViewHeight - 30, 100, 30);
        [aButton setTitle:@"left bottom" forState:UIControlStateNormal];
        [self.transformView addSubview:aButton];
    }}
    
    {{
        UIButton *aButton = [UIButton new];
        aButton.backgroundColor = [UIColor blueColor];
        aButton.frame = CGRectMake(KXTransformViewWidth - 100, KXTransformViewHeight - 30, 100, 30);
        [aButton setTitle:@"right bottom" forState:UIControlStateNormal];
        [self.transformView addSubview:aButton];
    }}
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
