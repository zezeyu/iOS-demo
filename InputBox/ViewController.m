//
//  ViewController.m
//  InputBox
//
//  Created by 何泽的mac on 2018/3/2.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma --mark 跳到第一个控制器
- (IBAction)goController_One:(UIButton *)sender {
    
    OneViewController * one = [[OneViewController alloc]init];
    [self.navigationController pushViewController:one animated:YES];
}

#pragma --mark 跳到第二个控制器
- (IBAction)goController_two:(UIButton *)sender {
    
    TwoViewController * two = [[TwoViewController alloc]init];
    [self.navigationController pushViewController:two animated:YES];
}

#pragma --mark 跳到第三个控制器
- (IBAction)goController_three:(UIButton *)sender {
    
    ThreeViewController * three = [[ThreeViewController alloc]init];
    [self.navigationController pushViewController:three animated:YES];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
