//
//  MSgCell.m
//  IMDemo
//
//  Created by liukuiqing on 16/6/22.
//  Copyright © 2016年 lkq. All rights reserved.
//

#import "MSgCell.h"

@implementation MSgCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(UIImageView *)msgImageView
{
    if (_msgImageView==nil) {
        _msgImageView=[[UIImageView alloc]init];
        _msgImageView.layer.masksToBounds=YES;
        _msgImageView.layer.cornerRadius=15;
        [self.contentView addSubview:_msgImageView];
    }
    return _msgImageView;

}
-(UILabel *)msgLabel{

    if (_msgLabel==nil) {
        _msgLabel=[[UILabel alloc]init];
        _msgLabel.backgroundColor=[UIColor whiteColor];
        _msgLabel.layer.masksToBounds=YES;
        _msgLabel.layer.cornerRadius=5;
        _msgLabel.layer.borderWidth=1;
        _msgLabel.numberOfLines=0;
        _msgLabel.font=[UIFont systemFontOfSize:15];
        _msgLabel.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_msgLabel];
    }
    return _msgLabel;
}

-(UILabel *)nameLabel{
    if (_nameLabel==nil) {
        _nameLabel=[[UILabel alloc]init];
        _nameLabel.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}

-(void)setDict:(NSDictionary *)dict{

    if (_dict!=dict) {
        _dict=nil;
        _dict=dict;
    }
    
    self.nameLabel.text=[_dict objectForKey:@"name"];
    NSString *msg=[_dict objectForKey:@"msg"];
    self.msgLabel.text=msg;
    CGFloat w=[UIScreen mainScreen].bounds.size.width-80-10;
    
    CGRect rect=[msg boundingRectWithSize:CGSizeMake(w, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    if (![[_dict objectForKey:@"name"] isEqualToString:@"me"]) {
        self.msgImageView.backgroundColor=[UIColor greenColor];
        self.msgImageView.frame=CGRectMake(5, 5, 30, 30);
        self.nameLabel.frame=CGRectMake(5, 35,30, 15);
        if (rect.size.height<40) {
            self.msgLabel.textAlignment=NSTextAlignmentCenter;
             self.msgLabel.frame=CGRectMake(40, 5, rect.size.width+10, 40);
        }else
        {
              self.msgLabel.textAlignment=NSTextAlignmentLeft;
        self.msgLabel.frame=CGRectMake(40, 5, rect.size.width, rect.size.height);
        }
        
    }
    else
    {
        self.msgImageView.backgroundColor=[UIColor redColor];
        self.msgImageView.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-35, 5, 30, 30);
        self.nameLabel.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-35, 35,30, 15);
        if (rect.size.height<40) {
            self.msgLabel.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-40-rect.size.width-10, 5, rect.size.width+10, 40);
        }else
        {
            self.msgLabel.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-40-rect.size.width-10, 5, rect.size.width, rect.size.height);
        }
    }
}

@end
