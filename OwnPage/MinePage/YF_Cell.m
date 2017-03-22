//
//  YF_Cell.m
//
//  ChamelonTest
//
//  Created by Mr_Jia on 2017/3/22.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

#import "YF_Cell.h"
#import "YF_Item.h"

@interface YF_Cell ()

@property (nonatomic, strong) UIImageView *accessoryImageV;
@property (nonatomic, strong) UISwitch *switchV;

@end

@implementation YF_Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle  = UITableViewCellSelectionStyleNone;
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID     = @"ICStaticPageCell";
    
    YF_Cell *cell  = [tableView dequeueReusableCellWithIdentifier:ID];
    if (nil == cell) {
        cell = [[YF_Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)setItem:(YF_Item *)item
{
    _item = item;
    
    [self setupData];
    
    [self setUpAccessoryView];
}

- (void)setupData
{
    if (_item.icon) {
        self.imageView.image = [UIImage imageNamed:_item.icon];
    }
    self.textLabel.text     = _item.title;
}

- (void)setUpAccessoryView
{

    if (_item.itemType == YF_ArrowItem) { // Arrow
        self.accessoryView = self.accessoryImageV;
    }else if (_item.itemType == YF_SwitchItem){ // Switch
        self.accessoryView = self.switchV;
        self.switchV.on = [[[NSUserDefaults standardUserDefaults] objectForKey:@"state"] boolValue];
    }else{
        self.accessoryView = nil;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

#pragma mark - Event

- (void)switchChanged:(UISwitch *)swic
{
    if ([self.delegate respondsToSelector:@selector(commonItemCell:swith:)]) {
        [self.delegate commonItemCell:self swith:swic];
    }
}

#pragma mark - Getter

- (UISwitch *)switchV
{
    if (nil == _switchV) {
        
        _switchV = [[UISwitch alloc] init];
        [_switchV addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchV;
}

- (UIImageView *)accessoryImageV
{
    if (nil == _accessoryImageV) {
        _accessoryImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"App_rightArrow"]];
    }
    return _accessoryImageV;
}


@end
