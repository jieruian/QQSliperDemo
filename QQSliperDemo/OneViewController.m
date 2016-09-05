//
//  OneViewController.m
//  QQSideslip
//
//  Created by swkj_lsy on 16/9/2.
//  Copyright © 2016年 thidnet. All rights reserved.
//

#import "OneViewController.h"
#import "XXViewController.h"
#import "LsyDrawerViewController.h"
#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)
@interface OneViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView * _tableVC;
    NSMutableArray * _dataArray;
}


@end

@implementation OneViewController

-(void)viewWillAppear:(BOOL)animated{
    [self navgationPusd];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self removeNavPush];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"我的"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 32, 32);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    _dataArray = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        NSString * str = [NSString stringWithFormat:@"第%d个cell",i];
        [_dataArray addObject:str];
    }
    self.view.backgroundColor = [UIColor blueColor];
}
-(void)btnClick{
    lsy_showLeft(YES);
}
-(UITableView *)tableView{
    if (!_tableVC) {
        _tableVC = ({
            UITableView * tableVC = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
            tableVC.delegate = self;
            tableVC.dataSource = self;
            tableVC;
            
        });
        [self.view addSubview:_tableVC];
    }
    return _tableVC;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * indentifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone; 
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XXViewController * xxVC = [XXViewController new];
    [self.navigationController pushViewController:xxVC animated:YES];
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.textLabel.text = _dataArray[indexPath.row];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
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
