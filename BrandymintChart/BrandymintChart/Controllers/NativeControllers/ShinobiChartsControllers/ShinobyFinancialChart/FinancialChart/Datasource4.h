//
//  Datasource.h
//  FinancialChart
//
//  Created by Stuart Grey on 23/09/2012.
//  Copyright (c) 2012 Stuart Grey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "StockData.h"

@interface Datasource4 : NSObject <SChartDatasource> {
    NSNumberFormatter *numberFormatter;
    NSDateFormatter *dateFormatter;
}

@property (nonatomic) id<StockData> stockData;

@end
