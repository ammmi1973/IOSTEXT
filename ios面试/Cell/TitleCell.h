//
//  TitleCell.h
//  ios面试
//
//  Created by 高金才 on 2019/5/15.
//  Copyright © 2019 高金才. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TitleCell : UITableViewCell
@property(nonatomic ,strong)UILabel *titlelab;

-(void)AddTitleLab:(NSDictionary*)TitDic;
@end

NS_ASSUME_NONNULL_END
