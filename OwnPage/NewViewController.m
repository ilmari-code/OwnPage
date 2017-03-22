//
//  NewViewController.m
//  ChamelonTest
//
//  Created by Mr_Jia on 2017/3/22.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

#import "NewViewController.h"
#import "YF_Cell.h"

@interface NewViewController ()<UITableViewDataSource,UITableViewDelegate,YF_CellDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NewViewController


- (void)viewDidLoad {
    [super viewDidLoad];


    [self.view addSubview:self.tableView];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    YF_Group * group = self.dataArray[section];
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YF_Cell *cell = [YF_Cell cellWithTableView:tableView];
    YF_Group *group = self.dataArray[indexPath.section];
    YF_Item *item = group.items[indexPath.row];
    cell.item = item;
    cell.delegate = self;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YF_Group *group = self.dataArray[indexPath.section];
    YF_Item *item = group.items[indexPath.row];
    if (item.option) {
        item.option();
        NSLog(@">>");
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    YF_Group *group = self.dataArray[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    YF_Group *group = self.dataArray[section];
    return group.footer;
}

#pragma mark - ICCommonItemCellDelegate

- (void)commonItemCell:(YF_Cell *)cell swith:(UISwitch *)swith
{
    
    BOOL value = YES;
    if (swith.on) {
        value = YES;
    }else{
        value = NO;
    }
    
    NSUserDefaults *userPreferences = [NSUserDefaults standardUserDefaults];
    [userPreferences setObject:[NSNumber numberWithBool:value] forKey:@"state"];
     [userPreferences synchronize];//同步
    
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"state"]);

     }

#pragma mark - Getter

- (UITableView *)tableView
{
    if (nil == _tableView) {
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        
        _tableView.delegate   = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(NSMutableArray *)dataArray
{
    if (nil == _dataArray) {
        _dataArray = [NSMutableArray array];
        
        YF_Item *headimgItem  = [YF_Item itemWithIcon:nil title:@"会话头像" destVcClass:nil parameter:nil withItemYype:YF_ArrowItem];
        headimgItem.option            = ^ {
            NSLog(@"会话头像");
        };
        YF_Item *nameItem     = [YF_Item itemWithIcon:nil title:@"会话名称" destVcClass:nil parameter:nil withItemYype:YF_ArrowItem];
        nameItem.option            = ^ {
            NSLog(@"会话名称");
        };
        YF_Group *attriGroup  = [[YF_Group alloc] init];
        attriGroup.items           = @[headimgItem,nameItem];
        
        YF_Item * discover    = [YF_Item itemWithIcon:nil title:@"置顶会话" destVcClass:nil parameter:nil withItemYype:YF_SwitchItem];
        YF_Item *companyDoc   = [YF_Item itemWithIcon:nil title:@"消息免打扰" destVcClass:nil parameter:nil withItemYype:YF_SwitchItem];
        YF_Group * mesGroup   = [[YF_Group alloc] init];
        mesGroup.header            = @"来个区头玩玩";
        mesGroup.items = @[discover,companyDoc];
        
        YF_Item *companyNews  = [YF_Item itemWithIcon:nil title:@"查找会话记录" destVcClass:nil parameter:nil withItemYype:YF_ArrowItem];
        companyNews.option            = ^ {
            NSLog(@"查找会话记录");
        };
        YF_Item *noneItem     = [YF_Item itemWithIcon:nil title:@"清空会话记录" destVcClass:nil parameter:nil withItemYype:YF_NoneItem];
        noneItem.option            = ^ {
            NSLog(@"清空会话记录");
        };
        YF_Group * comGroup   = [[YF_Group alloc] init];
        comGroup.footer            = @"来个区尾玩玩";
        comGroup.items             = @[companyNews,noneItem];
        
        [_dataArray addObject:attriGroup];
        [_dataArray addObject:mesGroup];
        [_dataArray addObject:comGroup];
        
    }
    return _dataArray;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
