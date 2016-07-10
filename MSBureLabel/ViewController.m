//
//  ViewController.m
//  MSBureLabel
//
//  Created by 清风 on 16/7/8.
//  Copyright © 2016年 mrscorpion. All rights reserved.
//

#import "ViewController.h"
#import "MSBureLabel-Swift.h"

@interface ViewController ()
<
LTMorphingLabelDelegate
>
@property (nonatomic, strong) LTMorphingLabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(creat)];
    [self.view addGestureRecognizer:tap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(distory)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
}
- (LTMorphingLabel *)label
{
    if (!_label) {
        _label =[[LTMorphingLabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        _label.delegate = self;
        _label.morphingEffect = LTMorphingEffectBurn;
        _label.textColor = [UIColor whiteColor];
        _label.text = @"正在加温🔥";
        [_label BurnLoad];
    }
    return _label;
}
- (void)creat
{
    [self.view addSubview:self.label];
}
- (void)distory
{
    [self.label removeFromSuperview];
    self.label = nil;
}
- (void)morphingDidStart:(LTMorphingLabel *)label
{
    NSLog(@"did start");
}
- (void)morphingDidComplete:(LTMorphingLabel *)label
{
    NSLog(@"did complete");
}
- (void)morphingOnProgress:(LTMorphingLabel *)label progress:(float)progress
{
    NSLog(@"progress --> %f", progress);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
