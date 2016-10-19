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
UIView *circle1,*circle2,*circle3,*circle4,*circle5,*circle6,*circle7;
UIBezierPath *circlePath;
double SCREEN_CENTER_X;
double SCREEN_CENTER_Y;

- (void)viewDidLoad {
    [super viewDidLoad];
    SCREEN_CENTER_X=[[UIScreen mainScreen]bounds].size.width/2;
    SCREEN_CENTER_Y=[[UIScreen mainScreen]bounds].size.height/2;
    [self.view setBackgroundColor:[self convertHexColor:@"#001C31"]];
    circle1 = [[UIView alloc]initWithFrame:CGRectMake(0,0,30,30)];
    circle1.layer.cornerRadius=13;
    [circle1 setCenter:CGPointMake(SCREEN_CENTER_X,SCREEN_CENTER_Y)];
    [circle1 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
    
    
    circlePath = [UIBezierPath bezierPath];
    [circlePath addArcWithCenter:CGPointMake(SCREEN_CENTER_X,SCREEN_CENTER_Y) radius:25 startAngle:0 endAngle:2*M_PI  clockwise:YES];
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.path = circlePath.CGPath;
    circleLayer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:circleLayer];
    
    [self.view addSubview:circle1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIColor*)convertHexColor:(NSString*)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; //used to skip '#'
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue&0xFF0000)>>16)/255.0 green:((rgbValue&0xFF00)>>8)/255.0 blue:(rgbValue&0xFF)/255.0 alpha:1.0];
}

@end
