//
//  ViewController.m
//  ChamelonTest
//
//  Created by Mr_Jia on 2017/3/22.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

#import "ViewController.h"

#import "YF_Cell.h"
#import "NewViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end


@implementation ViewController


 
 -(NSMutableArray *)dataArray
 {
 if (nil == _dataArray) {
     _dataArray = [NSMutableArray array];
 
     YF_Item *friendItem   = [YF_Item itemWithIcon:@"ff_IconShowAlbum" title:@"朋友圈" destVcClass:[NewViewController class] parameter:@"朋友圈" withItemYype:YF_ArrowItem];
     YF_Group *friendGroup = [[YF_Group alloc] init];
     friendGroup.items     = @[friendItem];
 
     YF_Item *sweepItem    = [YF_Item itemWithIcon:@"ff_IconQRCode" title:@"扫一扫" destVcClass:[NewViewController class] parameter:@"扫一扫" withItemYype:YF_ArrowItem];
     YF_Item *waveItem     = [YF_Item itemWithIcon:@"ff_IconShake" title:@"摇一摇" destVcClass:[NewViewController class] parameter:@"摇一摇" withItemYype:YF_ArrowItem];
     YF_Group *sewaGroup   = [[YF_Group alloc] init];
     sewaGroup.items       = @[sweepItem,waveItem];
 
     YF_Item *nearItem     = [YF_Item itemWithIcon:@"ff_IconLocationService" title:@"附近的人" destVcClass:[NewViewController class] parameter:@"附近的人"withItemYype:YF_ArrowItem];
     YF_Item *driftItem    = [YF_Item itemWithIcon:@"ff_IconBottle" title:@"漂流瓶" destVcClass:[NewViewController class] parameter:@"漂流瓶"withItemYype:YF_ArrowItem];
     YF_Group *nedrGroup   = [[YF_Group alloc] init];
     nedrGroup.items       = @[nearItem,driftItem];
 
     YF_Item *shopItem     = [YF_Item itemWithIcon:@"ff_IconQRCode" title:@"购物" destVcClass:[NewViewController class] parameter:@"购物"withItemYype:YF_ArrowItem];
     YF_Item *gameItem     = [YF_Item itemWithIcon:@"MoreGame" title:@"游戏" destVcClass:[NewViewController class] parameter:@"游戏"withItemYype:YF_ArrowItem];
     YF_Group *shgaGroup   = [[YF_Group alloc] init];
     shgaGroup.items       = @[shopItem,gameItem];
 
     [_dataArray addObject:friendGroup];
     [_dataArray addObject:sewaGroup];
     [_dataArray addObject:nedrGroup];
     [_dataArray addObject:shgaGroup];
    }
     return _dataArray;
 }
 
 
#pragma mark lazy loading...
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma tableView--delegate
#pragma tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    YF_Group *group = self.dataArray[section];
    
    return  group.items.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    YF_Cell *cell = [YF_Cell cellWithTableView:tableView];
    
    YF_Group *group = self.dataArray[indexPath.section];
    YF_Item *item = group.items[indexPath.row];
    
    cell.item = item;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    YF_Group *group = self.dataArray[indexPath.section];
    YF_Item *item = group.items[indexPath.row];
    
        NewViewController *testVC = [[NewViewController alloc] init];
        
        testVC.title = (NSString *)item.parameter;
        testVC.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:testVC animated:YES];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title =@"返回";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    [self.view addSubview:self.tableView];
    
}
- (void)click{
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 8.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8.0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
