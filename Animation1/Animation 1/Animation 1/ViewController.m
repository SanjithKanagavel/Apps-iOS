//
//  ViewController.m
//  Animation 1
//
//  Created by Sanjith Kanagavel on 13/10/16.
//  Copyright © 2016 Sanjith Kanagavel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIButton *playBtn;
@property (strong, nonatomic) IBOutlet UIButton *playBtn1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self animation1];
    [self animation2];
    [self animation3];
}


-(void)animation1
{
    self.playBtn.transform = CGAffineTransformMakeScale(0.9, 0.9);
    [UIView animateWithDuration:1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        self.playBtn.transform = CGAffineTransformMakeScale(1.0,0.95);
      } completion:nil ];
}

-(void)animation2{
    
    UIView *rectView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.playBtn1.frame.size.width, self.playBtn1.frame.size.height)];
    rectView.layer.cornerRadius  = 20;
    rectView.layer.borderColor = [UIColor greenColor].CGColor;
    rectView.layer.borderWidth = 3.0f;
    [self.playBtn1 addSubview:rectView];
    
    self.playBtn1.transform= CGAffineTransformMakeScale(1.0, 0.9);
    [UIView animateWithDuration:1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        self.playBtn1.transform = CGAffineTransformMakeScale(1.2,1.2);
    } completion:nil ];
    
}

-(void)animation3{
    //UIButton *button = [UIButton alloc]initWithFrame:
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
