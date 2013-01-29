//
//  PlotWithLineController.h
//  BrandymintChart
//
//  Created by denisdbv@gmail.com on 29.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardViewController.h"
#import "PCPieChart.h"

@interface PlotWithLineController : CardViewController

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UIView *controlView;

@property (strong, nonatomic) IBOutlet UISwitch *switchView;

- (IBAction)showSlicePercentage:(id)sender;

@end
