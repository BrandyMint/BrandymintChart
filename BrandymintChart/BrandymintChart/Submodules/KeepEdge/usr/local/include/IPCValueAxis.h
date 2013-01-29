
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "IPCAbstractAxis.h"

@interface IPCValueAxis : IPCAbstractAxis {
@private
	// scale
	BOOL autoRange;
	double lower;
	double upper;
	double majorUnit;
	
	NSNumberFormatter *axisDataFormat;
}

- (BOOL) isAutoRange;
- (void) setAutoRange: (BOOL) isAutoRange;

- (double) getLower;
- (void) setLower: (double) aLower;

- (double) getUpper;
- (void) setUpper: (double) aUpper;

- (double) getMajorUnit;
- (void) setMajorUnit: (double) aMajorUnit;

- (NSNumberFormatter *) getAxisDataFormat;
- (void) setAxisDataFormat: (NSNumberFormatter *) anAxisDataFormat;

@end
