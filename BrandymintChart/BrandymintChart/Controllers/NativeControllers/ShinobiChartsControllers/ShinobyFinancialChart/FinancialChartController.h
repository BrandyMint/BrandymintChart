//
//  FinancialChartController.h
//  BrandymintChart
//
//  Created by DenisDbv on 29.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "CardViewController.h"
#import <ShinobiCharts/ShinobiChart.h>
#import "AppleStockData.h"
#import "Datasource4.h"

@interface FinancialChartController : CardViewController
{
    ShinobiChart *financialChart;
    AppleStockData *appleStockData;
    Datasource4 *datasource;
    NSNumberFormatter *n;
}

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UIView *controlView;

@end
