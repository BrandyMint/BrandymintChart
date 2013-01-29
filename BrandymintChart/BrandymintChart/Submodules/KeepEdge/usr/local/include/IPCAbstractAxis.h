
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "IPCGlobal.h"

@interface IPCAbstractAxis : NSObject {
@private
	// title
	NSString *title;
	UIColor *titleColor;
	UIFont *titleFont;
	
	// Patterns
	BOOL showAxisLine;
	UIColor *axisLineColor;
	int axisLineWeight;
	
	BOOL showMajorGridLines;
	UIColor *majorGridLineColor;
	int majorGridLineWeight;
	
	// tick marks
	BOOL showMajorTickMark;
	UIColor *majorTickMarkColor;
	
	// tick labels
	BOOL showTickLabels;
	UIColor *tickLabelsColor;
	UIFont *tickLabelsFont;
	
	// location
	IPCAxisPlacement axisPlacement;
}

- (NSString *) getTitle;
- (void) setTitle: (NSString *) aTitle;

- (UIColor *) getTitleColor;
- (void) setTitleColor: (UIColor *) aColor;

- (UIFont *) getTitleFont;
- (void) setTitleFont: (UIFont *) aFont;

- (BOOL) isShowAxisLine;
- (void) setShowAxisLine: (BOOL) isShowAxisLine;

- (UIColor *) getAxisLineColor;
- (void) setAxisLineColor: (UIColor *) aColor;

- (int) getAxisLineWeight;
- (void) setAxisLineWeight: (int) anAxisLineWeight;

- (BOOL) isShowMajorGridLines;
- (void) setShowMajorGridLines: (BOOL) isShowMajorGridLines;

- (UIColor *) getMajorGridLineColor;
- (void) setMajorGridLineColor: (UIColor *) aColor;

- (int) getMajorGridLineWeight;
- (void) setMajorGridLineWeight: (int) aMajorGridLineWeight;

- (BOOL) isShowMajorTickMark;
- (void) setShowMajorTickMark: (BOOL) isShowMajorTickMark;

- (UIColor *) getMajorTickMarkColor;
- (void) setMajorTickMarkColor: (UIColor *) aColor;

- (BOOL) isShowTickLabels;
- (void) setShowTickLabels: (BOOL) isShowTickLabels;

- (UIColor *) getTickLabelsColor;
- (void) setTickLabelsColor: (UIColor *) aColor;

- (UIFont *) getTickLabelsFont;
- (void) setTickLabelsFont: (UIFont *) aFont;

- (IPCAxisPlacement) getAxisPlacement;
- (void) setAxisPlacement: (IPCAxisPlacement) anAxisPlacement;

@end
