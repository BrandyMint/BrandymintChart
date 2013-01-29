//
//  ShinobyColumnChartController.h
//  BrandymintChart
//
//  Created by DenisDbv on 29.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "CardViewController.h"
#import <ShinobiCharts/ShinobiChart.h>
#import "Datasource3.h"
#import "UKWeatherData.h"

@interface ShinobyColumnChartController : CardViewController
{
    ShinobiChart *columnChart;
    Datasource3 *datasource;
    UKWeatherData *ukWeatherData;
}

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UIView *controlView;

@end
