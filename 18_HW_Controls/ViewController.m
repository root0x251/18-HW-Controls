//
//  ViewController.m
//  18_HW_Controls
//
//  Created by Slava on 24.05.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
// выбор изображения
typedef enum {
    ImageOne,
    ImageTwo,
    ImageTree
}SelectSrgmentImage;

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Chose Person
- (IBAction)chosePerson:(UISegmentedControl *)sender {
    if (self.choisePerson.selectedSegmentIndex == ImageOne) {
        self.mainPersonImage.image = [UIImage imageNamed:@"Finn.png"];
    } else if (self.choisePerson.selectedSegmentIndex == ImageTwo) {
        self.mainPersonImage.image = [UIImage imageNamed:@"bubblegum.png"];
    } else if (self.choisePerson.selectedSegmentIndex == ImageTree) {
        self.mainPersonImage.image = [UIImage imageNamed:@"large.png"];
    }
}


#pragma mark - Change switch
- (IBAction)rotateSwitchAction:(UISwitch *)sender {
    if (self.rotateSwitch.isOn == YES) {
        [UIImageView animateWithDuration:2 / self.speedSlider.value
                                   delay:0.f
                                 options:UIViewAnimationOptionCurveLinear
                              animations:^{
                                  CGAffineTransform currentTransform = self.mainPersonImage.transform;
                                  self.mainPersonImage.transform = CGAffineTransformRotate(currentTransform, M_PI_4);
                              } completion:^(BOOL finished) {
                                  [self rotateSwitchAction:sender];
                              }];
    } else if (self.rotateSwitch.isOn == NO) {
        [self.mainPersonImage.layer removeAllAnimations];
    }
}

- (IBAction)scaleSwitchAction:(UISwitch *)sender {
    CGFloat scale = (float)(arc4random() % 151) / 100 + 0.5;  // from 0 to 1,5
    if (self.scaleSwitch.isOn == YES) {
        [UIView animateWithDuration:2 / self.speedSlider.value
                                   delay:0.f
                                 options:UIViewAnimationOptionCurveLinear
                              animations:^{
                                  CGAffineTransform currentTransform = self.mainPersonImage.transform;
                                  self.mainPersonImage.transform = CGAffineTransformScale(currentTransform, scale, scale);
                              } completion:^(BOOL finished) {
                                  [self scaleSwitchAction:sender];
                              }];
    } else if (self.scaleSwitch.isOn == NO) {
        [self.mainPersonImage.layer removeAllAnimations];
    }
}

- (IBAction)transitionSwitchAction:(UISwitch *)sender {
    CGFloat x = (CGFloat)(arc4random() % (int)self.viewField.bounds.size.width);             // рандомная точка X
    CGFloat y = (CGFloat)(arc4random() % (int)self.viewField.bounds.size.height);
    if (self.transitionSwitch.isOn == YES) {
        [UIImageView animateWithDuration:2 / self.speedSlider.value
                                   delay:0.f
                                 options:UIViewAnimationOptionCurveLinear
                              animations:^{
                                  self.mainPersonImage.center = CGPointMake(x, y);
                              } completion:^(BOOL finished) {
                                  [self transitionSwitchAction:sender];
                              }];
    } else if (self.transitionSwitch.isOn == NO) {
        [self.mainPersonImage.layer removeAllAnimations];
    }
}


- (IBAction)animation:(UISwitch *)sender {
    // создаем точки
    CGFloat randomX = (CGFloat)(arc4random() % (int)self.viewField.bounds.size.width);             // рандомная точка X
    CGFloat randomY = (CGFloat)(arc4random() % (int)self.viewField.bounds.size.height);
    
    // рандомный размер
    CGFloat scaleView = (float)(arc4random() % 151) / 100 + 0.5;  // from 0 to 1,5
    
    // поворот
    CGFloat rotationView = (float)(arc4random() * (int)(M_PI * 2 * 1000)) / 1000 - M_PI;   // from 0 to 2Pi
    
    // генерируем время
    CGFloat durationTime = (float)((arc4random() % 20001) / 10000 + 2) / self.speedSlider.value;   // from 0 to 4s
    
    
    CGAffineTransform scale = CGAffineTransformMakeScale(scaleView, scaleView);
    CGAffineTransform rotation = CGAffineTransformMakeRotation(rotationView);
    CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
    
    [UIImageView animateWithDuration:durationTime
                               delay:0.f
                             options:UIViewAnimationOptionCurveLinear
                          animations:^{
                              if (self.rotateSwitch.isOn == YES) {
                                  self.mainPersonImage.transform = rotation;
                              }
                              if (self.scaleSwitch.isOn == YES) {
                                  self.mainPersonImage.transform = scale;
                              }
                              if (self.transitionSwitch.isOn == YES) {
                                  self.mainPersonImage.center = CGPointMake(randomX, randomY);
                              }
                              if (self.rotateSwitch.isOn && self.scaleSwitch.isOn) {
                                  self.mainPersonImage.transform = transform;
                              }
                          } completion:^(BOOL finished) {
                              [self animation:sender];
                          }];
}

@end
