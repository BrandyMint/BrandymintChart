
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCSeries.h"
#import "DTCComparableObjectItem.h"

@interface DTCComparableObjectSeries : DTCSeries {
@private
	NSMutableArray *data;
	int maximumItemCount;
	BOOL autoSort;
	BOOL allowDuplicateXValues;
}

- (id) initWithKey: (id <DTCIComparable>) aKey;

- (id) initWithKey: (id <DTCIComparable>) aKey autoSort: (BOOL) isAutoSort allowDuplicateXValues: (BOOL) isAllow;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (BOOL) getAutoSort;

- (BOOL) getAllowDuplicateXValues;

- (int) getItemCount;

- (int) getMaximumItemCount;
- (void) setMaximumItemCount: (int) aMaximum;

/*
 *	Adds new data to the series.
 *	Throws an exception if the x-value is a duplicate AND the allowDuplicateXValues flag is false.
 */
- (void) addWithKey: (id <DTCIComparable>) aX y: (NSObject *) aY;

/*
 *	Adds a data item to the series.
 */
- (void) addWithItem: (DTCComparableObjectItem *) anItem;

/*
 *	Returns the index of the item with the specified x-value, or a negative index if the series does not contain
 *	an item with that x-value. Be aware that for an unsorted series, the index is found by iterating through all
 *	items in the series.
 */
- (int) indexOf: (id <DTCIComparable>) aX;

/*
 *	Updates an item in the series.
 */
- (void) updateWithKey: (id <DTCIComparable>) aX y: (NSObject *) aY;

/*
 *	Updates the value of an item in the series.
 */
- (void) updateByIndex: (int) anIndex y: (NSObject *) aY;

/*
 *	Return the data item with the specified index.
 */
- (DTCComparableObjectItem *) getDataItemWithIndex: (int) anIndex;

/*
 *	Deletes a range of items from the series.
 */
- (void) deleteFrom: (int) startIdx to: (int) endIdx;

/*
 *	Removes all data items from the series and, unless the series is already empty.
 */
- (void) clear;

/*
 *	Removes the item at the specified index.
 */
- (DTCComparableObjectItem *) removeWithIndex: (int) anIndex;

/*
 *	Removes the item with the specified x-value.
 */
- (DTCComparableObjectItem *) removeWithKey: (id <DTCIComparable>) aX;

@end
