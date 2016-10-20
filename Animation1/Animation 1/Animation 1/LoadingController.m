//
//  LoadingController.m
//  Animation 1
//
//  Created by Sanjith Kanagavel on 20/10/16.
//  Copyright © 2016 Sanjith Kanagavel. All rights reserved.
//

#import "LoadingController.h"

@interface LoadingController ()

@end

@implementation LoadingController

UIView *circle1,*circle2,*circle3;
double SCREEN_CENTER_X;
double SCREEN_CENTER_Y;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    SCREEN_CENTER_X=[[UIScreen mainScreen]bounds].size.width/2;
    SCREEN_CENTER_Y=[[UIScreen mainScreen]bounds].size.height/2;
    [self.view setBackgroundColor:[self convertHexColor:@"#001C31"]];
    
    circle1 = [[UIView alloc]initWithFrame:CGRectMake(0,0,20,20)];
    circle1.layer.cornerRadius=10;
    [circle1 setCenter:CGPointMake(SCREEN_CENTER_X,SCREEN_CENTER_Y)];
    [circle1 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
    
    circle2 = [[UIView alloc]initWithFrame:CGRectMake(0,0,20,20)];
    circle2.layer.cornerRadius=10;
    [circle2 setCenter:CGPointMake(SCREEN_CENTER_X+40,SCREEN_CENTER_Y)];
    [circle2 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
    
    circle3 = [[UIView alloc]initWithFrame:CGRectMake(0,0,20,20)];
    circle3.layer.cornerRadius=10;
    [circle3 setCenter:CGPointMake(SCREEN_CENTER_X-40,SCREEN_CENTER_Y)];
    [circle3 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
    
    [self.view addSubview:circle3];
    [self.view addSubview:circle2];
    [self.view addSubview:circle1];
    [self animationSet1];
}

-(void) animationSet1{

    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{

        [circle1 setBackgroundColor:[self convertHexColor:@"#54F7FC"]];
        [circle2 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
        [circle3 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
        
    } completion:^(BOOL finished){
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [circle2 setBackgroundColor:[self convertHexColor:@"#54F7FC"]];
            [circle1 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
            [circle3 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
            } completion:^(BOOL finished){
                
                [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    [circle3 setBackgroundColor:[self convertHexColor:@"#54F7FC"]];
                    [circle1 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
                    [circle2 setBackgroundColor:[self convertHexColor:@"#46B9FF"]];
                } completion:^(BOOL finished){
                    [self animationSet1];
                }];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(UIColor*)convertHexColor:(NSString*)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; //used to skip '#'
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue&0xFF0000)>>16)/255.0 green:((rgbValue&0xFF00)>>8)/255.0 blue:(rgbValue&0xFF)/255.0 alpha:1.0];
}

@end
