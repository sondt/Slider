//
//  ViewController.m
//  Slider
//
//  Created by sondt-mac on 3/31/13.
//  Copyright (c) 2013 sondt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)valueChange:(id)sender {
    [self updateLabel: self.slider.value];
    float temp=0;
    temp = [self xPositionFromSliderValue:self.slider]-20;
    self.label.frame = CGRectMake(temp, self.label.frame.origin.y, self.label.frame.size.width, self.label.frame.size.height);
    self.img.frame = CGRectMake( temp-40, self.img.frame.origin.y, self.img.frame.size.width, self.img.frame.size.height);
   
    //NSLog(@"value:%0.2f", [self xPositionFromSliderValue:self.slider]);
}
- (float)xPositionFromSliderValue:(UISlider *)aSlider;
{
    float sliderRange = aSlider.frame.size.width - aSlider.currentThumbImage.size.width;
    float sliderOrigin = aSlider.frame.origin.x + (aSlider.currentThumbImage.size.width / 2.0);
    float sliderValueToPixels = (((aSlider.value - aSlider.minimumValue) / (aSlider.maximumValue - aSlider.minimumValue)) * sliderRange) + sliderOrigin;    
    return sliderValueToPixels;
}
-(void) updateLabel: (double) value{
    self.label.text = [NSString stringWithFormat:@"%0.2f",value ];
}

@end
