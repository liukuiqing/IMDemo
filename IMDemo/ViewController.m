//
//  ViewController.m
//  IMDemo
//
//  Created by liukuiqing on 16/6/22.
//  Copyright © 2016年 lkq. All rights reserved.
//

#import "ViewController.h"
#import "MSgCell.h"
#import "SendView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong)UITableView *mtableview;
@property(nonatomic,retain)NSMutableArray *dataArray;
@property(nonatomic,strong)SendView *sendview;

@end

@implementation ViewController


-(NSMutableArray *)dataArray
{
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc]init];
        [_dataArray addObject:@{@"name":@"red",@"msg":@"你好"}];
         [_dataArray addObject:@{@"name":@"me",@"msg":@"你好"}];
         [_dataArray addObject:@{@"name":@"red",@"msg":@"吃饭走起"}];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    start
    self.mtableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-49-49)];
    self.mtableview.dataSource=self;
    self.mtableview.delegate=self;
    self.mtableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.mtableview.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.mtableview];
    
    
    self.sendview=[[SendView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-49, [UIScreen mainScreen].bounds.size.width, 49)];
    [self.sendview setview];
    [self.view addSubview:self.sendview];
    self.sendview.textfield.delegate=self;
    [self.sendview.sendeBTN addTarget:self action:@selector(sendmsgClick) forControlEvents:UIControlEventTouchUpInside];
    
    //注册键盘出现与隐藏时候的通知
       [[NSNotificationCenter defaultCenter] addObserver:self
                                                         selector:@selector(keyboadWillShow:)
                                                          name:UIKeyboardWillShowNotification
                                                        object:nil];
         [[NSNotificationCenter defaultCenter] addObserver:self
                                                       selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification
                                                     object:nil];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
  
   [self.view addGestureRecognizer:gesture];
}
-(void)hideKeyboard{
        [self.sendview.textfield resignFirstResponder];
  }

-(void)keyboardWillHide:(NSNotification *)note{
         [UIView beginAnimations:nil context:NULL];
       [UIView setAnimationDuration:0.3];
    self.sendview.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-49, [UIScreen mainScreen].bounds.size.width, 49);
    [UIView commitAnimations];
     }

-(void) keyboadWillShow:(NSNotification *)note{
        NSDictionary *info = [note userInfo];
        CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;        CGFloat offY = ([UIScreen mainScreen].bounds.size.height-keyboardSize.height)-self.sendview.frame.size.height;         [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
         self.sendview.frame =CGRectMake(0, offY, [UIScreen mainScreen].bounds.size.width, 49);
    [UIView commitAnimations];
    
}

-(void)sendmsgClick{
      [self.sendview.textfield resignFirstResponder];
//       self.sendview.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height-49, [UIScreen mainScreen].bounds.size.width, 49);
    if (self.sendview.textfield.text.length==0) {
        return;
    }
   
    [self.dataArray addObject:@{@"name":@"me",@"msg":self.sendview.textfield.text}];
    [self.mtableview reloadData];
  [self.sendview.textfield setText:@""];
}

#pragma marks ---textfield delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self sendmsgClick];
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma marks--tableview delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid=@"cellid";
    MSgCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell==nil) {
        cell=[[MSgCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.backgroundColor=[UIColor groupTableViewBackgroundColor];
    }
    if (self.dataArray.count>indexPath.row) {
        cell.dict=self.dataArray[indexPath.row];
    }
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count>indexPath.row) {
        NSString *msg=[self.dataArray[indexPath.row] objectForKey:@"msg"];
        CGFloat w=[UIScreen mainScreen].bounds.size.width-80-10;
        CGRect rect=[msg boundingRectWithSize:CGSizeMake(w, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        
        
        if (rect.size.height>40) {
            return rect.size.height+10;
        }
    }
    
   
    
    
    
    return 50;
}

@end
