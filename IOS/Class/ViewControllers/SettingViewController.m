//
//  SettingViewController.m
//  IOS
//
//  Created by lihj on 14-5-4.
//  Copyright (c) 2014年 Lihj. All rights reserved.
//

#import "SettingViewController.h"
#import "UIViewController+XHLoadingNavigationItemTitle.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        MMDrawerBarButtonItem *leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
        [leftDrawerButton setTintColor:[UIColor whiteColor]];
        [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"设置";
    [self startAnimationTitle];
    
    DLog(@"%@", self.title);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
