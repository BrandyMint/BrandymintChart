//
//  Datasource.m
//  FinancialChart
//
//  Created by Stuart Grey on 23/09/2012.
//  Copyright (c) 2012 Stuart Grey. All rights reserved.
//

#import "Datasource4.h"
#import "ShinobiChart+CandlestickChart.h"

@implementation Datasource4

- (id)init {
    self = [super init];
    if (self) {
        numberFormatter = [NSNumberFormatter new];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"dd/MM/yy";
    }
    return self;
}

//Implement methods for the SChartDatasource protocol...

- (int)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return 3;
}

- (SChartSeries*)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
    
    SChartSeries *series;
    
    switch (index) {
        case 0:
            series = [chart seriesForKey:@"volume"];
            break;
        case 1:
            series = [chart seriesForKey:@"band"];
            break;
        case 2:
            series = [chart seriesForKey:@"stock"];
            break;
        default:
            break;
    }
    return series;
}

- (int)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex {
    return [_stockData data].count;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    SChartMultiYDataPoint *multiDP = [SChartMultiYDataPoint new];
    SChartDataPoint *dp = [SChartDataPoint new];
    
    //Map our dat for our chart
    NSArray *p = [[_stockData data] objectAtIndex:dataIndex];
    
    multiDP.xValue = [dateFormatter dateFromString:[p objectAtIndex:0]];
    dp.xValue = [dateFormatter dateFromString:[p objectAtIndex:0]];
    
    if (seriesIndex == 0) {
        NSNumber *vol = [numberFormatter numberFromString:[p objectAtIndex:5]];
        dp.yValue = [NSNumber numberWithFloat:vol.floatValue / 1000000.f];
        return dp;
    } else if (seriesIndex == 1) {
        [multiDP.yValues setValue:[p objectAtIndex:10] forKey:@"High"];
        [multiDP.yValues setValue:[p objectAtIndex:11] forKey:@"Low"];
        return multiDP;
    } else if (seriesIndex == 2) {
        [multiDP.yValues setValue:[numberFormatter numberFromString:[p objectAtIndex:1]] forKey:@"Open"];
        [multiDP.yValues setValue:[numberFormatter numberFromString:[p objectAtIndex:2]] forKey:@"High"];
        [multiDP.yValues setValue:[numberFormatter numberFromString:[p objectAtIndex:3]] forKey:@"Low"];
        [multiDP.yValues setValue:[numberFormatter numberFromString:[p objectAtIndex:4]] forKey:@"Close"];
        return multiDP;
    }
    
    return nil;
}

- (SChartAxis*)sChart:(ShinobiChart *)chart yAxisForSeriesAtIndex:(int)index {
    if (index == 0) {
        return [[chart allYAxes] lastObject];
    }
    return chart.yAxis;
}


@end
