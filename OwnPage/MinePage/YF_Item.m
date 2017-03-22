//
//  YF_Item.m
//
//  ChamelonTest
//
//  Created by Mr_Jia on 2017/3/22.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

#import "YF_Item.h"

@implementation YF_Item


+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass parameter:(id)parameter withItemYype:(itemType )itemT
{
    YF_Item *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    item.destVcClass = destVcClass;
    item.parameter = parameter;
    item.itemType = itemT;
    return item;
}

@end
