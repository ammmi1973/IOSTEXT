//
//  TxtHight.m
//  ios面试
//
//  Created by 高金才 on 2019/5/15.
//  Copyright © 2019 高金才. All rights reserved.
//

#import "TxtHight.h"

@implementation TxtHight
+(float)getTxTheight:(NSString *)Str withWidth:(float)width
{
    CGSize size = CGSizeMake(width, 2000);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:20];
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:15], NSParagraphStyleAttributeName:style};
    CGFloat height = [Str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size.height;
    return height;
}
@end
