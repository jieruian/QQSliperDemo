//
//  LSYDrawerViewController.h
//  LSYDrawer
//
//  Created by swkj_lsy on 16/9/1.
//  Copyright © 2016年 thidnet. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * Lsy_DRAWER_SHOW_LEFT;
extern NSString * Lsy_DRAWER_SHOW_RIGHT;
extern NSString * Lsy_DRAWER_DISMISS;

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wunused-function"
static void lsy_showLeft(BOOL animated) {
    [[NSNotificationCenter defaultCenter]postNotificationName:Lsy_DRAWER_SHOW_LEFT object:nil userInfo:@{@"animated":@(animated)}];
};

static void lsy_showRight(BOOL animated) {
    [[NSNotificationCenter defaultCenter]postNotificationName:Lsy_DRAWER_SHOW_RIGHT object:nil userInfo:@{@"animated":@(animated)}];
};

static void lsy_dismiss(BOOL animated) {
    [[NSNotificationCenter defaultCenter]postNotificationName:Lsy_DRAWER_DISMISS object:nil userInfo:@{@"animated":@(animated)}];
};
#pragma clang diagnostic pop

@interface LsyDrawerViewController : UIViewController

typedef NS_ENUM(NSInteger,WZXDrawerType) {
    /** 默认,平行 */
    LSYDrawerTypePlane,
};

@property(nonatomic,strong)UIViewController * leftVC;
@property(nonatomic,strong)UITabBarController * mainVC;
@property(nonatomic,strong)UIViewController * rightVC;

/**
 *  默认LSYDrawerTypePlane
 */
@property(nonatomic,assign)WZXDrawerType drawerType;

/**
 *  默认300
 */
@property(nonatomic,assign)CGFloat leftViewWidth;

/**
 *  默认300
 */
@property(nonatomic,assign)CGFloat rightViewWidth;

/**
 *  默认YES
 */
@property(nonatomic,assign)BOOL canPan;

/**
 *  动画时间,默认0.5s
 */
@property(nonatomic,assign)CGFloat duration;
/**
 *  左右抽屉
 *
 *  @param leftVC  左vc
 *  @param mainVC  中间vc
 *  @param rightVC 右vc
 *
 *  @return WZXDrawerViewController对象
 */
+ (instancetype)lsy_drawerViewControllerWithLeftViewController:(UIViewController *)leftVC mainViewController:(UITabBarController *)mainVC rightViewController:(UIViewController *)rightVC;
/**
 *  左抽屉
 *
 *  @param leftVC 左vc
 *  @param mainVC 中间vc
 *
 *  @return WZXDrawerViewController对象
 */
+ (LsyDrawerViewController *)lsy_drawerViewControllerWithLeftViewController:(UIViewController *)leftVC mainViewController:(UITabBarController *)mainVC;

/**
 *  右抽屉
 *
 *  @param mainVC  中间vc
 *  @param rightVC 右vc
 *
 *  @return WZXDrawerViewController对象
 */
+ (LsyDrawerViewController *)lsy_drawerViewControllerWithMainViewController:(UITabBarController *)mainVC rightViewController:(UIViewController *)rightVC;

- (instancetype)initWithLeftViewController:(UIViewController *)leftVC mainViewController:(UITabBarController *)mainVC rightViewController:(UIViewController *)rightVC;




@end
