
#import <Foundation/Foundation.h>

#import "DTCComparableObjectItem.h"
#import "DTCRegularTimePeriod.h"

@interface DTCOHLCItem : DTCComparableObjectItem {
}

- (id) initWithPeriod: (DTCRegularTimePeriod *) aPeriod
				 open: (double) anOpen
				 high: (double) aHigh
				  low: (double) aLow
				close: (double) aClose;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (DTCRegularTimePeriod *) getPeriod;

- (double) getYValue;

- (double) getOpenValue;

- (double) getHighValue;

- (double) getLowValue;

- (double) getCloseValue;

@end
