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
}


-(void)animation1
{
    self.playBtn.transform = CGAffineTransformMakeScale(0.9, 0.9);
    [UIView animateWithDuration:1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        self.playBtn.transform = CGAffineTransformMakeScale(1.0,0.95);
    } completion:nil ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
