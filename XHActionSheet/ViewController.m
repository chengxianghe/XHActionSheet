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
    
    
    [action showInView:nil clickIndex:^(NSInteger clickIndex) {
        NSLog(@"dismiss--%ld", (long)clickIndex);
    } cancel:^{
        NSLog(@"cancel");
    }];
    

}

- (IBAction)onClick:(id)sender {
    
    XHActionSheet *action = [XHActionSheet showInView:self.view title:@"right退出登录后不会删除任何历史数据, 下次登录依然可以使用本账号, 请牢记你的账号密码~" cancelTitle:@"取消" otherTitles:@[@"退出登录",@"test1",@"test2",@"test3",@"test4",@"test5"] custom:^(XHActionSheet *actionSheet) {
        [actionSheet changeActionSheetTitle:@"right"];

        [actionSheet changeItemTitleColor:[UIColor redColor] withIndex:1];

    } clickIndex:^(NSInteger clickIndex) {
        NSLog(@"dismiss--%ld", (long)clickIndex);
    } cancel:^{
        NSLog(@"cancel");
    }];
    
    [action changeActionSheetTitle:@"title啊"];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
