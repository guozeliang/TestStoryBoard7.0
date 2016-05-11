//
//  ExternalStoryboardSegue.m
//  TestStoryBoard7.0
//
//  Created by SXTJ on 16/5/10.
//  Copyright © 2016年 SXTJ. All rights reserved.
//

#import "ExternalStoryboardSegue.h"

@implementation ExternalStoryboardSegue

- (instancetype)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    // Load the storyboard named by this segue's identifier.
    UIStoryboard *externalStoryboard = [UIStoryboard storyboardWithName:identifier bundle:[NSBundle bundleForClass:self.class]];
    
    // Instantiate the storyboard's initial view controller.
    id initialViewController = [externalStoryboard instantiateInitialViewController];
    
    return [super initWithIdentifier:identifier source:source destination:initialViewController];
}


//| ----------------------------------------------------------------------------
- (void)perform
{
    NSLog(@"%@",self.sourceViewController);
    [self.sourceViewController presentViewController:self.destinationViewController animated:YES completion:NULL];
    //    [self.sourceViewController ]
}

@end
