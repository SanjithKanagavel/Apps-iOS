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
- (void)viewDidLoad {
    [super viewDidLoad];
    
    fromOriginPt = CGPointMake(self.fromView.frame.origin.x, self.fromView.frame.origin.y);
    
    toOriginPt = CGPointMake(self.toView.frame.origin.x, self.toView.frame.origin.y);
    
    trainOriginPt = CGPointMake(self.trainBtn.frame.origin.x, self.trainBtn.frame.size.height);
    wholeViewOrigintPt = CGPointMake(self.wholeView.frame.origin.x, self.wholeView.frame.origin.y);
    UIImage *img = [UIImage imageNamed:@"sampleimage.jpeg"];
    UIImageView *imageView =[[UIImageView alloc] initWithImage:img];
    [self.scrollView addSubview:imageView];
    self.scrollView.contentSize = imageView.frame.size;
    self.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

double prev = 0.0;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView; {
    //if(scrollView.contentOffset.y < 0) return;
    double val = scrollView.contentOffset.y;
    double adder = val-prev;
    
    if(prev < 0)
    {
        prev=prev*1;
    }
    
    if(prev<10)
    {
        adder = 1;
    }
    else{
        adder = 2;
    }
    
    if(scrollView.contentOffset.y <= 0)
    {
        if((wholeViewOrigintPt.y)>self.wholeView.frame.origin.y+adder) {
            self.wholeView.frame = CGRectMake(self.wholeView.frame.origin.x,self.wholeView.frame.origin.y+adder,self.wholeView.frame.size.width,self.wholeView.frame.size.height);
            self.mainview.frame = CGRectMake(self.mainview.frame.origin.x,self.mainview.frame.origin.y+adder,self.mainview.frame.size.width,self.mainview.frame.size.height-adder);

            if(adder == 2)
            {
                self.fromView.alpha +=0.1;
                self.toView.alpha +=0.08;
            }
            else{
                self.fromView.alpha +=0.05;
                self.toView.alpha +=0.04;
            }
            
        }
        
        //scroll down
    }
    else
    {
        NSLog(@"%f",self.mainview.frame.origin.y-adder);
        NSLog(@"%f",trainOriginPt.y+50);
        if(trainOriginPt.y+50<=(self.mainview.frame.origin.y-adder)) {
        self.wholeView.frame = CGRectMake(self.wholeView.frame.origin.x,self.wholeView.frame.origin.y-adder,self.wholeView.frame.size.width,self.wholeView.frame.size.height);
            self.mainview.frame = CGRectMake(self.mainview.frame.origin.x,self.mainview.frame.origin.y-adder,self.mainview.frame.size.width,self.mainview.frame.size.height+adder);
            
            if(adder == 2)
            {
                self.fromView.alpha -=0.1;
                self.toView.alpha -=0.08;
            }
            else{
                self.fromView.alpha -=0.05;
                self.toView.alpha -=0.04;
            }
        }
        else
        {
            
            //done scrolling
        }
        //scroll up
    }
    prev = scrollView.contentOffset.y;
    
    
    NSLog(@"X : %f Y: %f", scrollView.contentOffset.x,scrollView.contentOffset.y);
}



@end
