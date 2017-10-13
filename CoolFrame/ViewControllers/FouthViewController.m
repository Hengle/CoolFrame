//
//  FouthViewController.m
//  CoolFrame
//
//  Created by silicon on 2017/7/25.
//  Copyright © 2017年 com.snailgames.coolframe. All rights reserved.
//

#import "FouthViewController.h"
#import "HeadCollectionViewFlowLayout.h"
#import "HeadCollectionViewCell.h"
#import "ProfileCollectionViewCell.h"
#import "GlobalDefine.h"

@interface FouthViewController ()

@end

@implementation FouthViewController
@synthesize mineTableView = _mineTableView;
@synthesize itemArray = _itemArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    UIButton *settingBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [settingBtn setTitle:@"设置" forState:UIControlStateNormal];
    [settingBtn setTintColor:[UIColor blackColor]];
    
    [self setNaviBarTitle:@"我的"];
    [self setNaviBarLeftBtn:nil];
    [self setNaviBarRightBtn:settingBtn];
    [self.customNavbar setM_background:nil];
    
    HeadCollectionViewCell *headView = [[HeadCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, _mineTableView.frame.size.width, 120.0f)];
    
    [_mineTableView addSubview:headView];
    
    [self.view addSubview:[self mineTableView]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * UITableView 懒加载
 */
- (UITableView *)mineTableView{
    if(_mineTableView){
        _mineTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 40.0f) style:UITableViewStylePlain];

        _mineTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _mineTableView.estimatedRowHeight = 0;
        _mineTableView.estimatedSectionHeaderHeight = 0;
        _mineTableView.estimatedSectionFooterHeight = 0;
        
        _mineTableView.backgroundColor = [UIColor clearColor];
        _mineTableView.scrollsToTop = YES;
        _mineTableView.tableFooterView = [[UIView alloc] init];
        
        _mineTableView.delegate = self;
        _mineTableView.dataSource = self;
    }
    
    return _mineTableView;
}

#pragma mark -tableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"defaultCell"];
    [cell setFrame:CGRectMake(0, 0, tableView.frame.size.width, 45)];
    [cell.textLabel setText:@"1111111"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark -tableViewDelegate

// Variable height support
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    return cell.frame.size.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if([self tableView:tableView viewForHeaderInSection:section]){
        return [self tableView:tableView viewForHeaderInSection:section].frame.size.height;
    }else{
        return 0.0;
    }
}

//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    HeadCollectionViewCell *headView = [[HeadCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 120.0f)];
//
//    headView.layer.borderWidth = 0;
//
//    return headView;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
