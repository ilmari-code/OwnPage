//
//  YF_Cell.h
//
//  ChamelonTest
//
//  Created by Mr_Jia on 2017/3/22.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

#import <UIKit/UIKit.h>



#import "YF_Item.h"
#import "YF_Group.h"

@class YF_Cell;
@protocol YF_CellDelegate <NSObject>

- (void)commonItemCell:(YF_Cell *)cell
                 swith:(UISwitch *)swith;

@end

@interface YF_Cell : UITableViewCell

@property (nonatomic ,strong) YF_Item *item;

@property (nonatomic, weak) id<YF_CellDelegate>delegate;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
