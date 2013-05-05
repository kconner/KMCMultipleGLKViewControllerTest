//
//  KMCContainerViewController.m
//  KMCMultipleGLKViewControllerTest
//
//  Created by Kevin Conner on 5/5/13.
//  Copyright (c) 2013 Kevin Conner. All rights reserved.
//

#import "KMCContainerViewController.h"
#import "KMCOpenGLViewController.h"

@interface KMCContainerViewController ()

@property (nonatomic, strong) KMCOpenGLViewController *leftViewController;
@property (nonatomic, strong) KMCOpenGLViewController *rightViewController;

@end

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

    self.leftViewController = [[KMCOpenGLViewController alloc] init];
    self.rightViewController = [[KMCOpenGLViewController alloc] init];

    [self addChildViewController:self.leftViewController]; // calls willMoveToSuperview:self
    [self.view addSubview:self.leftViewController.view];
    [self.leftViewController didMoveToParentViewController:self];

    [self addChildViewController:self.rightViewController]; // calls willMoveToSuperview:self
    [self.view addSubview:self.rightViewController.view];
    [self.rightViewController didMoveToParentViewController:self];

    [self.leftViewController.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLeft:)]];
    [self.rightViewController.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapRight:)]];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

    CGRect bounds = self.view.bounds;
    CGRect leftFrame, rightFrame;
    CGRectDivide(bounds, &leftFrame, &rightFrame, floorf(bounds.size.width / 2), CGRectMinXEdge);
    self.leftViewController.view.frame = leftFrame;
    self.rightViewController.view.frame = rightFrame;
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    for (UIViewController *child in @[ self.leftViewController, self.rightViewController]) {
        [child willMoveToParentViewController:nil];
        [child.view removeFromSuperview];
        [child removeFromParentViewController]; // calls didMoveToSuperview:nil
    }

    self.leftViewController = nil;
    self.rightViewController = nil;
}

@end
