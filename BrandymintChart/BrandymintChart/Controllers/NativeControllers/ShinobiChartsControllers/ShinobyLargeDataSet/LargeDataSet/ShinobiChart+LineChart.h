//
//  ShinobiChart+LineChart.h
//  LargeDataSet

#import <ShinobiCharts/ShinobiChart.h>

@interface ShinobiChart (LineChart)

//Create a chart object with lines for displaying decimal places of pi
+ (ShinobiChart*)lineChartWithFrame:(CGRect)frame;

//Return an appropriate series for the type of data
- (SChartSeries*)seriesForKey:(NSString*)key;

@end
