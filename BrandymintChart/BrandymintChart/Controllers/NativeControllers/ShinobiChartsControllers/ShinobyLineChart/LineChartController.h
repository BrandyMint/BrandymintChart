//
//  LineChartController.h
//  BrandymintChart
//
//  Created by DenisDbv on 29.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "CardViewController.h"
#import <ShinobiCharts/ShinobiChart.h>
#import "MobileBrowserUsageStats.h"
#import "Datasource6.h"

@interface LineChartController : CardViewController
{
    ShinobiChart *lineChart;
    Datasource6 *datasource;
    MobileBrowserUsageStats *mobileBrowserUsageStats;
}

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UIView *controlView;

@end
