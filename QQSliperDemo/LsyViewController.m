//
//  LsyViewController.m
//  Nplan
//
//  Created by swkj_lsy on 16/5/27.
//  Copyright © 2016年 thidnet. All rights reserved.
//

#import "LsyViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "LsyDrawerViewController.h"
@interface LsyViewController ()

@end

@implementation LsyViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    OneViewController * oneVC = [[OneViewController alloc]init];
    oneVC.tabBarItem.title = @"消息";

    TwoViewController * twoVC = [[TwoViewController alloc]init];
    twoVC.tabBarItem.title = @"联系人";
    
    ThreeViewController * threeVC = [[ThreeViewController alloc]init];
    threeVC.tabBarItem.title = @"动态";
    
     [self.tabBar setShadowImage:[UIImage new]];
    
      [self.tabBar setBackgroundImage:[UIImage new]];
    
    self.tabBar.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
     self.tabBar.tintColor = [UIColor whiteColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor whiteColor], UITextAttributeTextColor,
                                                       nil] forState:UIControlStateNormal];
    UIColor *titleHighlightedColor = [UIColor whiteColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleHighlightedColor, UITextAttributeTextColor,
                                                       nil] forState:UIControlStateSelected];
    
    self.viewControllers = @[
                             [self setNavWithVC:oneVC imgName:@"首页-未选中" selectImgName:@"首页-选中"],
                             [self setNavWithVC:twoVC imgName:@"活动-未选中" selectImgName:@"活动-选中"],
                             [self setNavWithVC:threeVC imgName:@"活动-未选中" selectImgName:@"活动-选中"],
                                                         ];
    
//    UIView * centerView = [[UIView alloc]init];
//    centerView.frame = CGRectMake((self.tabBar.frame.size.width - 70)/2.0, self.tabBar.frame.size.height - 70, 70, 70);
//    centerView.layer.cornerRadius = centerView.frame.size.width/2.0;
//    centerView.clipsToBounds = YES;
//    centerView.backgroundColor = [UIColor colorWithRed:221/255.0 green:63/255.0 blue:63/255.0 alpha:1];
//    [self.tabBar addSubview:centerView];
//    
//    UIButton * centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    centerBtn.frame = CGRectMake(5, 5, centerView.frame.size.width - 10, centerView.frame.size.height - 10);
//    centerBtn.backgroundColor = [UIColor whiteColor];
//    centerBtn.layer.cornerRadius = centerBtn.frame.size.width/2.0;
//    centerBtn.clipsToBounds = YES;
//    //[centerBtn setTitle:@"点击" forState:UIControlStateNormal];
//    //中间的按钮的背景图设置
//    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"相机"]];
//    imageView.frame = CGRectMake(10, 13, centerView.frame.size.width - 30, centerView.frame.size.height - 35);
//    [centerBtn addSubview:imageView];
//    [centerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [centerView addSubview:centerBtn];
}

 

- (UINavigationController *)setNavWithVC:(UIViewController *)VC imgName:(NSString *)imgName selectImgName:(NSString *)selectImgName
{
   
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:VC];
    nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:VC.tabBarItem.title image:[self removeRendering:imgName] selectedImage:[self removeRendering:selectImgName]];
    return nav;
}

- (UIImage *)removeRendering:(NSString *)imageName
{
    UIImage * image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
