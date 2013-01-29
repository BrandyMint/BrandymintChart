//
//  ShinobiChart+columnChart.h
//  ColumnChart

#import <ShinobiCharts/ShinobiChart.h>

@interface ShinobiChart (columnChart)

+ (ShinobiChart*)columnChartForWeatherWithFrame:(CGRect)frame;

- (SChartSeries*)weatherSeriesForKey:(NSString*)key;

@end
