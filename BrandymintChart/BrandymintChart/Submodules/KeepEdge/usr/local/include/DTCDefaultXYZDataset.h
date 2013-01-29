
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCIXYZDataset.h"
#import "DTCAbstractXYZDataset.h"
#import "DTCDomainOrder.h"

@interface DTCDefaultXYZDataset : DTCAbstractXYZDataset <DTCIXYZDataset> {
@private
	NSMutableArray *seriesKeys;
	NSMutableArray *seriesList;
}

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (int) getSeriesCount;

- (id <DTCIComparable>) getSeriesKeyWithSeries: (int) aSeries;

/*
 *	Returns the index of the series with the specified key, or -1 if there is no such series in the dataset.
 */
- (int) indexOf: (id <DTCIComparable>) aSeriesKey;

/*
 *	Returns the order of the domain (x-) values in the dataset.
 */
- (DTCDomainOrder *) getDomainOrder;

- (int) getItemCountWithSeries: (int) aSeries;

//	Implementation of protocol DTCIXYDataset
//- (double) getXValueWithSeries: (int) aSeries item: (int) anItem;

//	Implementation of protocol DTCIXYDataset
//- (NSNumber *) getXWithSeries: (int) aSeries item: (int) anItem;

//	Implementation of protocol DTCIXYDataset
//- (double) getYValueWithSeries: (int) aSeries item: (int) anItem;

//	Implementation of protocol DTCIXYDataset
//- (NSNumber *) getYWithSeries: (int) aSeries item: (int) anItem;

//	Implementation of protocol DTCIXYZDataset
//- (double) getZValueWithSeries: (int) aSeries item: (int) anItem;

//	Implementation of protocol DTCIXYZDataset
//- (NSNumber *) getZWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Adds a series or if a series with the same key already exists replaces the data for that series
 */
- (void) addSeriesWithKey: (id <DTCIComparable>) aSeriesKey data: (NSMutableArray *) aData;

/*
 *	Removes a series from the dataset
 */
- (void) removeSeriesWithKey: (id <DTCIComparable>) aSeriesKey;

@end
