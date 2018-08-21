//
//  ATBaseViewController.h
//  demo
//
//  Created by linzhiman on 2018/8/21.
//  Copyright © 2018年 linzhiman. All rights reserved.
//

#import <UIKit/UIKit.h>

#define iphone6OriginalWidth 375
#define iphone6OriginalHeight 667

#define KXTransformScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define KXTransformScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define KXTransformNavBarHeight (KXTransformScreenHeight > 800 ? 88 : 64)
#define KXTransformViewWidth (KXTransformScreenWidth != 375 ? KXTransformScreenWidth/(KXTransformScreenHeight/667.0) : 375)
#define KXTransformViewHeight (KXTransformScreenHeight > 800 ? 812 : 667)
#define KXTransformViewWidthWithoutNavBar (KXTransformScreenWidth != 375 ? KXTransformScreenWidth/((KXTransformScreenHeight-KXTransformNavBarHeight)/(667.0-KXTransformNavBarHeight)) : 375)
#define KXTransformViewHeightWithoutNavBar (KXTransformViewHeight - KXTransformNavBarHeight)

@interface ATBaseViewController : UIViewController

/**
 *  基于iPhone 6的尺寸做transform，注意subView宽度需要通过KXTransformViewWidth这个宏指定！
 *  以下数据为全屏场景下，有导航栏时相应减去导航栏高度；
 *  1、在iPhone X上宽度一致，不做缩放；安全区的适配不变；此时transformView的大小375*812；
 *  2、在Plus机型上，缩放因子为736/667.0，此时transformView的大小约为375*667；
 *  3、在iPhone 5/5S/5C上，缩放因子为568/667.0，此时transformView的大小约为375*667；
 *  4、在iPad/iPhone 4/4S上，缩放因子为480/667.0，此时transformView的大小约为445*667；
 */
@property (nonatomic, strong) UIView *transformView;

/**
 *  viewDidLoad前设置，影响transformView高度；
 */
@property (nonatomic, assign) BOOL navigationBarHidden;

@property (nonatomic, assign) BOOL usingTransformView;

@end
