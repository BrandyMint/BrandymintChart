
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "IPCAbstractAxis.h"

@interface IPCCategoryAxis : IPCAbstractAxis {
@private
	// Scale
	// number of category between tick marks
	int scaleTickMark;
	// number of category between tick mark labels
	int scaleTickLabel;
	
	// alignment
	// valid values -90 to 90 inclusive
	double tickLabelOrientationDegrees;
}

- (int) getScaleTickMark;
- (void) setScaleTickMark: (int) aScaleTickMark;

- (int) getScaleTickLabel;
- (void) setScaleTickLabel: (int) aScaleTickLabel;

- (double) getTickLabelOrientationDegrees;
- (void) setTickLabelOrientationDegrees: (double) aTickLabelOrientationDegrees;

@end
