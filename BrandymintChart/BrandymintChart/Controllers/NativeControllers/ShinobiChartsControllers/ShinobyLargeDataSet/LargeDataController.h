//
//  LargeDataController.h
//  BrandymintChart
//
//  Created by DenisDbv on 29.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "CardViewController.h"
#import <ShinobiCharts/ShinobiChart.h>
#import "Datasource5.h"
#import "PiNumberData.h"

@interface LargeDataController : CardViewController
{
    ShinobiChart *piChart;
    Datasource5 *datasource;
    PiNumberData *piNumberData;
}

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UIView *controlView;

@end
