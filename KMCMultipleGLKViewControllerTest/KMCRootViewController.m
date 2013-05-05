//
//  KMCRootViewController.m
//  KMCMultipleGLKViewControllerTest
//
//  Created by Kevin Conner on 5/5/13.
//  Copyright (c) 2013 Kevin Conner. All rights reserved.
//

#import "KMCRootViewController.h"
#import "KMCContainerViewController.h"

@implementation KMCRootViewController

#pragma mark - Actions

- (void)didTap:(UIGestureRecognizer *)gestureRecognizer
{
    KMCContainerViewController *modalViewController = [[KMCContainerViewController alloc] init];
    [self presentViewController:modalViewController animated:YES completion:nil];
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)]];
}

@end
