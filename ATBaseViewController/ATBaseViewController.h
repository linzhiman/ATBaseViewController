//
//  ATBaseViewController.h
//  demo
//
//  Created by linzhiman on 2018/8/21.
//  Copyright © 2018年 linzhiman. All rights reserved.
//

#import <UIKit/UIKit.h>

#define AT_IPHONE6_WIDTH 375
#define AT_IPHONE6_HEIGHT 667

#define AT_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define AT_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define AT_IPHONEX_SET (AT_SCREEN_WIDTH >= 375.f && AT_SCREEN_HEIGHT >= 812.f )//X,XR,XS
#define AT_STATUSBAR_HEIGHT (AT_IPHONEX_SET ? 44.f : 20.f)
#define AT_STATUSBAR_AND_NAVIGATION_BAR_HEIGHT (AT_IPHONEX_SET ? 88.f : 64.f)

typedef NS_ENUM(NSInteger, ATTransformViewType)
{
    ATTransformViewType_FullScreen,
    ATTransformViewType_NavBarShow
};

#define ATTransformViewWidthForFullScreen ([ATBaseViewController transformViewWidthFor:ATTransformViewType_FullScreen])

@interface ATBaseViewController : UIViewController

+ (CGFloat)transformViewWidthFor:(ATTransformViewType)type;

@property (nonatomic, strong) UIView *transformView;
@property (nonatomic, assign) BOOL usingTransformView;
@property (nonatomic, assign, readonly) CGFloat transformViewWidth;
@property (nonatomic, assign, readonly) CGFloat transformViewHeight;

/**
 *  viewDidLoad前设置，影响transformView高度；
 */
@property (nonatomic, assign) BOOL navigationBarHidden;

@end
