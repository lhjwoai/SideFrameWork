//
//  LeftViewController.m
//  IOS
//
//  Created by lihj on 14-5-4.
//  Copyright (c) 2014年 Lihj. All rights reserved.
//

#import "LeftViewController.h"
#import "SettingViewController.h"
#import "InteractivePopNavigationController.h"

@interface LeftViewController () {
    NSArray *_dataArr;
    NSArray *_imgArr;
}

@end

@implementation LeftViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _tableView.backgroundView = nil;
    _tableView.tableHeaderView = _headerView;
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"侧滑背景.png"]]];
    
    _imgArr = @[@"资讯动态.png", @"企业展示.png",@"活动.png",@"波士堂.png", @"消息.png", @"朋友圈.png", @"班级.png", @"俱乐部.png", @"通讯录.png"];
    
    _dataArr = @[@"资讯动态", @"企业展示", @"活动", @"波士堂", @"消息", @"朋友圈", @"班级", @"俱乐部", @"通讯录"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 46;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.backgroundColor = [UIColor clearColor];
        
        UIImageView *line = [[UIImageView alloc] init];
        line.frame = CGRectMake(0, 45, __MainScreen_Width, 1);
//        line.image = [UIImage imageNamed:@"菜单-分割线"];
        line.backgroundColor = [UIColor redColor];
        [cell addSubview:line];
    }
//    cell.accessoryView = nil;
    cell.imageView.image = [UIImage imageNamed:[_imgArr objectAtIndex:row]];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [_dataArr objectAtIndex:row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.highlightedTextColor = [UIColor blackColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)settingBtnClick:(id)sender {
    SettingViewController *VC = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
    
    UINavigationController *nav = [[InteractivePopNavigationController alloc] initWithRootViewController:VC];
    
    [self.mm_drawerController setCenterViewController:nav withFullCloseAnimation:YES completion:nil];
}
@end
