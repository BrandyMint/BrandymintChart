
#import <Foundation/Foundation.h>

#import "DTCIDomainInfo.h"
#import "DTCIXYDataset.h"

@interface DTCIntervalXYDelegate : NSObject <DTCIDomainInfo> {
@private
	//	The dataset to enhance
	id <DTCIXYDataset> dataset;
	//	A flag to indicate whether the width should be calculated automatically
	BOOL autoWidth;
	//	A value between 0.0 and 1.0 that indicates the position of the x-value within the interval
	double intervalPositionFactor;
	//	The fixed interval width (defaults to 1.0)
	double fixedIntervalWidth;
	//	The automatically calculated interval width
	double autoIntervalWidth;
}

- (id) initWithDataset: (id <DTCIXYDataset>) aDataset;

- (id) initWithDataset: (id <DTCIXYDataset>) aDataset autoWidth: (BOOL) aFlag;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (BOOL) isAutoWidth;
- (void) setAutoWidth: (BOOL) aFlag;

- (double) getIntervalPositionFactor;
- (void) setIntervalPositionFactor: (double) aFactor;

- (double) getFixedIntervalWidth;
- (void) setFixedIntervalWidth: (double) aWidth;

- (double) getIntervalWidth;

- (NSNumber *) getStartXWithSereis: (int) aSeries item: (int) anItem;

- (double) getStartXValueWithSeries: (int) aSeries item: (int) anItem;

- (NSNumber *) getEndXWithSeries: (int) aSeries item: (int) anItem;

- (double) getEndXValueWithSeries: (int) aSeries item: (int) anItem;

//	Implementation of protocol DTCIDomainInfo
//- (double) getDomainLowerBound: (BOOL) isIncludeInterval;

//	Implementation of protocol DTCIDomainInfo
//- (double) getDomainUpperBound: (BOOL) isIncludeInterval;

//	Implementation of protocol DTCIDomainInfo
//- (DTCRange *) getDomainBounds: (BOOL) isIncludeInterval;

@end
