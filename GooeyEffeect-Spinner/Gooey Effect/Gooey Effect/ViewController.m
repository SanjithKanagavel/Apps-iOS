//
//  ViewController.m
//  Gooey Effect
//
//  Created by Sanjith Kanagavel on 18/10/16.
//  Copyright © 2016 Sanjith Kanagavel. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

float sizeVal;
UIView *circle1,*circle2,*circle3,*circle4,*circle5,*circle6,*circle7,*circle8;
UIView *smallCircle;
UIBezierPath *circlePath1,*circlePath2;

double SCREEN_CENTER_X;
double SCREEN_CENTER_Y;

- (void)viewDidLoad {
    [super viewDidLoad];
    SCREEN_CENTER_X=[[UIScreen mainScreen]bounds].size.width/2;
    SCREEN_CENTER_Y=[[UIScreen mainScreen]bounds].size.height/2;
    [self.view setBackgroundColor:[self convertHexColor:@"#001C31"]];
    
    circle1 = [[UIView alloc]initWithFrame:CGRectMake(0,0,20,20)];
    circle1.layer.cornerRadius=10;
    [circle1 setCenter:CGPointMake(SCREEN_CENTER_X,SCREEN_CENTER_Y-60)];
    [circle1 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
    
    circle2 = [[UIView alloc]initWithFrame:CGRectMake(0,0,20,20)];
    circle2.layer.cornerRadius=10;
    [circle2 setCenter:CGPointMake(SCREEN_CENTER_X+40,SCREEN_CENTER_Y-40)];
    [circle2 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
    
    circle3 = [[UIView alloc]initWithFrame:CGRectMake(0,0,20,20)];
    circle3.layer.cornerRadius=10;
    [circle3 setCenter:CGPointMake(SCREEN_CENTER_X+60,SCREEN_CENTER_Y)];
    [circle3 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
    
    circle4 = [[UIView alloc]initWithFrame:CGRectMake(0,0,20,20)];
    circle4.layer.cornerRadius=10;
    [circle4 setCenter:CGPointMake(SCREEN_CENTER_X+40,SCREEN_CENTER_Y+40)];
    [circle4 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
    
    circle5 = [[UIView alloc]initWithFrame:CGRectMake(0,0,20,20)];
    circle5.layer.cornerRadius=10;
    [circle5 setCenter:CGPointMake(SCREEN_CENTER_X,SCREEN_CENTER_Y+60)];
    [circle5 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
    
    circle6 = [[UIView alloc]initWithFrame:CGRectMake(0,0,20,20)];
    circle6.layer.cornerRadius=10;
    [circle6 setCenter:CGPointMake(SCREEN_CENTER_X-40,SCREEN_CENTER_Y+40)];
    [circle6 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
    
    circle7 = [[UIView alloc]initWithFrame:CGRectMake(0,0,20,20)];
    circle7.layer.cornerRadius=10;
    [circle7 setCenter:CGPointMake(SCREEN_CENTER_X-60,SCREEN_CENTER_Y)];
    [circle7 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
    
    circle8 = [[UIView alloc]initWithFrame:CGRectMake(0,0,20,20)];
    circle8.layer.cornerRadius=10;
    [circle8 setCenter:CGPointMake(SCREEN_CENTER_X-40,SCREEN_CENTER_Y-40)];
    [circle8 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
    
    smallCircle = [[UIView alloc]initWithFrame:CGRectMake(0,0,15,15)];
    smallCircle.layer.cornerRadius=7;
    [smallCircle setCenter:CGPointMake(SCREEN_CENTER_X-40,SCREEN_CENTER_Y-40)];
    [smallCircle setBackgroundColor:[self convertHexColor:@"#54F7FC"]];
    
    circlePath1 = [UIBezierPath bezierPath];
    [circlePath1 addArcWithCenter:CGPointMake(SCREEN_CENTER_X,SCREEN_CENTER_Y) radius:57 startAngle:0 endAngle:2*M_PI  clockwise:YES];
    
    circlePath2 = [UIBezierPath bezierPath];
    [circlePath2 addArcWithCenter:CGPointMake(SCREEN_CENTER_X,SCREEN_CENTER_Y) radius:25 startAngle:M_PI_4 endAngle:M_PI_4  clockwise:YES];
    
    smallCircle.alpha = 1;
    smallCircle.layer.shadowColor = [self convertHexColor:@"#54F7FC"].CGColor;
    smallCircle.layer.shadowOffset = CGSizeZero;
    smallCircle.layer.shadowRadius = 10;
    smallCircle.layer.shadowOpacity = 1.0;
    
    
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.path = circlePath1.CGPath;
    positionAnimation.fillMode = kCAFillModeForwards;
    positionAnimation.removedOnCompletion = NO;
    positionAnimation.calculationMode = kCAAnimationPaced;
    positionAnimation.repeatCount = INFINITY;
    positionAnimation.duration = 4;
    [smallCircle.layer addAnimation:positionAnimation forKey:@"position"];
    
    /*CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"position"];
    animation2.duration = 0.5f;
    animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation2.fromValue = [NSValue valueWithCGPoint:CGPointMake((smallCircle.frame.size.width), (smallCircle.frame.size.height))];
    animation2.toValue = [NSValue valueWithCGPoint:CGPointMake((smallCircle.frame.size.width+3), (smallCircle.frame.size.height+20))];
    [smallCircle.layer.mask addAnimation:animation2 forKey:@"animateMask2"];*/
    
    [self.view addSubview:circle8];
    [self.view addSubview:circle7];
    [self.view addSubview:circle6];
    [self.view addSubview:circle5];
    [self.view addSubview:circle4];
    [self.view addSubview:circle3];
    [self.view addSubview:circle2];
    [self.view addSubview:circle1];
    [self.view addSubview:smallCircle];
    
    
    [UIView animateKeyframesWithDuration:4 delay:0 options:0 animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0 animations:^{
            /*circle3.layer.shadowColor = [self convertHexColor:@"#54F7FC"].CGColor;
            circle3.layer.shadowOffset = CGSizeZero;
            circle3.layer.shadowRadius = 10;
            circle3.layer.shadowOpacity = 1.0;*/
            [circle3 setBackgroundColor:[self convertHexColor:@"#54F7FC"]];
            
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0 animations:^{
            /*circle4.layer.shadowColor = [self convertHexColor:@"#54F7FC"].CGColor;
            circle4.layer.shadowOffset = CGSizeZero;
            circle4.layer.shadowRadius = 10;
            circle4.layer.shadowOpacity = 1.0;*/
            [circle4 setBackgroundColor:[self convertHexColor:@"#54F7FC"]];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0 animations:^{
            /*circle5.layer.shadowColor = [self convertHexColor:@"#54F7FC"].CGColor;
            circle5.layer.shadowOffset = CGSizeZero;
            circle5.layer.shadowRadius = 10;
            circle5.layer.shadowOpacity = 1.0;*/
            [circle5 setBackgroundColor:[self convertHexColor:@"#54F7FC"]];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0 animations:^{
            /*circle6.layer.shadowColor = [self convertHexColor:@"#54F7FC"].CGColor;
            circle6.layer.shadowOffset = CGSizeZero;
            circle6.layer.shadowRadius = 10;
            circle6.layer.shadowOpacity = 1.0;*/
            [circle6 setBackgroundColor:[self convertHexColor:@"#54F7FC"]];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0 animations:^{
            /*circle7.layer.shadowColor = [self convertHexColor:@"#54F7FC"].CGColor;
            circle7.layer.shadowOffset = CGSizeZero;
            circle7.layer.shadowRadius = 10;
            circle7.layer.shadowOpacity = 1.0;*/
            [circle7 setBackgroundColor:[self convertHexColor:@"#54F7FC"]];
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0 animations:^{
            /*circle8.layer.shadowColor = [self convertHexColor:@"#54F7FC"].CGColor;
            circle8.layer.shadowOffset = CGSizeZero;
            circle8.layer.shadowRadius = 10;
            circle8.layer.shadowOpacity = 1.0;*/
            [circle8 setBackgroundColor:[self convertHexColor:@"#54F7FC"]];
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0 animations:^{
            /*circle1.layer.shadowColor = [self convertHexColor:@"#54F7FC"].CGColor;
            circle1.layer.shadowOffset = CGSizeZero;
            circle1.layer.shadowRadius = 10;
            circle1.layer.shadowOpacity = 1.0;*/
            [circle1 setBackgroundColor:[self convertHexColor:@"#54F7FC"]];
        }];
        [UIView addKeyframeWithRelativeStartTime:3.5 relativeDuration:0 animations:^{
            /*circle2.layer.shadowColor = [self convertHexColor:@"#54F7FC"].CGColor;
            circle2.layer.shadowOffset = CGSizeZero;
            circle2.layer.shadowRadius = 10;
            circle2.layer.shadowOpacity = 1.0;*/
            [circle2 setBackgroundColor:[self convertHexColor:@"#54F7FC"]];
        }];
     
    } completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(UIColor*)convertHexColor:(NSString*)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; //used to skip '#'
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue&0xFF0000)>>16)/255.0 green:((rgbValue&0xFF00)>>8)/255.0 blue:(rgbValue&0xFF)/255.0 alpha:1.0];
}

@end
