
#import <Foundation/Foundation.h>

#import "DTCIDomainInfo.h"
#import "DTCAbstractIntervalXYDataset.h"
#import "DTCTimePeriodAnchor.h"
#import "DTCRange.h"
#import "DTCTimeSeries.h"

@interface DTCTimeSeriesCollection : DTCAbstractIntervalXYDataset <DTCIDomainInfo> {
@private
	//	Storage for the time series
	NSMutableArray *data;
	//	A working calendar (to recycle)
	NSCalendar *workingCalendar;
	//	The point within each time period that is used for the X value when this collection is used as an DTCXYDataset.
	//	This can be the start, middle or end of the time period.
	DTCTimePeriodAnchor *xPosition;
	//	A flag that indicates that the domain is 'points in time'. If this flag is true, only the x-value is used to determine
	//	the range of values in the domain, the start and end x-values are ignored.
	BOOL domainIsPointsInTime;
}

- (id) initWithTimeZone: (NSTimeZone *) aTimeZone;

- (id) initWithSeries: (DTCTimeSeries *) aSeries;

- (id) initWithSeries: (DTCTimeSeries *) aSeries timeZone: (NSTimeZone *) aTimeZone;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (BOOL) getDomainIsPointsInTime;
- (void) setDomainIsPointsInTime: (BOOL) aFlag;

- (DTCTimePeriodAnchor *) getXPosition;
- (void) setXPosition: (DTCTimePeriodAnchor *) anAnchor;
 
- (NSMutableArray *) getSeries;
 
- (int) indexOfTimeSeries: (DTCTimeSeries *) aSeries;
 
- (DTCTimeSeries *) getSeriesWithIndex: (int) anIndex;
 
- (DTCTimeSeries *) getSeriesWithKey: (id) aKey;

/*
 *	Adds a series to the collection and sends a DatasetChangeEvent to all registered listeners.
 */
- (void) addSeries: (DTCTimeSeries *) aSeries;
  
/*
 *	Removes the specified series from the collection.
 */
- (void) removeSeries: (DTCTimeSeries *) aSeries;

/*
 *	Removes a series from the collection.
 */
- (void) removeSeriesWithIndex: (int) anIndex;
	
/*
 *	Removes all the series from the collection.
 */
- (void) removeAllSeries;
	 
/*
 *	Returns the number of items in the specified series. This method is provided for convenience.
 */
- (int) getItemCountWithSeries: (int) aSeries;
		
/*
 *	Returns the x-value for a time period.
 */
- (long long) getXWithPeriod: (DTCRegularTimePeriod *) aPeriod;

/*
 *	Returns the indices of the two data items surrounding a particular millisecond value.
 */
//- (NSMutableArray *) getSurroundingItemsWithSeries: (int) aSeries millisecond: (long long) aMilliseconds

/*
 *	Returns the range of the values in this dataset's domain.
 */
- (DTCRange *) getDomainBounds: (BOOL) isIncludeInterval;

@end
