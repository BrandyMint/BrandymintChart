
#import <Foundation/Foundation.h>

@class DTCRange;

@protocol DTCIRangeInfo

- (double) getRangeLowerBound: (BOOL) isIncludeInterval;

- (double) getRangeUpperBound: (BOOL) isIncludeInterval;

- (DTCRange *) getRangeBounds: (BOOL) isIncludeInterval;

@end

