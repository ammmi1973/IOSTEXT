//
//  MageCell.m
//  ios面试
//
//  Created by 高金才 on 2019/5/14.
//  Copyright © 2019 高金才. All rights reserved.
//
#import "ThreeMageCel.h"
#import "WebTools/TxtHight.h"
@implementation ThreeMageCel
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        <#statements#>
    }
    return self;
}
-(void)AddTitleLab:(NSDictionary *)TitDic
{
    UILabel * titlelab =[[UILabel alloc]initWithFrame:CGRectMake(5, 0, w-10, [TxtHight getTxTheight:TitDic[@"title"] withWidth:w-10]+40)];
    titlelab .textColor =[UIColor blueColor];
    titlelab .font =[UIFont systemFontOfSize:15];
    titlelab .textAlignment=0;
    titlelab .numberOfLines=0;
    titlelab .layer.masksToBounds =YES;
    titlelab .text=TitDic[@"title"];
    [self addSubview:titlelab];
}
-(void)AddScrImg:(NSDictionary *)ScrImgDic
{
  
    _scrvi=[[UIScrollView alloc]initWithFrame:self .frame];
    _scrvi .contentOffset=CGPointMake(0, 0);
    _scrvi .scrollEnabled=NO;
    _scrvi .pagingEnabled=YES;
    _scrvi .backgroundColor=[UIColor whiteColor];
 
    [self addSubview:_scrvi];
  
    
}
-(void)AddImg:(NSDictionary *)ImgDic
{
    UILabel * titlelab =[[UILabel alloc]initWithFrame:CGRectMake(40, 0, w-80, 40)];
    titlelab .textColor =[UIColor whiteColor];
    titlelab .font =[UIFont systemFontOfSize:15];
    titlelab .textAlignment=1;
    [self addSubview:titlelab];
    NSArray *imgarr=@[ImgDic[@"photo"],ImgDic[@"photo2"],ImgDic[@"photo3"]];
    float imgw=w/3-10;
    for (int i=0; i<imgarr.count; i++)
    {
        UIImageView *imgvi=[[UIImageView alloc]initWithFrame:CGRectMake(i*(w/3)+5,40,imgw,imgw*3/4)];
        
        [imgvi sd_setImageWithURL:imgarr[i]];

        [self addSubview:imgvi];
    }
    
    
}
-(void)AddLeftImg:(NSDictionary *)LeftImgDic
{
    float imgw=w/3-10;
    UIImageView *imgvi=[[UIImageView alloc]initWithFrame:CGRectMake(5,5,imgw,w/3)];
    [imgvi sd_setImageWithURL:LeftImgDic[@"photo"]];
    [self addSubview:imgvi];
  
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
