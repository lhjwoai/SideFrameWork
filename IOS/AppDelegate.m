//
//  AppDelegate.m
//  IOS
//
//  Created by lihj on 14-4-17.
//  Copyright (c) 2014年 Lihj. All rights reserved.
//

#import "AppDelegate.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"
#import "MMExampleDrawerVisualStateManager.h"
#import "InteractivePopNavigationController.h"
#import "LeftViewController.h"
#import "FirstViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    if (IOS7) {
        [application setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];

    [self setupViewControllers];
    [self.window setRootViewController:self.viewController];
    [self.window makeKeyAndVisible];
    
    [self customizeInterface];
    
    return YES;
}

#pragma mark - Methods
- (void)setupViewControllers {
    UIViewController *leftSideDrawerViewController = [[LeftViewController alloc] initWithNibName:@"LeftViewController" bundle:nil];
    UIViewController *centerViewController = [[FirstViewController alloc] init];
    UINavigationController *navigationController = [[InteractivePopNavigationController alloc] initWithRootViewController:centerViewController];
    [navigationController setRestorationIdentifier:@"MMExampleCenterNavigationControllerRestorationKey"];

    MMDrawerController *drawerController = [[MMDrawerController alloc]
                                             initWithCenterViewController:navigationController
                                             leftDrawerViewController:leftSideDrawerViewController
                                             rightDrawerViewController:nil];
    [drawerController setRestorationIdentifier:@"MMDrawer"];
    [drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    [[MMExampleDrawerVisualStateManager sharedManager] setLeftDrawerAnimationType:MMDrawerAnimationTypeParallax];
    [drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[MMExampleDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];

    
    self.viewController = drawerController;
}

- (void)customizeInterface {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    [navigationBarAppearance setBackgroundImage:[shareFun imageWithColor:RGBCOLOR(31, 29, 51)]
                                  forBarMetrics:UIBarMetricsDefault];

//    NSDictionary *textAttributes = nil;
//    
//    if ([[[UIDevice currentDevice] systemVersion] integerValue] >= 7.0) {
//        textAttributes = @{
//                           NSFontAttributeName: [UIFont boldSystemFontOfSize:20],
//                           NSForegroundColorAttributeName: [UIColor whiteColor],
//                           };
//    }
//    else {
//#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
//        textAttributes = @{
//                           UITextAttributeFont: [UIFont boldSystemFontOfSize:20],
//                           UITextAttributeTextColor: [UIColor whiteColor],
//                           UITextAttributeTextShadowColor: [UIColor clearColor],
//                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
//                           };
//#endif
//    }
//    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}

@end
