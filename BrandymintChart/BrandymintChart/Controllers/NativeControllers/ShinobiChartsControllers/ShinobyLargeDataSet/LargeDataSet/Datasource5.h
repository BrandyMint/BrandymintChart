//
//  Datasource.h
//  LargeDataSet

#import <Foundation/Foundation.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "NumberData.h"

@interface Datasource5 : NSObject <SChartDatasource>

@property (nonatomic) id <NumberData> numberData;

@end
