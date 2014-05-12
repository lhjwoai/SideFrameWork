//
//  LeftViewController.h
//  IOS
//
//  Created by lihj on 14-5-4.
//  Copyright (c) 2014年 Lihj. All rights reserved.
//

#import "BaseViewController.h"

@interface LeftViewController : BaseViewController {
    
    IBOutlet UITableView *_tableView;
    IBOutlet UIView *_headerView;
}

- (IBAction)settingBtnClick:(id)sender;

@end
