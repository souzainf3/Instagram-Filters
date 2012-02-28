//
//  IFFiltersViewController.m
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import "IFFiltersViewController.h"

@interface IFFiltersViewController ()

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *cameraToolBarImageView;
@property (nonatomic, strong) UIImageView *cameraCaptureBarImageView;
@property (nonatomic, strong) UIButton *toggleFiltersButton;
@property (nonatomic, unsafe_unretained) BOOL isFiltersTableViewVisible;
- (void)backButtonPressed:(id)sender;
- (void)toggleFiltersButtonPressed:(id)sender;
@end

@implementation IFFiltersViewController

@synthesize backButton;
@synthesize backgroundImageView;
@synthesize cameraToolBarImageView;
@synthesize cameraCaptureBarImageView;
@synthesize toggleFiltersButton;
@synthesize isFiltersTableViewVisible;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.backgroundImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"glCameraBackground" ofType:@"png"]];
    
    self.cameraToolBarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    self.cameraToolBarImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"glCameraToolbar" ofType:@"png"]];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(285, 10, 20, 20);
    [self.backButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"glCameraIconCancel" ofType:@"png"]] forState:UIControlStateNormal];
    self.backButton.adjustsImageWhenHighlighted = NO;
    self.backButton.showsTouchWhenHighlighted = YES;
    [self.backButton addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    self.cameraCaptureBarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 426, 320, 54)];
    self.cameraCaptureBarImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"glCameraCaptureBar" ofType:@"png"]];
    
    self.toggleFiltersButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.toggleFiltersButton.frame = CGRectMake(270, 430, 40, 40);
    [self.toggleFiltersButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"glCameraHideFilters" ofType:@"png"]] forState:UIControlStateNormal];
    self.toggleFiltersButton.adjustsImageWhenHighlighted = NO;
    self.toggleFiltersButton.showsTouchWhenHighlighted = YES;
    [self.toggleFiltersButton addTarget:self action:@selector(toggleFiltersButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.isFiltersTableViewVisible = YES;
    
    [self.view addSubview:self.backgroundImageView];
    [self.view addSubview:self.cameraToolBarImageView];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.cameraCaptureBarImageView];
    [self.view addSubview:self.toggleFiltersButton];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Button methods

- (void)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^() {
        // do nothing
    }];
}

- (void)toggleFiltersButtonPressed:(id)sender {
    if (isFiltersTableViewVisible == YES) {
        [self.toggleFiltersButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"glCameraShowFilters" ofType:@"png"]] forState:UIControlStateNormal];
        self.isFiltersTableViewVisible = NO;
    } else {
        [self.toggleFiltersButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"glCameraHideFilters" ofType:@"png"]] forState:UIControlStateNormal];
        self.isFiltersTableViewVisible = YES;
    }
}


#pragma mark - View Will/Did Appear/Disappear
- (void)viewWillAppear:(BOOL)animated {
    //[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
}
- (void)viewWillDisappear:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
}


@end
