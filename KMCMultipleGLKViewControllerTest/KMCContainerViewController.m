//
//  KMCContainerViewController.m
//  KMCMultipleGLKViewControllerTest
//
//  Created by Kevin Conner on 5/5/13.
//  Copyright (c) 2013 Kevin Conner. All rights reserved.
//

#import "KMCContainerViewController.h"
#import "KMCOpenGLViewController.h"

@implementation KMCContainerViewController

#pragma mark - Actions

- (void)didTapLeft:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"Tapped left.");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didTapRight:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"Tapped right.");
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect bounds = self.view.bounds;
    CGRect leftFrame, rightFrame;
    CGRectDivide(bounds, &leftFrame, &rightFrame, floorf(bounds.size.width / 2), CGRectMinXEdge);

    KMCOpenGLViewController *leftViewController = [[KMCOpenGLViewController alloc] init];
    leftViewController.view.frame = leftFrame;
    KMCOpenGLViewController *rightViewController = [[KMCOpenGLViewController alloc] init];
    rightViewController.view.frame = rightFrame;

    [self addChildViewController:leftViewController]; // calls willMoveToSuperview:self
    [self.view addSubview:leftViewController.view];
    [rightViewController didMoveToParentViewController:self];

    [self addChildViewController:rightViewController]; // calls willMoveToSuperview:self
    [self.view addSubview:rightViewController.view];
    [rightViewController didMoveToParentViewController:self];

    [leftViewController.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLeft:)]];
    [rightViewController.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapRight:)]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    NSArray *children = self.childViewControllers.copy;
    for (UIViewController *child in children) {
        [child willMoveToParentViewController:nil];
        [child.view removeFromSuperview];
        [child removeFromParentViewController]; // calls didMoveToSuperview:nil
    }
}

@end
