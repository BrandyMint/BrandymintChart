
#import <Foundation/Foundation.h>

@class DTCRange;

@protocol DTCIDomainInfo

- (double) getDomainLowerBound: (BOOL) isIncludeInterval;

- (double) getDomainUpperBound: (BOOL) isIncludeInterval;

- (DTCRange *) getDomainBounds: (BOOL) isIncludeInterval;

@end
