//
//  ShinobyAreaController.h
//  BrandymintChart
//
//  Created by DenisDbv on 29.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "CardViewController.h"
#import <ShinobiCharts/ShinobiChart.h>
#import "Datasource.h"
#import "London2012MedalData.h"

@interface ShinobyAreaController : CardViewController
{
    ShinobiChart *areaChart;
    Datasource *datasource;
    London2012MedalData *londonMedalData;
}

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UIView *controlView;

@end
