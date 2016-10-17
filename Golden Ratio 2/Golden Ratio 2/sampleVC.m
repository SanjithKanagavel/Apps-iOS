//
//  sampleVC.m
//  Golden Ratio 2
//
//  Created by Sanjith Kanagavel on 17/10/16.
//  Copyright © 2016 Sanjith Kanagavel. All rights reserved.
//

#import "sampleVC.h"

@implementation sampleVC

UIButton *closebutton;
UIImageView *img;

- (void)viewDidLoad {
    [self.view setBackgroundColor:[self colorFromHexString:@"#FDD835"]];
    NSLog(@"%d",_number);
    closebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closebutton setBackgroundImage:[UIImage imageNamed:@"close1.png"] forState:UIControlStateNormal];
    closebutton.frame = CGRectMake(20,40, 50, 50);
    closebutton.adjustsImageWhenHighlighted = NO;
    
    if(_number == 1)
    {
     img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"facebook.png"]];
    }
    else if(_number == 2)
    {
     img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"twitter.png"]];
    }
    else if(_number == 3)
    {
     img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"google.png"]];
    }
    else if(_number == 4)
    {
     img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"instagram.png"]];
    }
    else if(_number == 5)
    {
     img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"youtube.png"]];
    }
    
    
    img.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width/2-50) , [[UIScreen mainScreen] bounds].size.height/2-50, 300, 300);
    [img setCenter: CGPointMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2)];
    
    [closebutton addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:img];
    [self.view addSubview:closebutton];
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [UIView animateWithDuration:0.5f animations:^{
        closebutton.transform = CGAffineTransformIdentity;
    }];
}


- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

-(void)closeAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
