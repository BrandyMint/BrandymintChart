
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "IPCGlobal.h"
#import "IPCTitle.h"
#import "IPCLegend.h"
#import "IPCValueAxis.h"
#import "IPCITheme.h"

@interface IPCAbstractChart : NSObject {
@private
	UIColor *backgroundColor;
	
	// to hide title, set title to null or title.setDisplay(false);
	IPCTitle *title;
	NSMutableArray *subTitles;	//	IPCTitle array
	
	// to hide legend, set legend to null or legend.setDisplay(false);
	IPCLegend *legend;
	
	// orientation
	IPCOrientation orientation;
	
	id <IPCITheme> theme;
	
	id chart;
}

- (UIColor *) getBackgroundColor;
- (void) setBackgroundColor: (UIColor *) aColor;

- (IPCTitle *) getTitle;
- (void) setTitle: (IPCTitle *) aTitle;

- (BOOL) displayTitle;

- (NSMutableArray *) getSubTitles;
- (void) setSubTitles: (NSMutableArray *) aSubTitles;

- (IPCLegend *) getLegend;
- (void) setLegend: (IPCLegend *) aLegend;

- (BOOL) displayLegend;

- (IPCOrientation) getOrientation;
- (void) setOrientation: (IPCOrientation) anOrientation;

- (id <IPCITheme>) getTheme;
- (void) setTheme: (id <IPCITheme>) aTheme;

//	inner methods
- (void) updateChartProperties;
- (id) getChart;
- (void) setChart: (id) aChart;
- (void) updateValueAxisBasicSettingsWithAxis: (id) anAxis valueAxis: (IPCValueAxis *) aValueAxis;

@end
