//
//  UIButton+toos.m
//  InputBox
//
//  Created by 何泽的mac on 2018/3/2.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

#import "UIButton+toos.h"

@implementation UIButton (toos)


-(void)setOptionalBut{
    [self setTitle:@"点我点我" forState:UIControlStateNormal];
    self.userInteractionEnabled = YES;
    self.backgroundColor = [UIColor redColor];
}

-(void)setNotOptionalBut{
    [self setTitle:@"没输入完..." forState:UIControlStateNormal];
    self.userInteractionEnabled = NO;
    self.backgroundColor = [UIColor lightGrayColor];
    
}



@end
