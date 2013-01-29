//
//  ShinobiChart+BarChart.h
//  BarChart

#import <ShinobiCharts/ShinobiChart.h>

@interface ShinobiChart (BarChart)

//Create a chart object with bars for displaying area and country data
+ (ShinobiChart*)barChartForCountryByAreaWithFrame:(CGRect)frame;

//Return an appropraite series for the type of data
- (SChartSeries*)barSeriesForKey:(NSString*)key;

@end
