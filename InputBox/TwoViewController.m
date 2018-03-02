
//
//  TwoViewController.m
//  InputBox
//
//  Created by 何泽的mac on 2018/3/2.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *TF1;

@property (weak, nonatomic) IBOutlet UITextField *TF2;

@property (weak, nonatomic) IBOutlet UITextField *TF3;

@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_button setNotOptionalBut];
    __weak typeof(self)weakself = self;
    self.isOKBlock = ^(BOOL isOK){
        if (isOK) {
            [weakself.button setOptionalBut];
        }else{
            [weakself.button setNotOptionalBut];
        }
    };
    
}




- (IBAction)pop_Basecontroller:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
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
