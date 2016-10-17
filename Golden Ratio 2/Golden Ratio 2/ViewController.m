//
//  ViewController.m
//  Golden Ratio 2
//
//  Created by Sanjith Kanagavel on 16/10/16.
//  Copyright © 2016 Sanjith Kanagavel. All rights reserved.
//

#import "ViewController.h"
#import "YPBubbleTransition.h"
#import "sampleVC.h"

@interface ViewController ()  <UIViewControllerTransitioningDelegate>
    @property (strong, nonatomic) YPBubbleTransition *transition;
@end

@implementation ViewController

UIView *view1;
UIView *view2;

UIButton *button;
UIButton *button1; //fb
UIButton *button2; //twitter
UIButton *button3; //google plus
UIButton *button4; //instagram
UIButton *button5; //youtube
bool collapsed;

float buttonPosY,buttonPosX;

- (void)viewDidLoad {
    [super viewDidLoad];
    collapsed = true;
    // Do any additional setup after loading the view, typically from a nib.
    view1 = [[UIView alloc]initWithFrame:CGRectMake(-[[UIScreen mainScreen] bounds].size.width,0,[[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height)];
    [view1 setBackgroundColor:[self colorFromHexString:@"#546E7A"]];
    [self.view addSubview:view1];
    
    view2 = [[UIView alloc]initWithFrame:CGRectMake(0,[[UIScreen mainScreen] bounds].size.height,[[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height)];
    [view2 setBackgroundColor:[self colorFromHexString:@"#F9A825"]];
    [self.view addSubview:view2];
    buttonPosY = [[UIScreen mainScreen] bounds].size.height - ([[UIScreen mainScreen] bounds].size.height/3);
    buttonPosX = [[UIScreen mainScreen] bounds].size.width - ([[UIScreen mainScreen] bounds].size.width/3) - 30;
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:view1.bounds];
    view1.layer.masksToBounds = NO;
    view1.layer.shadowColor = [UIColor blackColor].CGColor;
    view1.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    view1.layer.shadowOpacity = 0.5f;
    view1.layer.shadowPath = shadowPath.CGPath;
    
    [self animateView1];
    
    self.transitioningDelegate = self;
    
}

-(void) animateView1{
     [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
         view1.frame = CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height);
     } completion:^(bool finished){
         [self animateView2];
     }];
}

-(YPBubbleTransition *)transition
{
    if (!_transition) {
        _transition = [[YPBubbleTransition alloc] init];
    }
    return _transition;
}


-(void) animateView2{
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    button.frame = CGRectMake(buttonPosX+25, buttonPosY-20+25, 0, 0);
    button.adjustsImageWhenHighlighted = NO;
    [button addTarget:self action:@selector(roundButtonDidTap) forControlEvents:UIControlEventTouchUpInside];
    
    
    button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setBackgroundImage:[UIImage imageNamed:@"facebook.png"] forState:UIControlStateNormal];
    button1.frame = CGRectMake(buttonPosX+25, buttonPosY-20+25, 0, 0);
    button1.adjustsImageWhenHighlighted = NO;
    button1.showsTouchWhenHighlighted = YES;
    [button1 addTarget:self action:@selector(facebookButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    button1.alpha = 0;
    
    button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setBackgroundImage:[UIImage imageNamed:@"twitter.png"] forState:UIControlStateNormal];
    button2.frame = CGRectMake(buttonPosX+25, buttonPosY-20+25, 0, 0);
    button2.adjustsImageWhenHighlighted = NO;
    button2.alpha = 0;
    [button2 addTarget:self action:@selector(twitterButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setBackgroundImage:[UIImage imageNamed:@"google.png"] forState:UIControlStateNormal];
    button3.frame = CGRectMake(buttonPosX+25, buttonPosY-20+25, 0, 0);
    button3.adjustsImageWhenHighlighted = NO;
    button3.alpha = 0;
    [button3 addTarget:self action:@selector(googleButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button4 setBackgroundImage:[UIImage imageNamed:@"instagram.png"] forState:UIControlStateNormal];
    button4.frame = CGRectMake(buttonPosX+25, buttonPosY-20+25, 0, 0);
    button4.adjustsImageWhenHighlighted = NO;
    button4.alpha = 0;
    [button4 addTarget:self action:@selector(instagramButtonClick) forControlEvents:UIControlEventTouchUpInside];

    
    
    button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button5 setBackgroundImage:[UIImage imageNamed:@"youtube.png"] forState:UIControlStateNormal];
    button5.frame = CGRectMake(buttonPosX+25, buttonPosY-20+25, 0, 0);
    button5.adjustsImageWhenHighlighted = NO;
    button5.alpha = 0;
    [button5 addTarget:self action:@selector(youtubeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button5];
    [self.view addSubview:button4];
    [self.view addSubview:button3];
    [self.view addSubview:button2];
    [self.view addSubview:button1];
    [self.view addSubview:button];
    
    [UIView animateWithDuration:1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view2.frame = CGRectMake(0,buttonPosY,[[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height);
    } completion:^(bool finished){
        [self buttonAnimation];
    }];
}

-(void) facebookButtonClick {
    buttonCode = 1;
    [self _presentWithSegueIdentifier:@"showView" animated:NO];
}


-(void) youtubeButtonClick
{
    buttonCode = 5;
    [self _presentWithSegueIdentifier:@"showView" animated:NO];
}

-(void) instagramButtonClick
{
     buttonCode = 4;
     [self _presentWithSegueIdentifier:@"showView" animated:NO];
}

-(void) googleButtonClick
{
    buttonCode = 3;
    [self _presentWithSegueIdentifier:@"showView" animated:NO];
}


-(void) twitterButtonClick
{
    buttonCode = 2;
    [self _presentWithSegueIdentifier:@"showView" animated:NO];
}


-(void)roundButtonDidTap{
    
    if(collapsed) {
    
    //button.frame  = CGRectMake(button.frame.origin.x, button.frame.origin.y, 50, 50);
    CGPoint buttonCen = [button center];
    UIBezierPath *aPath = [UIBezierPath bezierPath];

    float x = buttonCen.x;
    float y = buttonCen.y;
    
    [aPath addArcWithCenter:CGPointMake(x, y)
                     radius:25
                 startAngle:M_PI_2
                   endAngle:M_PI
                  clockwise:YES];
    
    [aPath addArcWithCenter:CGPointMake(x+15, y)
                     radius:40
                 startAngle:M_PI
                   endAngle:M_PI+M_PI_2
                  clockwise:YES];
    
    
    [aPath addArcWithCenter:CGPointMake(x+15, y+30)
                     radius:70
                 startAngle:M_PI+M_PI_2
                   endAngle:0
                  clockwise:YES];
    
    [aPath addArcWithCenter:CGPointMake(x-15, y+30)
                     radius:100
                 startAngle:0
                   endAngle:M_PI_2
                  clockwise:YES];
    
    
    [aPath addArcWithCenter:CGPointMake(x-20, y-70)
                     radius:200
                 startAngle:M_PI_2
                   endAngle:M_PI_2+(M_PI_4+M_PI_4/10)
                  clockwise:YES];
    
    
    
    UIBezierPath *bPath = [UIBezierPath bezierPath];
    
    float x1 = buttonCen.x;
    float y1 = buttonCen.y;
    
    [bPath addArcWithCenter:CGPointMake(x1, y1)
                     radius:25
                 startAngle:M_PI_2
                   endAngle:M_PI
                  clockwise:YES];
    
    [bPath addArcWithCenter:CGPointMake(x1+15, y1)
                     radius:40
                 startAngle:M_PI
                   endAngle:M_PI+M_PI_2
                  clockwise:YES];
    
    
    [bPath addArcWithCenter:CGPointMake(x1+15, y1+30)
                     radius:70
                 startAngle:M_PI+M_PI_2
                   endAngle:0
                  clockwise:YES];
    
    [bPath addArcWithCenter:CGPointMake(x1-15, y1+30)
                     radius:100
                 startAngle:0
                   endAngle:M_PI_4+(M_PI_4/2)
                  clockwise:YES];
    
    [bPath addArcWithCenter:CGPointMake(x-20, y-70)
                     radius:200
                 startAngle:M_PI_2
                   endAngle:M_PI_2+(M_PI_4/2+M_PI_4/10)
                  clockwise:YES];
    
    bPath.lineJoinStyle = kCGLineJoinRound;
    
    UIBezierPath *cPath = [UIBezierPath bezierPath];
    
    [cPath addArcWithCenter:CGPointMake(x1, y1)
                     radius:25
                 startAngle:M_PI_2
                   endAngle:M_PI
                  clockwise:YES];
    
    [cPath addArcWithCenter:CGPointMake(x1+15, y1)
                     radius:40
                 startAngle:M_PI
                   endAngle:M_PI+M_PI_2
                  clockwise:YES];
    
    
    [cPath addArcWithCenter:CGPointMake(x1+15, y1+30)
                     radius:70
                 startAngle:M_PI+M_PI_2
                   endAngle:0
                  clockwise:YES];
    
    [cPath addArcWithCenter:CGPointMake(x1-15, y1+30)
                     radius:100
                 startAngle:0
                   endAngle:M_PI_4+(M_PI_4/2)
                  clockwise:YES];
    
    [cPath addArcWithCenter:CGPointMake(x-20, y-70)
                     radius:200
                 startAngle:M_PI_2
                   endAngle:M_PI_2+(M_PI_4/8)
                  clockwise:YES];
    
    
    cPath.lineJoinStyle = kCGLineJoinRound;
    
    UIBezierPath *dPath = [UIBezierPath bezierPath];
    
    [dPath addArcWithCenter:CGPointMake(x1, y1)
                     radius:25
                 startAngle:M_PI_2
                   endAngle:M_PI
                  clockwise:YES];
    
    [dPath addArcWithCenter:CGPointMake(x1+15, y1)
                     radius:40
                 startAngle:M_PI
                   endAngle:M_PI+M_PI_2
                  clockwise:YES];
    
    
    [dPath addArcWithCenter:CGPointMake(x1+15, y1+30)
                     radius:70
                 startAngle:M_PI+M_PI_2
                   endAngle:0
                  clockwise:YES];
    
    [dPath addArcWithCenter:CGPointMake(x1-15, y1+30)
                     radius:100
                 startAngle:0
                   endAngle:M_PI_4+(M_PI_4/3)
                  clockwise:YES];
    dPath.lineJoinStyle = kCGLineJoinRound;
    
    UIBezierPath *ePath = [UIBezierPath bezierPath];
    
    [ePath addArcWithCenter:CGPointMake(x1, y1)
                     radius:25
                 startAngle:M_PI_2
                   endAngle:M_PI
                  clockwise:YES];
    
    [ePath addArcWithCenter:CGPointMake(x1+15, y1)
                     radius:40
                 startAngle:M_PI
                   endAngle:M_PI+M_PI_2
                  clockwise:YES];
    
    
    [ePath addArcWithCenter:CGPointMake(x1+15, y1+30)
                     radius:70
                 startAngle:M_PI+M_PI_2
                   endAngle:0
                  clockwise:YES];
    
    [ePath addArcWithCenter:CGPointMake(x1-15, y1+30)
                     radius:100
                 startAngle:0
                   endAngle:(M_PI_4/2-M_PI_4/10)
                  clockwise:YES];
    
    ePath.lineJoinStyle = kCGLineJoinRound;
    
    
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.path = aPath.CGPath;
    positionAnimation.fillMode = kCAFillModeForwards;
    positionAnimation.removedOnCompletion = NO;
    positionAnimation.calculationMode = kCAAnimationPaced;
    positionAnimation.duration = 1;
    [button1.layer addAnimation:positionAnimation forKey:@"position"];
    
    
    CAKeyframeAnimation *positionAnimation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation1.path = bPath.CGPath;
    positionAnimation1.fillMode = kCAFillModeForwards;
    positionAnimation1.removedOnCompletion = NO;
    positionAnimation1.calculationMode = kCAAnimationPaced;
    positionAnimation1.duration = 1;
    [button2.layer addAnimation:positionAnimation1 forKey:@"position"];
    
    
    CAKeyframeAnimation *positionAnimation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation2.path = cPath.CGPath;
    positionAnimation2.fillMode = kCAFillModeForwards;
    positionAnimation2.removedOnCompletion = NO;
    positionAnimation2.calculationMode = kCAAnimationPaced;
    positionAnimation2.duration = 1;
    [button3.layer addAnimation:positionAnimation2 forKey:@"position"];
    
    
    
    CAKeyframeAnimation *positionAnimation3 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation3.path = dPath.CGPath;
    positionAnimation3.fillMode = kCAFillModeForwards;
    positionAnimation3.removedOnCompletion = NO;
    positionAnimation3.calculationMode = kCAAnimationPaced;
    positionAnimation3.duration = 1;
    [button4.layer addAnimation:positionAnimation3 forKey:@"position"];
    
    
    
    CAKeyframeAnimation *positionAnimation4 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation4.path = ePath.CGPath;
    positionAnimation4.fillMode = kCAFillModeForwards;
    positionAnimation4.removedOnCompletion = NO;
    positionAnimation4.calculationMode = kCAAnimationPaced;
    positionAnimation4.duration = 1;
    [button5.layer addAnimation:positionAnimation4 forKey:@"position"];
        
        [CATransaction setCompletionBlock:^{
            CGRect Val =[button1.layer.presentationLayer frame];
            button1.layer.frame = CGRectMake(Val.origin.x, Val.origin.y, Val.size.width, Val.size.height);
            
            CGRect Val2 =[button2.layer.presentationLayer frame];
            button2.layer.frame = CGRectMake(Val2.origin.x, Val2.origin.y, Val2.size.width, Val2.size.height);
            
            CGRect Val1 =[button3.layer.presentationLayer frame];
            button3.layer.frame = CGRectMake(Val1.origin.x, Val1.origin.y, Val1.size.width, Val1.size.height);
            
            CGRect Val4 =[button4.layer.presentationLayer frame];
            button4.layer.frame = CGRectMake(Val4.origin.x, Val4.origin.y, Val4.size.width, Val4.size.height);
            
            CGRect Val5 =[button5.layer.presentationLayer frame];
            button5.layer.frame = CGRectMake(Val5.origin.x, Val5.origin.y, Val5.size.width, Val5.size.height);
            
        }];
    
    button.alpha = 0;
    [UIView animateWithDuration:1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        button1.alpha = 1;
        button2.alpha = 1;
        button3.alpha = 1;
        button4.alpha = 1;
        button5.alpha = 1;
        
        [button setBackgroundImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
        button.alpha = 1;
    } completion:^(BOOL finished){
    }];
    
    
    }
    else{
        button.alpha = 0;
        [UIView animateWithDuration:1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [button setBackgroundImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
            button.alpha = 1;
            button1.alpha = 0;
            button2.alpha = 0;
            button3.alpha = 0;
            button4.alpha = 0;
            button5.alpha = 0;
            
        } completion:^(BOOL finished){
        }];
   
    }
    
    collapsed = !collapsed;
}


-(void) buttonAnimation {
    [UIView animateWithDuration:1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [view1 setBackgroundColor:[UIColor blackColor]];
        button.frame  = CGRectMake(buttonPosX, buttonPosY-20, 50, 50);
        button1.frame  = CGRectMake(button1.frame.origin.x, button1.frame.origin.y, 50, 50);
        button2.frame  = CGRectMake(button2.frame.origin.x, button2.frame.origin.y, 50, 50);
        button3.frame  = CGRectMake(button3.frame.origin.x, button3.frame.origin.y, 50, 50);
        button4.frame  = CGRectMake(button4.frame.origin.x, button4.frame.origin.y, 50, 50);
        button5.frame  = CGRectMake(button5.frame.origin.x, button5.frame.origin.y, 50, 50);
        
    } completion:^(BOOL finished){


    }];
}


- (void)_presentWithSegueIdentifier:(NSString *)segueIdentifier animated:(BOOL)animated
{
    if (animated) {
        [self performSegueWithIdentifier:segueIdentifier sender:nil];
    } else {
        [UIView performWithoutAnimation:^{
            [self performSegueWithIdentifier:segueIdentifier sender:nil];
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}



 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
     UIViewController *destinationViewController = segue.destinationViewController;
     if ([[segue identifier] isEqualToString:@"showView"]) {
        ((sampleVC *)destinationViewController).number = buttonCode;
     }
     
     UIViewController *controller = segue.destinationViewController;
     controller.transitioningDelegate = self;
     controller.modalPresentationStyle = UIModalPresentationCustom;
     controller.modalTransitionStyle = UIModalPresentationCustom;
 }

int buttonCode = -1;
#pragma mark - Bubble animations

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    self.transition.transitionMode = YPBubbleTransitionModePresent;
    if(buttonCode == 1)
    {
        self.transition.startPoint = button1.center;
    }
    else if(buttonCode == 2) {
        self.transition.startPoint = button2.center;
    }
    else if(buttonCode == 3) {
        self.transition.startPoint = button3.center;
    }
    else if(buttonCode == 4) {
        self.transition.startPoint = button4.center;
    }
    else if(buttonCode == 5) {
        self.transition.startPoint = button5.center;
    }
    self.transition.bubbleColor = [self colorFromHexString:@"#FDD835"];
    return self.transition;
}



- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    self.transition.transitionMode = YPBubbleTransitionModeDismiss;
    
    if(buttonCode == 1)
    {
        self.transition.startPoint = button1.center;
    }
    else if(buttonCode == 2) {
        self.transition.startPoint = button2.center;
    }
    else if(buttonCode == 3) {
        self.transition.startPoint = button3.center;
    }
    else if(buttonCode == 4) {
        self.transition.startPoint = button4.center;
    }
    else if(buttonCode == 5) {
        self.transition.startPoint = button5.center;
    }
    
    buttonCode = -1;
    
    self.transition.bubbleColor = [self colorFromHexString:@"#FDD835"];
    return self.transition;
}



@end




// Junk codes

/*CAShapeLayer *shapeLayer = [CAShapeLayer layer];
 shapeLayer.path = bPath.CGPath;
 shapeLayer.strokeColor = [UIColor redColor].CGColor;
 shapeLayer.lineWidth = 2.0; //etc...
 [self.view.layer addSublayer:shapeLayer];
 */

/*CABasicAnimation * pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
 pathAnimation.toValue = (__bridge id)[bPath CGPath];
 pathAnimation.duration = 0.39f;
 [button.layer addAnimation:pathAnimation forKey:nil];*/




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
 
CAShapeLayer *clockWiseLayer = [[CAShapeLayer alloc] init];
 
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
