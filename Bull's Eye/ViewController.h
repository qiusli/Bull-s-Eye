//
//  ViewController.h
//  Bull's Eye
//
//  Created by Qiushi Li on 5/13/15.
//  Copyright (c) 2015 Razeware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>

@property (nonatomic, weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *targetLabel;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *roundLabel;

-(IBAction)showAlert;
-(IBAction)sliderMoved:(UISlider *)slider;
-(IBAction)startOver;
@end

