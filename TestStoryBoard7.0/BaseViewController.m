//
//  BaseViewController.m
//  TestStoryBoard7.0
//
//  Created by SXTJ on 16/5/10.
//  Copyright © 2016年 SXTJ. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property(nonatomic,strong) UIViewController *storyboardViewController;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView{
    [super loadView];
    
    if (self.storyboardViewController == nil) {
        self.storyboardViewController = [self instantiateViewControllerFromStoryboard];
    }
    if (self.storyboardViewController != nil && self.navigationController != nil) {
        
        NSInteger index = [self.navigationController.viewControllers indexOfObject:self];
        if (index!=NSNotFound) {
            NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
            [viewControllers replaceObjectAtIndex:index withObject:self.storyboardViewController];
            [self.navigationController setViewControllers:viewControllers animated:NO];
        }
    }
}

- (UIViewController*)instantiateViewControllerFromStoryboard{
    NSString *identifier = self.restorationIdentifier;
    UIStoryboard *storyboard = nil;
    if (identifier) {
        storyboard = [UIStoryboard storyboardWithName:identifier bundle:nil];
    }
    
    UIViewController * retVC = [storyboard instantiateInitialViewController];
    return retVC;
}


@end
