
#import <Foundation/Foundation.h>

#import "DTCITableXYDataset.h"
#import "DTCIIntervalXYDataset.h"
#import "DTCIDomainInfo.h"
#import "DTCAbstractIntervalXYDataset.h"
#import "DTCIntervalXYDelegate.h"
#import "DTCXYSeries.h"

@interface DTCDefaultTableXYDataset : DTCAbstractIntervalXYDataset <DTCITableXYDataset, DTCIIntervalXYDataset, DTCIDomainInfo> {
@private
	NSMutableArray *data;
	
	/** Storage for the x values. */
	NSMutableArray *xPoints;
	
	BOOL propagateEvents;// = true;
	
	BOOL autoPrune;// = false;
	
	DTCIntervalXYDelegate *intervalDelegate;
}

- (id) initWithAutoPrune: (BOOL) isAutoPrune;

- (BOOL) isAutoPrune;

/*
 *	Adds a series to the collection and sends a DatasetChangeEvent to all registered listeners. 
 */
- (void) addSeries: (DTCXYSeries *) aSeries;

/*
 * Updates the x-values for all the series in the dataset.
 */
- (void) updateXPoints;

- (int) getSeriesCount;

- (int) getItemCount;

- (DTCXYSeries *) getSeriesWithSeries: (int) aSeries;

//	Implementation of protocol DTCISeriesDataset
- (id <DTCIComparable>) getSeriesKeyWithSeries: (int) aSeries;

//	Implementation of protocol DTCIXYDataset
- (int) getItemCountWithSeries: (int) aSeries;

- (NSNumber *) getXWithSeries: (int) aSeries item: (int) anItem;

- (NSNumber *) getStartXWithSeries: (int) aSeries item: (int) anItem;

- (NSNumber *) getEndXWithSeries: (int) aSeries item: (int) anItem;

- (NSNumber *) getYWithSeries: (int) aSeries item: (int) anItem;

- (NSNumber *) getStartYWithSeries: (int) aSeries item: (int) anItem;

- (NSNumber *) getEndYWithSeries: (int) aSeries item: (int) anItem;

@end
