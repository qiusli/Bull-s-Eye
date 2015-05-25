//
//  ViewController.m
//  Bull's Eye
//
//  Created by Qiushi Li on 5/13/15.
//  Copyright (c) 2015 Razeware. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    int _currentValue;
    int _targetValue;
    int _score;
    int _round;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self startNewGame];
    [self updateLables];
    
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    UIImage *trackLeftImage =
    [[UIImage imageNamed:@"SliderTrackLeft"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)]; [self.slider setMinimumTrackImage:trackLeftImage
                                                                                           forState:UIControlStateNormal];
    UIImage *trackRightImage =
    [[UIImage imageNamed:@"SliderTrackRight"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert {
    int difference = abs(_currentValue - _targetValue);
    int points  = 100 - difference;
    _score += points;
    _round++;
    
    NSString *message = [NSString stringWithFormat:@"You scored %d", points];
    NSString *title;
    if (difference == 0) {
        _score += 100;
        title = @"Perfect!";
    } else if (difference < 5){
        title = @"You almost had it!";
        _score += 50;
    } else if (difference < 10) {
        title = @"Pretty good";
    } else {
        title = @"Not even close...";
    }
    
    UIAlertView *alertVIew = [[UIAlertView alloc]
                              initWithTitle:title
                              message:message delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alertVIew show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    [self startNewRound];
    [self updateLables];
}

- (IBAction)sliderMoved:(UISlider *)slider {
    _currentValue = lroundf(slider.value);
}

-(IBAction)startOver {
    [self startNewGame];
    [self updateLables];
}

- (void) startNewGame {
    _round = 0;
    _score = 0;
    [self startNewRound];
}

- (void) startNewRound {
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = 50;
    self.slider.value = _currentValue;
}

- (void) updateLables {
    _targetLabel.text = [NSString stringWithFormat:@"%d", _targetValue];
    _scoreLabel.text = [NSString stringWithFormat:@"%d", _score];
    _roundLabel.text = [NSString stringWithFormat:@"%d", _round];
}
@end
