//
//  ViewController.m
//  XHActionSheet
//
//  Created by chengxianghe on 15/12/31.
//  Copyright © 2015年 CXH. All rights reserved.
//

#import "ViewController.h"
#import "XHActionSheet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    

    
}
- (IBAction)onLeftClick:(id)sender {
    
    XHActionSheet *action = [[XHActionSheet alloc] initWithTitle:@"left退出登录后不会删除任何历史数据, 下次登录依然可以使用本账号, 请牢记你的账号密码~" cancelTitle:@"取消" otherTitles:@[@"退出登录",@"test1",@"test2",@"test3",@"test4",@"test5"]];
    
    [action changeItemTitleColor:[UIColor redColor] withIndex:1];
    
    [action showInView:nil custom:nil clickIndex:^(NSInteger clickIndex) {
        NSLog(@"dismiss--%ld", (long)clickIndex);
    } cancel:^{
        NSLog(@"cancel");
    }];
}

- (IBAction)onClick:(id)sender {
    
    __weak typeof(self)weakSelf = self;
    XHActionSheet *action = [XHActionSheet showInView:self.view title:@"right退出登录后不会删除任何历史数据, 下次登录依然可以使用本账号, 请牢记你的账号密码~" cancelTitle:@"取消" otherTitles:@[@"退出登录",@"test1",@"test2",@"test3",@"test4",@"test5"] custom:^(XHActionSheet *actionSheet, UILabel *titleLabel) {
        
        [actionSheet changeActionSheetTitle:@"right"];
        [actionSheet changeItemTitleColor:[UIColor redColor] withIndex:1];

    } clickIndex:^(NSInteger clickIndex) {
        NSLog(@"dismiss--%ld", (long)clickIndex);
        if (clickIndex == 2) {
            [weakSelf nextAction];
        } else if (clickIndex == 3) {
            [weakSelf nextAction2];
        }
    } cancel:^{
        NSLog(@"cancel");
    }];
    
    [action changeActionSheetTitle:@"点击test1 启动下一个选项"];
}

- (void)nextAction {
    __weak typeof(self)weakSelf = self;
    [XHActionSheet showInView:self.view title:@"退出登录后不会删除任何历史数据, 下次登录依然可以使用本账号, 请牢记你的账号密码~" cancelTitle:@"取消" otherTitles:@[@"退出登录",@"test1",@"test2",@"test3",@"test4",@"push到下个界面"] custom:^(XHActionSheet *actionSheet, UILabel *titleLabel) {
        
        titleLabel.textColor = [UIColor orangeColor];
        titleLabel.font = [UIFont systemFontOfSize:18.0];
        
        [actionSheet changeItemTitleColor:[UIColor redColor] withIndex:1];
        [actionSheet changeItemTitleColor:[UIColor greenColor] withIndex:6];

    } clickIndex:^(NSInteger clickIndex) {
        NSLog(@"dismiss--%ld", (long)clickIndex);
        if (clickIndex == 1) {
            NSLog(@"退出登录");
        } else if (clickIndex == 6) {
            UIViewController *vc = [[UIViewController alloc] init];
            vc.view.backgroundColor = [UIColor whiteColor];
            vc.hidesBottomBarWhenPushed = true;
            [weakSelf.navigationController pushViewController:vc animated:true];
        }
    } cancel:^{
        NSLog(@"cancel");
    }];

}

// 空的
- (void)nextAction2 {
    [XHActionSheet showInView:nil title:nil cancelTitle:nil otherTitles:nil custom:nil clickIndex:nil cancel:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
