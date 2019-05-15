//
//  ViewController.m
//  ios面试
//
//  Created by 高金才 on 2019/5/15.
//  Copyright © 2019 高金才. All rights reserved.
//

#import "ViewController.h"
#import "Cell/TitleCell.h"
#import "Cell/ThreeMageCell.h"
#import "Cell/LeftImgCell.h"
#import "Cell/ScroCell.h"
#import "WebTools/TxtHight.h"
@interface ViewController ()<UITableViewDelegate ,UITableViewDataSource>
{
    NSArray *getarr;
}
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tab=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, w, h-64)];
    tab .delegate =self;
    tab .dataSource=self;
    [tab setTableFooterView:[UIView new]];
    [self .view addSubview:tab];
    getarr =[NSArray array];
    [[webRequest Manager]GetRequestandComplet:^(NSDictionary *getdic) {
     getarr =getdic[@"list"];
    [tab reloadData];
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return getarr.count ;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([getarr[indexPath.row][@"doc_type"] integerValue]==0)
    {
        return [TxtHight getTxTheight:getarr[indexPath.row][@"title"] withWidth:w-10]+40;
        
    }
    else if ([getarr[indexPath.row][@"doc_type"] integerValue]==1)
    {
        return w/3;
    }
    else
    {
          return w/3;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idf =@"123";
    MageCell *cell =[tableView dequeueReusableCellWithIdentifier:idf];
    if (!cell)
    {
        cell=[[MageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idf];
    }
    cell .accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    if (getarr .count>1)
    {
        if ([getarr[indexPath.row][@"doc_type"] integerValue]==0)
        {
            
            [cell AddTitleLab:getarr[indexPath.row]];
            
        }
        else if ([getarr[indexPath.row][@"doc_type"] integerValue]==1)
        {
            [cell AddLeftImg:getarr[indexPath.row]];
        }
        else
        {
            [cell AddImg:getarr[indexPath.row]];
        }
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
}
@end
