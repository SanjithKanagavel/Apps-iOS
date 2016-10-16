//
//  FirstViewController.m
//  GoEuro-Test
//
//  Created by Sanjith Kanagavel on 14/10/16.
//  Copyright © 2016 Sanjith Kanagavel. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIButton *trainBtn;
@property (strong, nonatomic) IBOutlet UIButton *busBtn;
@property (strong, nonatomic) IBOutlet UIButton *flightBtn;

@property (strong, nonatomic) IBOutlet UIView *toView;
@property (strong, nonatomic) IBOutlet UIView *fromView;
@property (strong, nonatomic) IBOutlet UIView *wholeView;
@property (strong, nonatomic) IBOutlet UIScrollView *mainview;

@end

@implementation FirstViewController

CGPoint fromOriginPt;
CGPoint toOriginPt;
CGPoint trainOriginPt;
CGPoint wholeViewOrigintPt;
CGRect mainViewRect;
UIButton *button;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    fromOriginPt = CGPointMake(self.fromView.frame.origin.x, self.fromView.frame.origin.y);
    toOriginPt = CGPointMake(self.toView.frame.origin.x, self.toView.frame.origin.y);
    trainOriginPt = CGPointMake(self.trainBtn.frame.origin.x, self.trainBtn.frame.size.height);
    wholeViewOrigintPt = CGPointMake(self.wholeView.frame.origin.x, self.wholeView.frame.origin.y);
    mainViewRect = CGRectMake(self.mainview.frame.origin.x, self.mainview.frame.origin.y,self.mainview.frame.size.width,self.mainview.frame.size.height);
    
    UIImage *img = [UIImage imageNamed:@"sampleimage.jpeg"];
    UIImageView *imageView =[[UIImageView alloc] initWithImage:img];
    [self.scrollView insertSubview:imageView atIndex:2];
    self.scrollView.contentSize = imageView.frame.size;
    self.scrollView.delegate = self;
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"filter.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(roundButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [button setContentMode:UIViewContentModeCenter];
    CGFloat windowWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat windowHeight = [[UIScreen mainScreen] bounds].size.height;
    NSLog(@"%f",windowWidth-30);
    NSLog(@"%f",windowHeight-30);
    
    button.frame = CGRectMake(windowWidth-50, windowHeight-60, 40, 40);
    button.clipsToBounds = YES;
    
    [self.view addSubview:button];
    
}
-(void)roundButtonDidTap:(UIButton*)tappedButton{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

double prev = 0.0;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView; {
    double val = scrollView.contentOffset.y;
    double adder = val-prev;
    bool animate = true;
    
    if(prev < 0)
    {
        prev=prev*1;
    }
    
    if( scrollView.contentOffset.y<30 )
    {
        animate = false;
    }
    
    if(prev<10)
    {
        adder = 1;
    }
    else {
        adder = 2;
    }
    
    if(!animate)
    {
        [UIView animateWithDuration:1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.wholeView.frame = CGRectMake(wholeViewOrigintPt.x,wholeViewOrigintPt.y,self.wholeView.frame.size.width,self.wholeView.frame.size.height);
            self.mainview.frame = mainViewRect;
                self.fromView.alpha = 1.0;
                self.toView.alpha = 1.0;
        } completion:nil];
    }
    else
    {
        if(trainOriginPt.y+50<=(self.mainview.frame.origin.y-adder)) {
        self.wholeView.frame = CGRectMake(self.wholeView.frame.origin.x,self.wholeView.frame.origin.y-adder,self.wholeView.frame.size.width,self.wholeView.frame.size.height);
            self.mainview.frame = CGRectMake(self.mainview.frame.origin.x,self.mainview.frame.origin.y-adder,self.mainview.frame.size.width,self.mainview.frame.size.height+adder);
                self.fromView.alpha -=0.05;
                self.toView.alpha -=0.04;
        }
    }
    prev = scrollView.contentOffset.y;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        button.alpha = 0.5;
        //button.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y, 0, 0);
    } completion:nil];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        button.alpha = 1;
        //button.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y, 40, 40);
    } completion:nil];
}


@end
