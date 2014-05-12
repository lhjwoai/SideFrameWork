//
//  baseViewController.m
//  tempPrj
//
//  Created by lihj on 13-4-9.
//  Copyright (c) 2013年 lihj. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        if (IOS7) {
            self.automaticallyAdjustsScrollViewInsets = NO;
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[SDImageCache sharedImageCache] clearMemory];
}

//- (void)setTitle:(NSString *)t_title {
//    [super setTitle:t_title];
//    UILabel *titleView = (UILabel *)self.navigationItem.titleView;
//    if (!titleView) {
//        titleView = [[UILabel alloc] initWithFrame:CGRectZero];
//        titleView.backgroundColor = [UIColor clearColor];
//        titleView.font = [UIFont boldSystemFontOfSize:20.0];
//        titleView.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
//        titleView.textColor = [UIColor redColor];
//        self.navigationItem.titleView = titleView;
//    }
//    titleView.text = t_title;
//    [titleView sizeToFit];
//}

- (void)setLBtnHidden:(BOOL)hidden {
    self.navigationItem.hidesBackButton = YES;
}

- (void)setLbtnNormal {
    UIImage *image = [UIImage imageNamed:@"nav_back.png"];

    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, kNavBarHeight/2-image.size.height/2, image.size.width, image.size.height)];
	[leftButton setImage:image forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    if (IOS7) {
        self.navigationItem.leftBarButtonItem = leftButtonItem;
    }
    else {
        UIBarButtonItem *fixedSpaceButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        fixedSpaceButtonItem.width = 10;
        [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:fixedSpaceButtonItem, leftButtonItem, nil] animated:NO];
    }
}

- (void)setLBtn:(NSString *)t_str image:(NSString *)t_img imageSel:(NSString *)t_imgSel target:(id)target action:(SEL)action {
    UIImage *image = [UIImage imageNamed:t_img];
	UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, kNavBarHeight/2-image.size.height/2, image.size.width, image.size.height)];
	[leftButton setTitle:t_str forState:UIControlStateNormal];
	[leftButton setImage:[UIImage imageNamed:t_img] forState:UIControlStateNormal];
	[leftButton setImage:[UIImage imageNamed:t_imgSel] forState:UIControlStateHighlighted];
	[leftButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
	[leftButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    if (IOS7) {
        self.navigationItem.leftBarButtonItem = leftButtonItem;
    }
    else {
        UIBarButtonItem *fixedSpaceButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        fixedSpaceButtonItem.width = 10;
        [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:fixedSpaceButtonItem, leftButtonItem, nil] animated:NO];
    }
}

- (void)setRBtn:(NSString *)t_str image:(NSString *)t_img imageSel:(NSString *)t_imgSel target:(id)target action:(SEL)action {
    UIImage *image = [UIImage imageNamed:t_img];
	UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, kNavBarHeight/2-image.size.height/2, image.size.width, image.size.height)];
	[rightButton setTitle:t_str forState:UIControlStateNormal];
	[rightButton setImage:image forState:UIControlStateNormal];
	[rightButton setImage:[UIImage imageNamed:t_imgSel] forState:UIControlStateHighlighted];
	[rightButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
	[rightButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    if (IOS7) {
        self.navigationItem.rightBarButtonItem = rightButtonItem;
    }
    else {
        UIBarButtonItem *fixedSpaceButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        fixedSpaceButtonItem.width = 10;
        [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:fixedSpaceButtonItem, rightButtonItem, nil] animated:NO];
    }
}

- (void)backAction {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}


@end
