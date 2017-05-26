//
//  ViewController.h
//  18_HW_Controls
//
//  Created by Slava on 24.05.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *viewField;

@property (weak, nonatomic) IBOutlet UIImageView *mainPersonImage;

@property (weak, nonatomic) IBOutlet UISegmentedControl *choisePerson;

@property (weak, nonatomic) IBOutlet UISwitch *rotateSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *scaleSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *transitionSwitch;

@property (weak, nonatomic) IBOutlet UISlider *speedSlider;


- (IBAction)chosePerson:(UISegmentedControl *)sender;

- (IBAction)animation:(UISwitch *)sender;


@end

