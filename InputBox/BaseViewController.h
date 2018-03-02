//
//  BaseViewController.h
//  InputBox
//
//  Created by 何泽的mac on 2018/3/2.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+toos.h"
@interface BaseViewController : UIViewController
//告诉子类是否所有输入框是否填写完毕的block
@property(nonatomic,copy)void(^isOKBlock)(BOOL isOk);

@end
