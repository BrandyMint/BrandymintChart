//
//  ShinobyBarChartController.h
//  BrandymintChart
//
//  Created by DenisDbv on 29.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "CardViewController.h"
#import <ShinobiCharts/ShinobiChart.h>
#import "Datasource2.h"
#import "TopTenCountriesAreaData.h"

@interface ShinobyBarChartController : CardViewController <SChartDelegate>
{
    ShinobiChart *barChart;
    Datasource2 *dataSource;
    TopTenCountriesAreaData *topTenCountriesAreaData;
}

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UIView *controlView;

@end
