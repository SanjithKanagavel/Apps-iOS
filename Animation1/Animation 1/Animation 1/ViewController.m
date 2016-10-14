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
    //[self animation1];
    //[self animation2];
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
    
    [UIView animateWithDuration:1 delay:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.playBtn.frame =CGRectMake(self.playBtn.frame.origin.x-10,self.playBtn.frame.origin.y,self.playBtn.frame.size.width,self.playBtn.frame.size.height);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
                self.playBtn.frame =CGRectMake(self.playBtn.frame.origin.x+30,self.playBtn.frame.origin.y,self.playBtn.frame.size.width,self.playBtn.frame.size.height);
        } completion:nil];
    }];
}


-(void)animation3{
    [UIView animateWithDuration:1 delay:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.playBtn.frame =CGRectMake(self.playBtn.frame.origin.x,self.playBtn.frame.origin.y-10,self.playBtn.frame.size.width,self.playBtn.frame.size.height);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
            self.playBtn.frame =CGRectMake(self.playBtn.frame.origin.x,self.playBtn.frame.origin.y+30,self.playBtn.frame.size.width,self.playBtn.frame.size.height);
        } completion:nil];
    }];
}

-(void) animation4 {

    /*[UIView animateKeyframesWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1 animations:^{
            self.playBtn.frame = CGRectMake(self.playBtn.frame.origin.x-10,self.playBtn.frame.origin.y,self.playBtn.frame.size.width,self.playBtn.frame.size.height);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:1.0 relativeDuration:1.0 animations:^{
            self.playBtn.frame = CGRectMake(self.playBtn.frame.origin.x+20,self.playBtn.frame.origin.y,self.playBtn.frame.size.width,self.playBtn.frame.size.height);
        }];
    
        
    } completion:nil];
     */
    /*UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior* gravityBehavior =
    [[UIGravityBehavior alloc] initWithItems:@[self.playBtn]];
    [animator addBehavior:gravityBehavior];
    
    UICollisionBehavior* collisionBehavior =
    [[UICollisionBehavior alloc] initWithItems:@[self.playBtn]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:collisionBehavior];
    
    UIDynamicItemBehavior *elasticityBehavior =
    [[UIDynamicItemBehavior alloc] initWithItems:@[self.playBtn]];
    elasticityBehavior.elasticity = 0.7f;
    [animator addBehavior:elasticityBehavior];*/
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
