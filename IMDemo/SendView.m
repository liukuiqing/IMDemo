//
//  SendView.m
//  IMDemo
//
//  Created by liukuiqing on 16/6/22.
//  Copyright © 2016年 lkq. All rights reserved.
//

#import "SendView.h"

@implementation SendView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
   
    return [super initWithFrame:frame];
}
-(void)setview{
    self.backgroundColor=[UIColor lightGrayColor];
    self.textfield=[[UITextField alloc] initWithFrame:CGRectMake(5, 5, [UIScreen mainScreen].bounds.size.width-100, 39)];
    self.textfield.borderStyle=UITextBorderStyleRoundedRect;
    [self addSubview:self.textfield];
    self.sendeBTN=[UIButton buttonWithType:UIButtonTypeCustom];
    self.sendeBTN.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-100+10, 5, 90, 39);
    [self addSubview:self.sendeBTN];
    [self.sendeBTN setTitle:@"发送" forState:UIControlStateNormal];
    [self.sendeBTN setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
}

@end
