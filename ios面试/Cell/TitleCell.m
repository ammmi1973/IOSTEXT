//
//  TitleCell.m
//  ios面试
//
//  Created by 高金才 on 2019/5/15.
//  Copyright © 2019 高金才. All rights reserved.
//

#import "TitleCell.h"

@implementation TitleCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.titlelab =[[UILabel alloc]initWithFrame:CGRectMake(5,0 , w-10,self.bounds.size.height)];
        self.titlelab .textColor =[UIColor blackColor];
        self.titlelab .font =[UIFont systemFontOfSize:15];
        self.titlelab .textAlignment=0;
        self.titlelab .numberOfLines=0;
        self.titlelab .layer.masksToBounds =YES;
        [self addSubview:self.titlelab];
    }
    return self;
}
-(void)AddTitleLab:(NSDictionary *)TitDic
{
   self.titlelab .text=TitDic[@"title"];
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
