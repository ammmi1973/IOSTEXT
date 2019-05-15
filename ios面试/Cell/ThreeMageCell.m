//
//  MageCell.m
//  ios面试
//
//  Created by 高金才 on 2019/5/14.
//  Copyright © 2019 高金才. All rights reserved.
//
#import "ThreeMageCell.h"
#import "TxtHight.h"
@implementation ThreeMageCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self .imgarr =[NSMutableArray array];
        self.titlelab =[[UILabel alloc]initWithFrame:CGRectMake(5, 5, w-10,50)];
        self.titlelab .textColor =[UIColor blackColor];
        self.titlelab .font =[UIFont systemFontOfSize:15];
        self.titlelab .textAlignment=0;
        self.titlelab .layer.masksToBounds =YES;
        [self addSubview:self.titlelab];

        float imgw=w/3-10;
        for (int i=0; i<3; i++)
        {
            UIImageView *imgvi=[[UIImageView alloc]initWithFrame:CGRectMake(i*(w/3)+5,60,imgw,imgw*3/4)];
            [self .imgarr addObject:imgvi];
            
            [self addSubview:imgvi];
        }
    }
    return self;
}
-(void)AddTheeImg:(NSDictionary *)ImgDic
{
    NSArray *imgarr=@[ImgDic[@"photo"],ImgDic[@"photo2"],ImgDic[@"photo3"]];
    
    for (int i=0; i<imgarr .count; i++) {
        [self .imgarr[i] sd_setImageWithURL:imgarr[i]];
    }
    self .titlelab .text =ImgDic[@"title"];
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
