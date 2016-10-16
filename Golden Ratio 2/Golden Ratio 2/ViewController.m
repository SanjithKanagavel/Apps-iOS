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
        button.frame  = CGRectMake(buttonPosX, buttonPosY-20, 50, 50);
    } completion:^(BOOL finished){
        
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
