//
//  Datasource.h
//  Area

#import <Foundation/Foundation.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "MedalData.h"


@interface Datasource : NSObject <SChartDatasource>

@property (nonatomic, assign) id<MedalData> medalData;

@end
