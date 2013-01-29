
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCSeries.h"
#import "DTCXYDataItem.h"

@interface DTCXYSeries : DTCSeries {
@protected
	//	Storage for the data items in the series
	NSMutableArray *data;
@private
	//	The maximum number of items for the series
	int maximumItemCount;// = Integer.MAX_VALUE;
	//	A flag that controls whether the items are automatically sorted (by x-value ascending).
	BOOL autoSort;
	//	A flag that controls whether or not duplicate x-values are allowed
	BOOL allowDuplicateXValues;
	//	The lowest x-value in the series, excluding Double.NaN values
	double minX;
	//	The highest x-value in the series, excluding Double.NaN values
	double maxX;
	//	The lowest y-value in the series, excluding Double.NaN values
	double minY;
	//	The highest y-value in the series, excluding Double.NaN values
	double maxY;
}

- (id) initWithKey: (id <DTCIComparable>) aKey;

- (id) initWithKey: (id <DTCIComparable>) aKey autoSort: (BOOL) aFlag;

- (id) initWithKey: (id <DTCIComparable>) aKey autoSort: (BOOL) isAuto allowDuplicateXValues: (BOOL) isAllow;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (double) getMinX;

- (double) getMaxX;

- (double) getMinY;

- (double) getMaxY;

- (BOOL) getAutoSort;

- (BOOL) getAllowDuplicateXValues;

//	Override method for DTCSeries
//- (int) getItemCount;

- (NSMutableArray *) getItems;

- (int) getMaximumItemCount;
- (void) setMaximumItemCount: (int) aMaximum;

- (void) addWithXDouble: (double) aXVal yDouble: (double) aYVal;

- (void) addWithXDouble: (double) aXVal yVal: (NSNumber *) aYVal;

- (void) addWithXVal: (NSNumber *) aXVal yVal: (NSNumber *) aYVal;

- (void) add: (DTCXYDataItem *) anItem;

- (void) deleteFrom: (int) aStart to: (int) anEnd;

//	To release the return value
- (DTCXYDataItem *) removeWithIndex: (int) anIndex;

//	To release the return value
- (DTCXYDataItem *) removeWithValue: (NSNumber *) aVal;

- (void) clear;

- (DTCXYDataItem *) getDataItem: (int) anIndex;

- (NSNumber *) getX: (int) anIndex;

- (NSNumber *) getY: (int) anIndex;

/*
 *	Updates the value of an item in the series and sends a SeriesChangeEvent to all registered listeners.
 */
- (void) updateWithIndex: (int) anIndex yVal: (NSNumber *) aYVal;

/*
 *	Updates an item in the series.
 */
- (void) updateWithXVal: (NSNumber *) aXVal yVal: (NSNumber *) aYVal;

/*
 *	Adds or updates an item in the series and sends a SeriesChangeEvent to all registered listeners.
 */
- (DTCXYDataItem *) addOrUpdateWithXDouble: (double) aXVal yDouble: (double) aYVal;

/*
 *	Adds or updates an item in the series and sends a SeriesChangeEvent to all registered listeners.
 */
- (DTCXYDataItem *) addOrUpdateWithXVal: (NSNumber *) aXVal yVal: (NSNumber *) aYVal;

/*
 *	Returns the index of the item with the specified x-value, or a negative index if the series does not contain an item with
 *	that x-value. Be aware that for an unsorted series, the index is found by iterating through all items in the series.
 */
- (int) indexOfNumber: (NSNumber *) aXVal;

@end
