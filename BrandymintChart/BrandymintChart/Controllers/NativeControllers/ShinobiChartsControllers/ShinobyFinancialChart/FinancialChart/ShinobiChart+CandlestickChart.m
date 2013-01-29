//
//  ShinobiChart+CandlestickChart.m
//  FinancialChart
//
//  Created by Stuart Grey on 23/09/2012.
//  Copyright (c) 2012 Stuart Grey. All rights reserved.
//

#import "ShinobiChart+CandlestickChart.h"

@implementation ShinobiChart (CandlestickChart)

+(ShinobiChart*)candlestickChartForStockData:(CGRect)frame {
    
    ShinobiChart *chart = [[ShinobiChart alloc] initWithFrame:frame];
    chart.autoresizingMask = ~UIViewAutoresizingNone;
    
    //Use the dark theme
    SChartDarkTheme *theme = [SChartDarkTheme new];
    chart.theme = theme;
    
    //Double tap can either reset zoom or zoom in
    chart.gestureDoubleTapResetsZoom = YES;
    
    //Setup Datetime x-axis to illustrate stock price over time
    SChartDateTimeAxis *xAxis = [[SChartDateTimeAxis alloc] init];
    xAxis.enableGesturePanning = YES;
    xAxis.enableGestureZooming = YES;
    xAxis.enableMomentumPanning = YES;
    xAxis.enableMomentumZooming = YES;
    xAxis.rangePaddingHigh = [SChartDateFrequency dateFrequencyWithDay:5];
    xAxis.title = @"Date";
    chart.xAxis = xAxis;
    
    //Setup left y-axis for stock price in dollars
    SChartNumberRange *r = [[SChartNumberRange alloc] initWithMinimum:[NSNumber numberWithInt:300] andMaximum:[NSNumber numberWithInt:800]];
    SChartNumberAxis *yAxis = [[SChartNumberAxis alloc] initWithRange:r];
    chart.yAxis = yAxis;
    yAxis.style.titleStyle.titleOrientation = SChartAxisTitleOrientationHorizontal;
    yAxis.enableGesturePanning = YES;
    yAxis.enableGestureZooming = YES;
    yAxis.enableMomentumPanning = YES;
    yAxis.enableMomentumZooming = YES;
    yAxis.labelFormatter.numberFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
    yAxis.labelFormatter.numberFormatter.currencySymbol = @"$";
    yAxis.title = @"Price";
    
    //Setup right y-axis for volume
    SChartNumberAxis *volAxis = [SChartNumberAxis new];
    volAxis.axisPosition = SChartAxisPositionReverse;
    volAxis.labelFormatString = @"%.0fM";
    volAxis.style.majorTickStyle.labelColor = [UIColor colorWithWhite:0.4f alpha:1.f];
    [chart addYAxis:volAxis];
    
    return chart;
}

- (SChartSeries*)seriesForKey:(NSString*)key {
    SChartSeries *series;
    
    //Return appropriate series for each key
    if ([key isEqualToString:@"band"]) {
        SChartBandSeries *b = [SChartBandSeries new];
        b.style = [self.theme bandSeriesStyleForSeriesAtIndex:0 selected:NO];
        series = b;
        
    } else if ([key isEqualToString:@"stock"]) {
        series = [SChartCandlestickSeries new];
        
    } else if ([key isEqualToString:@"volume"]) {
        SChartColumnSeries *c = [SChartColumnSeries new];
        c.style.lineColor = [UIColor clearColor];
        c.style.areaColor = [UIColor colorWithWhite:0.4f alpha:1.f];
        c.style.areaColorGradient = [UIColor colorWithWhite:0.4f alpha:1.f];
        series = c;
    }
    return series;
}

@end
