//
//  BaseViewController.m
//  InputBox
//
//  Created by 何泽的mac on 2018/3/2.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

#import "BaseViewController.h"
//首先导入runtime库
#import <objc/runtime.h>
@interface BaseViewController ()<UITextFieldDelegate,UITextViewDelegate>
{
    BOOL isOK;//用来判断是否所有输入框都输入完毕
}
@property(nonatomic,strong)NSMutableDictionary * dic;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //刚进来，肯定没输入！所以为NO
    isOK =NO;
    
    self.dic = [NSMutableDictionary dictionary];
    
    //因为我们这里是父类，父类调用子类只能通过runtime做到！ 下面利用runtime遍历子类的成员变量
    unsigned int outCount = 0;
    Ivar * ivars = class_copyIvarList([self class], &outCount);
    for (unsigned int i = 0; i < outCount; i ++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);//获取成员变量名字
        const char * type = ivar_getTypeEncoding(ivar);//获取成员的原型
        if (strcmp(type, "@\"UITextField\"") == 0)//如果type是UITextField就进入方法
        {
            NSString * s = [NSString stringWithFormat:@"%s",name];//UITextField的名称
            UITextField * field = [(UITextField * )self valueForKey:s];//获取UITextField
            field.delegate = self;//签代理
            //监听UITextField改变的方法
            [field addTarget:self action:@selector(textFieldWithText:) forControlEvents:UIControlEventEditingChanged];
            //下面这行是利用字典记录UITextField的个数，以及内容
            [self.dic setValue:@"" forKeyPath:[NSString stringWithFormat:@"%d",i+100]];
        }
        if (strcmp(type, "@\"UITextView\"") == 0) {
            NSString * s = [NSString stringWithFormat:@"%s",name];
            UITextView * field = [(UITextField * )self valueForKey:s];
            field.delegate = self;
        }
    }
    free(ivars);
    
    // Do any additional setup after loading the view.
}

- (void)textFieldWithText:(UITextField *)textField
{
    unsigned int outCount = 0;
    Ivar * ivars = class_copyIvarList([self class], &outCount);
    for (unsigned int i = 0; i < outCount; i ++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        const char * type = ivar_getTypeEncoding(ivar);
        if (strcmp(type, "@\"UITextField\"") == 0)
        {
            NSString * s = [NSString stringWithFormat:@"%s",name];
            UITextField * field = [(UITextField * )self valueForKey:s];
            //每个输入框的改变，字典的value都会一起改变。
            [self.dic setValue:field.text forKeyPath:[NSString stringWithFormat:@"%d",i+100]];
        }
    }
    free(ivars);
    isOK = YES;//这里的意思是，输入后，先给你个YES 然后走下面的代码
    for (NSString * string in [self.dic allValues]) {
        if (string.length<1) {//只要发现输入后有输入框的值为空就为NO
            isOK =NO;
        }
    }

//下面就是返回结果给子类
    if (self.isOKBlock) {
        self.isOKBlock(isOK);
    }
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
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
