
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCSeries.h"
#import "DTCRegularTimePeriod.h"
#import "DTCTimeSeriesDataItem.h"

@interface DTCTimeSeries : DTCSeries {
@public
	//	The list of data items in the series
	NSMutableArray *data;
	//	The type of period for the data
	Class timePeriodClass;
	//	Flag to indicate if the type of period for the date is set
	BOOL timePeriodClassFlag;
	
@private
	//	A description of the domain
	NSString *domain;
	//	A description of the range
	NSString *range;
	//	The maximum number of items for the series
	int maximumItemCount;
	//	The maximum age of items for the series, specified as a number of time periods
	long long maximumItemAge;
}

- (id) initWithName: (id <DTCIComparable>) aName;

- (id) initWithName: (id <DTCIComparable>) aName domain: (NSString *) aDomain range: (NSString *) aRange;

- (id) initWithName: (id <DTCIComparable>) aName timePeriodClass: (Class) aClassType;

- (id) initWithName: (id <DTCIComparable>) aName domain: (NSString *) aDomain range: (NSString *) aRange timePeriodClass: (Class) aClassType;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
/*
 public String getDomainDescription() {
 return this.domain;
 }
 public void setDomainDescription(String description) {
 String old = this.domain;
 this.domain = description;
 firePropertyChange("Domain", old, description);
 }
 
 public String getRangeDescription() {
 return this.range;
 }
 public void setRangeDescription(String description) {
 String old = this.range;
 this.range = description;
 firePropertyChange("Range", old, description);
 }*/
 
//	Override method for DTCSeries
//- (int) getItemCount;

/*
 public List getItems() {
 return Collections.unmodifiableList(this.data);
 }
 
 public int getMaximumItemCount() {
 return this.maximumItemCount;
 }
 public void setMaximumItemCount(int maximum) {
 if (maximum < 0) {
 throw new IllegalArgumentException("Negative 'maximum' argument.");
 }
 this.maximumItemCount = maximum;
 int count = this.data.size();
 if (count > maximum) {
 delete(0, count - maximum - 1);
 }
 }
 
 public long getMaximumItemAge() {
 return this.maximumItemAge;
 }
 public void setMaximumItemAge(long periods) {
 if (periods < 0) {
 throw new IllegalArgumentException("Negative 'periods' argument.");
 }
 this.maximumItemAge = periods;
 removeAgedItems(true);  // remove old items and notify if necessary
 }*/
 
- (Class) getTimePeriodClass;

- (DTCTimeSeriesDataItem *) getDataItemWithIndex: (int) anIndex;

- (DTCTimeSeriesDataItem *) getDataItemWithPeriod: (DTCRegularTimePeriod *) aPeriod;
 
- (DTCRegularTimePeriod *) getTimePeriodWithIndex: (int) anIndex;

- (DTCRegularTimePeriod *) getNextTimePeriod;

- (NSMutableArray *) getTimePeriods;

/*
 *	Returns a collection of time periods in the specified series, but not in this series, and therefore unique to the specified series.
 */
- (NSMutableArray *) getTimePeriodsUniqueToOtherSeries: (DTCTimeSeries *) aSeries;

/*
 *	Returns the index for the item (if any) that corresponds to a time period.
 */
- (int) getIndexWithPeriod: (DTCRegularTimePeriod *) aPeriod;

/*
 *	Returns the value at the specified index.
 */
- (NSNumber *) getValueWithIndex: (int) anIndex;

/*
 *	Returns the value for a time period. If there is no data item with the specified period, this method will return null.
 */
- (NSNumber *) getValueWithPeriod: (DTCRegularTimePeriod *) aPeriod;

/*
 *	Adds a new data item to the series and sends a SeriesChangeEvent to all registered listeners.
 */
- (void) addWithPeriod: (DTCRegularTimePeriod *) aPeriod doubleValue: (double) aValue;

/*
 *	Adds a new data item to the series and sends a SeriesChangeEvent to all registered listeners.
 */
- (void) addWithPeriod: (DTCRegularTimePeriod *) aPeriod value: (NSNumber *) aValue;

/*
 *	Adds a data item to the series and sends a SeriesChangeEvent to all registered listeners.
 */
- (void) add: (DTCTimeSeriesDataItem *) anItem;

/*
 *	Updates (changes) the value for a time period. Throws a SeriesException if the period does not exist.
 */
- (void) updateWithPeriod: (DTCRegularTimePeriod *) aPeriod value: (NSNumber *) aValue;

/*
 *	Updates (changes) the value of a data item.
 */
- (void) updateWithIndex: (int) anIndex value: (NSNumber *) aValue;

/*
 *	Adds or updates data from one series to another. Returns another series containing the values that were overwritten.
 */
- (DTCTimeSeries *) addAndOrUpdate: (DTCTimeSeries *) aSeries;

/*
 *	Adds or updates an item in the times series and sends a SeriesChangeEvent to all registered listeners.
 */
- (DTCTimeSeriesDataItem *) addOrUpdateWithPeriod: (DTCRegularTimePeriod *) aPeriod doubleValue: (double) aValue;

/*
 *	Adds or updates an item in the times series and sends a SeriesChangeEvent to all registered listeners.
 */
- (DTCTimeSeriesDataItem *) addOrUpdateWithPeriod: (DTCRegularTimePeriod *) aPeriod value: (NSNumber *) aValue;

/*
 *	Age items in the series. Ensure that the timespan from the youngest to the oldest record in the series does not exceed
 *	maximumItemAge time periods. Oldest items will be removed if required.
 */
- (void) removeAgedItems;

/*
 *	Age items in the series. Ensure that the timespan from the supplied time to the oldest record in the series does not
 *	exceed history count. oldest items will be removed if required.
 */
- (void) removeAgedItemsWithLatest: (long long) aLatest;

/*
 *	Removes all data items from the series and sends a SeriesChangeEvent to all registered listeners.
 */
- (void) clear;

/*
 *	Deletes the data item for the given time period and sends a SeriesChangeEvent to all registered listeners.
 *	If there is no item with the specified time period, this method does nothing.
 */
- (void) delete: (DTCRegularTimePeriod *) aPeriod;

/*
 *	Deletes data from start until end index (end inclusive).
 */
- (void) deleteFrom: (int) aStart to: (int) anEnd;

@end
