//
//  LeftImgCell.m
//  ios面试
//
//  Created by 高金才 on 2019/5/15.
//  Copyright © 2019 高金才. All rights reserved.
//

#import "LeftImgCell.h"

@implementation LeftImgCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
       float imgw=w/3-10;
        self. img=[[UIImageView alloc]initWithFrame:CGRectMake(5,10,imgw,imgw*3/4)];
        [self addSubview:self. img];
        self.titlelab =[[UILabel alloc]initWithFrame:CGRectMake(w/3, 10, w*2/3,self.bounds.size.height)];
        self.titlelab .textColor =[UIColor blackColor];
        self.titlelab .font =[UIFont systemFontOfSize:15];
        self.titlelab .textAlignment=0;
        self.titlelab .numberOfLines=0;
        self.titlelab .layer.masksToBounds =YES;
        [self addSubview:self.titlelab];
        
    }
    return self;
}
-(void)AddLeftImg:(NSDictionary *)LeftImgDic
{
    [self. img sd_setImageWithURL:LeftImgDic[@"photo"]];
    self.titlelab .text=LeftImgDic[@"title"];
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
