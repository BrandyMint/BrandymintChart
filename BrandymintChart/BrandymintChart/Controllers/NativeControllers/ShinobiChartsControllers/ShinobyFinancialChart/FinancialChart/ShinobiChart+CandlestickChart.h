//
//  ShinobiChart+CandlestickChart.h
//  FinancialChart
//
//  Created by Stuart Grey on 23/09/2012.
//  Copyright (c) 2012 Stuart Grey. All rights reserved.
//

#import <ShinobiCharts/ShinobiChart.h>

@interface ShinobiChart (CandlestickChart)

//Create a chart object with candlesticks for displaying stock data
+(ShinobiChart*)candlestickChartForStockData:(CGRect)frame;

//Return an appropriate series for the type of data
- (SChartSeries*)seriesForKey:(NSString*)key;


@end
