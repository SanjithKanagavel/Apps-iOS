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

UIButton *button1;
UIButton *button2;
UIButton *button3;


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
    [button setBackgroundImage:[UIImage imageNamed:@"filter.png"] forState:UIControlStateNormal];
    [button addTarget:self
                 action:@selector(roundButtonDidTap)
       forControlEvents:UIControlEventTouchUpInside];
    [button setContentMode:UIViewContentModeCenter];
    CGFloat windowWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat windowHeight = [[UIScreen mainScreen] bounds].size.height;
    
    button.frame = CGRectMake(windowWidth-50, windowHeight-60, 40, 40);
    button.clipsToBounds = YES;
    
    [self.view addSubview:button];
    
    button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setImage:[UIImage imageNamed:@"airline.png"] forState:UIControlStateNormal];
    [button1 setContentMode:UIViewContentModeCenter];
    
    button1.frame = CGRectMake(windowWidth-50+20, windowHeight-60+20, 0, 0);
    button1.clipsToBounds = YES;
    
    button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setImage:[UIImage imageNamed:@"price.png"] forState:UIControlStateNormal];
    [button2 setContentMode:UIViewContentModeCenter];
    
    button2.frame = CGRectMake(windowWidth-50+20, windowHeight-60+20, 0, 0);
    button2.clipsToBounds = YES;
    
    button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setImage:[UIImage imageNamed:@"timer.png"] forState:UIControlStateNormal];
    [button3 setContentMode:UIViewContentModeCenter];
    
    button3.frame = CGRectMake(windowWidth-50+20, windowHeight-60+20, 0, 0);
    button3.clipsToBounds = YES;
    
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    button1.alpha=0;
    button2.alpha=0;
    button3.alpha=0;
    
    button.adjustsImageWhenHighlighted = NO;
    button1.adjustsImageWhenHighlighted = NO;
    button2.adjustsImageWhenHighlighted = NO;
    button3.adjustsImageWhenHighlighted = NO;
}
bool collapsed = true;

-(void)roundButtonDidTap{
    
    if(collapsed) {
        
        [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            button.alpha=1;
            button1.alpha = 1;
            button2.alpha = 1;
            button3.alpha = 1;
            button1.frame = CGRectMake(button1.frame.origin.x - 90 , button1.frame.origin.y - 20, 40 , 40);
            
            button2.frame = CGRectMake(button2.frame.origin.x - 65, button2.frame.origin.y - 65, 40 , 40);

            button3.frame = CGRectMake(button3.frame.origin.x - 20, button3.frame.origin.y  - 90, 40 , 40);
            
            [button setTransform:CGAffineTransformRotate(button.transform, M_PI/2)];
            //[button setBackgroundImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
            
        } completion:nil];
    }
    else {
        [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            button1.frame = CGRectMake(button1.frame.origin.x + 90, button1.frame.origin.y +20, 0 , 0);
            
            button2.frame = CGRectMake(button2.frame.origin.x + 65, button2.frame.origin.y + 65, 0 , 0);
            
            button3.frame = CGRectMake(button3.frame.origin.x + 20, button3.frame.origin.y + 90, 0 , 0);
            button1.alpha=0;
            button2.alpha=0;
            button3.alpha=0;
            
            [button setTransform:CGAffineTransformRotate(button.transform, -M_PI/2)];
            [button setBackgroundImage:[UIImage imageNamed:@"filter.png"] forState:UIControlStateNormal];
            
        } completion:nil];

    }
    collapsed = !collapsed;
    
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
    if(!collapsed) {
        [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            button1.frame = CGRectMake(button1.frame.origin.x + 90, button1.frame.origin.y +20, 0 , 0);
            
            button2.frame = CGRectMake(button2.frame.origin.x + 65, button2.frame.origin.y + 65, 0 , 0);
            
            button3.frame = CGRectMake(button3.frame.origin.x + 20, button3.frame.origin.y + 90, 0 , 0);
            button1.alpha=0;
            button2.alpha=0;
            button3.alpha=0;
            
            [button setTransform:CGAffineTransformRotate(button.transform, -M_PI/2)];
            [button setBackgroundImage:[UIImage imageNamed:@"filter.png"] forState:UIControlStateNormal];
            
        } completion:nil];
        collapsed = true;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        button.alpha = 1;
        //button.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y, 40, 40);
    } completion:nil];
    
}


@end
