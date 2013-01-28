//
//  PieChartController.h
//  BrandymintChart
//
//  Created by denisdbv@gmail.com on 28.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardViewController.h"
#import "XYPieChart.h"

@interface PieChartController : CardViewController <XYPieChartDelegate, XYPieChartDataSource>

@property (strong, nonatomic) IBOutlet XYPieChart *pieChartLeft;
@property (strong, nonatomic) IBOutlet UILabel *percentageLabel;
@property(nonatomic, strong) NSMutableArray *slices;
@property(nonatomic, strong) NSArray        *sliceColors;

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UIView *controlView;

- (IBAction)addSliceBtnClicked:(id)sender;
- (IBAction)clearSlices;

@end
