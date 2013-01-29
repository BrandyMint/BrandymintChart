
#import <Foundation/Foundation.h>

#import "DTCIIntervalXYDataset.h"
#import "DTCIDomainInfo.h"
#import "DTCIRangeInfo.h"
#import "DTCAbstractIntervalXYDataset.h"
#import "DTCXYSeries.h"
#import "DTCIntervalXYDelegate.h"

@interface DTCXYSeriesCollection : DTCAbstractIntervalXYDataset <DTCIDomainInfo, DTCIRangeInfo> {
@private
	//	The series that are included in the collection
	NSMutableArray *data;
	//	The interval delegate (used to calculate the start and end x-values)
	DTCIntervalXYDelegate *intervalDelegate;
}

- (id) initWithXYSeries: (DTCXYSeries *) aSeries;

/*
 *	Returns the order of the domain (X) values, if this is known.
 */
//	Implementation of protocol DTCIXYDataset
//- (DTCDomainOrder *) getDomainOrder;

/*
 *	Adds a series to the collection and sends a DatasetChangeEvent to all registered listeners.
 */
- (void) addSeries: (DTCXYSeries *) aSeries;

/*
 *	Removes a series from the collection and sends a DatasetChangeEvent to all registered listeners.
 */
- (void) removeSeriesWithIndex: (int) anIndex;

/*
 *	Removes a series from the collection and sends a DatasetChangeEvent to all registered listeners.
 */
- (void) removeSeries: (DTCXYSeries *) aSeries;

/*
 *	Removes all the series from the collection and sends a DatasetChangeEvent to all registered listeners.
 */
- (void) removeAllSeries;

/*
 *	Returns the number of series in the collection.
 */
//	Override method for DTCAbstractSeriesDataset
//- (int) getSeriesCount;

/*
 *	Returns a list of all the series in the collection.
 */
- (NSMutableArray *) getSeries;

/*
 *	Returns the index of the specified series, or -1 if that series is not present in the dataset.
 */
- (int) indexOfXYSeries: (DTCXYSeries *) aSeries;

/*
 *	Returns a series from the collection.
 */
- (DTCXYSeries *) getSeriesWithIndex: (int) anIndex;

/*
 *	Returns a series from the collection.
 */
- (DTCXYSeries *) getSeriesWithKey: (id) aKey;

/*
 *	Returns the key for a series.
 */
//	Implementation of protocol DTCISeriesDataset
//- (id) getSeriesKeyWithSeries: (int) aSeries;

/*
 *	Returns the number of items in the specified series.
 */
//	Implementation of protocol DTCIXYDataset
//- (int) getItemCountWithSeries: (int) aSeries;

/*
 *	Returns the x-value for the specified series and item.
 */
//	Implementation of protocol DTCIXYDataset
//- (NSNumber *) getXWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the starting X value for the specified series and item.
 */
//	Implementation of protocol DTCIIntervalXYDataset
//- (NSNumber *) getStartXWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the ending X value for the specified series and item.
 */
//	Implementation of protocol DTCIIntervalXYDataset
//- (NSNumber *) getEndXWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the y-value for the specified series and item.
 */
//	Implementation of protocol DTCIXYDataset
//- (NSNumber *) getYWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the starting Y value for the specified series and item.
 */
//	Implementation of protocol DTCIIntervalXYDataset
//- (NSNumber *) getStartYWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the ending Y value for the specified series and item.
 */
//	Implementation of protocol DTCIIntervalXYDataset
//- (NSNumber *) getEndYWithSeries: (int) aSeries item: (int) anItem;;

/*
 *	Returns the minimum x-value in the dataset.
 */
//	Implementation of protocol DTCIDomainInfo
//- (double) getDomainLowerBound: (BOOL) isIncludeInterval;

/*
 *	Returns the maximum x-value in the dataset.
 */
//	Implementation of protocol DTCIDomainInfo
//- (double) getDomainUpperBound: (BOOL) isIncludeInterval;

/*
 *	Returns the range of the values in this dataset's domain.
 */
//	Implementation of protocol DTCIDomainInfo
//- (DTCRange *) getDomainBounds: (BOOL) isIncludeInterval;

- (double) getIntervalWidth;
- (void) setIntervalWidth: (double) aWidth;

- (double) getIntervalPositionFactor;
- (void) setIntervalPositionFactor: (double) aFactor;

- (BOOL) isAutoWidth;
- (void) setAutoWidth: (BOOL) aFlag;

/*
 *	Returns the range of the values in this dataset's range.
 */
//	Implementation of protocol DTCIRangeInfo
//- (DTCRange *) getRangeBounds: (BOOL) isIncludeInterval;

/*
 *	Returns the minimum y-value in the dataset.
 */
//	Implementation of protocol DTCIRangeInfo
//- (double) getRangeLowerBound: (BOOL) isIncludeInterval;

/*
 *	Returns the maximum y-value in the dataset.
 */
//	Implementation of protocol DTCIRangeInfo
//- (double) getRangeUpperBound: (BOOL) isIncludeInterval;

@end
