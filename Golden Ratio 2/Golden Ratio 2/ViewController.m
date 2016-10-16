//
//  ViewController.m
//  Golden Ratio 2
//
//  Created by Sanjith Kanagavel on 16/10/16.
//  Copyright © 2016 Sanjith Kanagavel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UIView *view1;
UIView *view2;
UIButton *button;
float buttonPosY,buttonPosX;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    view1 = [[UIView alloc]initWithFrame:CGRectMake(-[[UIScreen mainScreen] bounds].size.width,0,[[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height)];
    [view1 setBackgroundColor:[self colorFromHexString:@"#546E7A"]];
    [self.view addSubview:view1];
    
    view2 = [[UIView alloc]initWithFrame:CGRectMake(0,[[UIScreen mainScreen] bounds].size.height,[[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height)];
    [view2 setBackgroundColor:[self colorFromHexString:@"#F9A825"]];
    [self.view addSubview:view2];
    buttonPosY = [[UIScreen mainScreen] bounds].size.height - ([[UIScreen mainScreen] bounds].size.height/3);
    buttonPosX = [[UIScreen mainScreen] bounds].size.width - ([[UIScreen mainScreen] bounds].size.width/3);
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:view1.bounds];
    view1.layer.masksToBounds = NO;
    view1.layer.shadowColor = [UIColor blackColor].CGColor;
    view1.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    view1.layer.shadowOpacity = 0.5f;
    view1.layer.shadowPath = shadowPath.CGPath;
    
    [self animateView1];
    
    
    
}

-(void) animateView1{
     [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
         view1.frame = CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height);
     } completion:^(bool finished){
         [self animateView2];
     }];
}

-(void) animateView2{
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"plus.png"] forState:UIControlStateNormal];
    button.frame = CGRectMake(buttonPosX+25, buttonPosY-20+25, 0, 0);
    button.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:button];
    [UIView animateWithDuration:1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view2.frame = CGRectMake(0,buttonPosY,[[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height);
    } completion:^(bool finished){
        [self buttonAnimation];
    }];
}

-(void) buttonAnimation {
    [UIView animateWithDuration:1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [view1 setBackgroundColor:[UIColor blackColor]];
        button.frame  = CGRectMake(buttonPosX, buttonPosY-20, 50, 50);
    } completion:^(BOOL finished){

        /*CGPoint buttonCen = [button center];
        NSLog(@"%f %f",buttonCen.x,buttonCen.y);
        UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150)
                                                             radius:75
                                                         startAngle:0
                                                           endAngle:M_PI_2+M_PI_4
                                                          clockwise:YES];
        
        
        CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        positionAnimation.path = aPath.CGPath;
        positionAnimation.fillMode = kCAFillModeForwards;
        positionAnimation.removedOnCompletion = NO;
        positionAnimation.duration = 2.0;
        [button.layer addAnimation:positionAnimation forKey:positionAnimation.keyPath];
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = aPath.CGPath;
        shapeLayer.strokeColor = [UIColor redColor].CGColor;
        shapeLayer.lineWidth = 2.0; //etc...
        //shapeLayer.position = CGPointMake(100, 100);
        [self.view.layer addSublayer:shapeLayer];*/
        
        
        /*CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
        [animation setDuration:2.0f];
        [animation setRemovedOnCompletion:NO];
        [animation setFillMode:kCAFillModeForwards];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
        [animation setFromValue:[NSNumber numberWithDouble:400.0]];
        [animation setToValue:[NSNumber numberWithDouble:0.0]];
        [animation setRepeatCount:1.0];
        [animation setDelegate:self];
        [button.layer addAnimation:animation forKey:@"animatePositionY"];
        
        animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
         [animation setDuration:2.0f];
         [animation setRemovedOnCompletion:NO];
         [animation setFillMode:kCAFillModeForwards];
         [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
         [animation setFromValue:[NSNumber numberWithDouble:300.0]];
         [animation setToValue:[NSNumber numberWithDouble:0.0]];
         [animation setRepeatCount:1.0];
         [animation setDelegate:self];
         [button.layer addAnimation:animation forKey:@"animatePositionX"];
        
        /*CAShapeLayer *clockWiseLayer = [[CAShapeLayer alloc] init];
        
        CGFloat startAngle = -M_PI_2;
        CGFloat endAngle = M_PI + M_PI_2;
        
        CGFloat width = CGRectGetWidth(button.frame)/2.0f + 30;
        CGFloat height = CGRectGetHeight(button.frame)/2.0f +50;
        CGPoint centerPoint = CGPointMake(width, height);
        
        float radius = CGRectGetWidth(button.frame)/2+10;
        
        clockWiseLayer.path = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                             radius:radius
                                                         startAngle:startAngle
                                                           endAngle:endAngle
                                                          clockwise:YES].CGPath;
        
        clockWiseLayer.fillColor = [UIColor clearColor].CGColor;
        clockWiseLayer.strokeColor = [UIColor blueColor].CGColor;
        clockWiseLayer.borderColor = [UIColor greenColor].CGColor;
        clockWiseLayer.backgroundColor = [UIColor redColor].CGColor;
        
        clockWiseLayer.strokeStart = 0.0f;
        clockWiseLayer.strokeEnd = 0.5f;
        
        clockWiseLayer.lineWidth = 2.0f;
        clockWiseLayer.borderWidth = 5.0f;
        
        clockWiseLayer.shouldRasterize = NO;
        [self.view.layer addSublayer:clockWiseLayer];
        
        
        
        CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
        [animation setDuration:DURATION];
        [animation setRemovedOnCompletion:NO];
        [animation setFillMode:kCAFillModeForwards];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
        [animation setFromValue:[NSNumber numberWithDouble:400.0]];
        [animation setToValue:[NSNumber numberWithDouble:0.0]];
        [animation setRepeatCount:1.0];
        [animation setDelegate:self];
        [button.layer addAnimation:animation forKey:@"animatePositionY"];*/
        
        /*animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
        [animation setDuration:DURATION];
        [animation setRemovedOnCompletion:NO];
        [animation setFillMode:kCAFillModeForwards];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        [animation setFromValue:[NSNumber numberWithDouble:300.0]];
        [animation setToValue:[NSNumber numberWithDouble:0.0]];
        [animation setRepeatCount:1.0];
        [animation setDelegate:self];
        [button.layer addAnimation:animation forKey:@"animatePositionX"];*/
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
