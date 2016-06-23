//
//  MSgCell.h
//  IMDemo
//
//  Created by liukuiqing on 16/6/22.
//  Copyright © 2016年 lkq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSgCell : UITableViewCell

@property(nonatomic,retain)NSDictionary *dict;

@property(nonatomic,strong)UIImageView *msgImageView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *msgLabel;

@end
