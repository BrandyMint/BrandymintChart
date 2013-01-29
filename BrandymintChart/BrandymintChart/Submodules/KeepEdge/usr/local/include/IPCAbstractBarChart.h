
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "IPCAbstractCategoryChart.h"

@interface IPCAbstractBarChart : IPCAbstractCategoryChart {
}

//	inner method
//- (void) updateChartProperties;	//	override method
- (void) updateFullStackedChartProperties;
//- (void) applyRenderSettingsWithRender: (id) aRenderer plot: (id) aPlot;	//	override method
- (NSString *) getTitleNonNull;

@end
