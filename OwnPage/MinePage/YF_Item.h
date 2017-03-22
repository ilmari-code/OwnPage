//
//  YF_Item.h
//
//  ChamelonTest
//
//  Created by Mr_Jia on 2017/3/22.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^GXItemOption)();

typedef NS_ENUM(int,itemType){

    YF_ArrowItem = 0,
    YF_SwitchItem = 1,
    YF_NoneItem = 2
};
@interface YF_Item : NSObject

@property (nonatomic ,strong) NSString *icon;
@property (nonatomic ,strong) NSString *title;
@property (nonatomic, strong) NSString *detail;
// 具体的操作
@property (nonatomic ,copy) GXItemOption option;

// 目的控制器
@property (nonatomic ,assign) Class destVcClass;

// 传递的参数
@property (nonatomic, strong) id parameter;

@property (nonatomic,assign) itemType itemType;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass parameter:(id)parameter withItemYype:(itemType )itemT;

@end
