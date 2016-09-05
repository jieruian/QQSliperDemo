//
//  TwoViewController.m
//  QQSideslip
//
//  Created by swkj_lsy on 16/9/2.
//  Copyright © 2016年 thidnet. All rights reserved.
//

#import "TwoViewController.h"
#import "XXViewController.h"
@interface TwoViewController ()

@end

@implementation TwoViewController

-(void)viewWillAppear:(BOOL)animated{
    [self navgationPusd];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self removeNavPush];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
}
//导航栏切换的通知
-(void)removeNavPush{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"lsy_framework" object:nil];
}
-(void)navgationPusd{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(navigationPush:) name:@"lsy_framework" object:nil];
    
}
-(void)navigationPush:(NSNotification *)notic{
    if ([[notic object] isEqualToString:@"one"]) {
        XXViewController * xxVC = [XXViewController new];
        xxVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:xxVC animated:YES];
    }
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
