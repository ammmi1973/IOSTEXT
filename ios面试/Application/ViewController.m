//
//  ViewController.m
//  ios面试
//
//  Created by 高金才 on 2019/5/15.
//  Copyright © 2019 高金才. All rights reserved.
#import "ViewController.h"
#import "TitleCell.h"
#import "ThreeMageCell.h"
#import "LeftImgCell.h"
#import "TxtHight.h"
#import "MainVcView.h"
#import "WebViewVc.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
@interface ViewController ()<UITableViewDelegate ,UITableViewDataSource,SDCycleScrollViewDelegate>
{
    NSArray *getarr;
    MainVcView *mainview;
    NSArray *listarr;
}
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self .tit .text =@"首页";
     mainview =[MainVcView new];
    [self .view addSubview:mainview];
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, mainview.bounds.size.height) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.currentPageDotColor = [UIColor whiteColor]; //
    [mainview addSubview:cycleScrollView];

    UITableView *tab=[[UITableView alloc]initWithFrame:CGRectMake(0, nav_height+mainview.bounds.size.height, w, h-nav_height-mainview.bounds.size.height-safeBottom)];
    tab .delegate =self;
    tab .dataSource=self;
    [tab setTableFooterView:[UIView new]];
    [self .view addSubview:tab];
    getarr =[NSArray array];
    [[webRequest Manager]GetRequestandComplet:^(NSDictionary *getdic) {
     getarr =getdic[@"list"];
        listarr=getdic[@"list_slide"];
        NSMutableArray *titarr=[NSMutableArray array];
        NSMutableArray *imgarr=[NSMutableArray array];
        
        for (int i=0; i<listarr.count; i++) {
            [titarr addObject:listarr[i][@"title"]];
            [imgarr addObject:listarr[i][@"photo"]];
        }
    cycleScrollView.titlesGroup = titarr;
        cycleScrollView .imageURLStringsGroup=imgarr;   
    [tab reloadData];
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return getarr.count ;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (getarr .count>0) {
        if ([getarr[indexPath.row][@"doc_type"] integerValue]==0)
        {
            return [TxtHight getTxTheight:getarr[indexPath.row][@"title"] withWidth:w-10]+50;
        }
        else if ([getarr[indexPath.row][@"doc_type"] integerValue]==1)
        {
            return w/3;
        }
        else
        {
            return  60+(w/3);
        }
    }
    return 0;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([getarr[indexPath.row][@"doc_type"] integerValue]==0)
    {
        static NSString * TitleCellidf=@"TitleCellidf";
        
            TitleCell *cell =[tableView dequeueReusableCellWithIdentifier:TitleCellidf];
            if (!cell)
            {
                cell=[[TitleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TitleCellidf];
            }
         [cell AddTitleLab:getarr[indexPath.row]];
        
        return cell;
    }
    else if ([getarr[indexPath.row][@"doc_type"] integerValue]==1)
    {
        static NSString * leftImgCellidf=@"leftImgCellidf";
            LeftImgCell *cell =[tableView dequeueReusableCellWithIdentifier:leftImgCellidf];
            if (!cell)
            {
                cell=[[LeftImgCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:leftImgCellidf];
            }
        [cell AddLeftImg:getarr[indexPath.row]];
         return cell;
    }
    else
    {
        static NSString * ThreeMageCellidf=@"ThreeMageCellidf";
       ThreeMageCell *cell =[tableView dequeueReusableCellWithIdentifier:ThreeMageCellidf];
        if (!cell)
        {
            cell=[[ThreeMageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ThreeMageCellidf];
        }
       [cell AddTheeImg:getarr[indexPath.row]];
        return cell;
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WebViewVc *webvi=[WebViewVc new];
    webvi .hidesBottomBarWhenPushed=YES;
    webvi .weburl =getarr[indexPath .row][@"contentUrl"];
    [self .navigationController pushViewController:webvi animated:YES];
}
/*
 */
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
    WebViewVc *webvi=[WebViewVc new];
    webvi .hidesBottomBarWhenPushed=YES;
    webvi .weburl =listarr[index][@"contentUrl"];
    [self .navigationController pushViewController:webvi animated:YES];
}
@end
