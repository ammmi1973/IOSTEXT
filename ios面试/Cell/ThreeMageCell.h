//
//  MageCell.h
//  ios面试
//
//  Created by 高金才 on 2019/5/14.
//  Copyright © 2019 高金才. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface ThreeMageCell : UITableViewCell
@property(nonatomic ,strong)UILabel *titlelab;
@property(nonatomic ,strong)NSMutableArray*imgarr;
-(void)AddTheeImg:(NSDictionary*)ThreeDic;


@end
NS_ASSUME_NONNULL_END
