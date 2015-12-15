//
//  ViewController.m
//  flyingBird
//
//  Created by student on 15/12/2015.
//  Copyright © 2015 dungdang. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
@property(nonatomic, strong) AVAudioPlayer *backgroundMusic;

@end

@implementation ViewController
{
    UIImageView* bird;
    UIImageView* bird2;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self drawJungle];
    [self addBirdwith:0 and:0];
    [self addBird2with:0 and:100];
    [self flyUpAndDown];
    [self flyUpAndDown2];
    //[self flyUpAndDownwith:bird2];
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"birds" ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    self.backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    self.backgroundMusic.numberOfLoops = -1; //infinite
    
    [self.backgroundMusic play];
    self.backgroundMusic.currentTime = 0;
    
}
- (void)drawJungle{
    UIImageView* background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    background.frame= self.view.bounds;
    background.contentMode= UIViewContentModeScaleAspectFit;
    [self.view addSubview:background];
}
- (void)addBirdwith: (int) x
                and: (int)y{
    bird = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, 110, 68)];
    bird.animationImages = @[[UIImage imageNamed:@"bird0.png"],
                             [UIImage imageNamed:@"bird1.png"],
                             [UIImage imageNamed:@"bird2.png"],
                             [UIImage imageNamed:@"bird3.png"],
                             [UIImage imageNamed:@"bird4.png"],
                             [UIImage imageNamed:@"bird5.png"],];
    bird.animationRepeatCount = -1;
    bird.animationDuration = 1.2;
    [self.view addSubview:bird ];
    [bird startAnimating];
}
- (void)addBird2with: (int) x
                and: (int)y{
    bird2 = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, 110, 68)];
    bird2.animationImages = @[[UIImage imageNamed:@"bird0.png"],
                             [UIImage imageNamed:@"bird1.png"],
                             [UIImage imageNamed:@"bird2.png"],
                             [UIImage imageNamed:@"bird3.png"],
                             [UIImage imageNamed:@"bird4.png"],
                             [UIImage imageNamed:@"bird5.png"],];
    bird2.animationRepeatCount = -1;
    bird2.animationDuration = 0.8;
    [self.view addSubview:bird2 ];
    [bird2 startAnimating];
}


- (void)flyUpAndDown{
    bird.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:5
                     animations:^{
                         bird.center= CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height);
                         
    }
                     completion:^(BOOL finished){
                         bird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1, 1), CGAffineTransformMakeRotation(M_PI_4));
                         [UIView animateWithDuration:5
                                          animations:^{
                                              bird.center = CGPointMake(0, 0);
                                          }
                                          completion:^(BOOL finished){
                                              [self flyUpAndDown];
                                          }];
                     }];
}

- (void)flyUpAndDown2{
    bird2.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:3
                     animations:^{
                         bird2.center= CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height+100);
                         
                     }
                     completion:^(BOOL finished){
                         bird2.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1, 1), CGAffineTransformMakeRotation(M_PI_4));
                         [UIView animateWithDuration:3
                                          animations:^{
                                              bird2.center = CGPointMake(0, 100);
                                          }
                                          completion:^(BOOL finished){
                                              [self flyUpAndDown2];
                                          }];
                     }];
}


@end
