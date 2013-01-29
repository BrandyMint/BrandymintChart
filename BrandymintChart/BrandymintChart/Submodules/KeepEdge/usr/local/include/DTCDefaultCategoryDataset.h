
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCICategoryDataset.h"
#import "DTCAbstractDataset.h"
#import "DTCDefaultKeyedValues2D.h"

@interface DTCDefaultCategoryDataset : DTCAbstractDataset <DTCICategoryDataset> {
@private
	//	A storage structure for the data
	DTCDefaultKeyedValues2D *data;
}

/*
 *	Adds a value to the table.  Performs the same function as setValue().
 */
- (void) addValueWithValue: (NSNumber *) aValue rowKey: (id <DTCIComparable>) aRowKey columnKey: (id <DTCIComparable>) aColumnKey;

/*
 *	Adds a value to the table.
 */
- (void) addValueWithDouble: (double) aValue rowKey: (id <DTCIComparable>) aRowKey columnKey: (id <DTCIComparable>) aColumnKey;

/*
 *	Adds or updates a value in the table and sends a DatasetChangeEvent to all registered listeners.
 */
- (void) setValueWithValue: (NSNumber *) aValue rowKey: (id <DTCIComparable>) aRowKey columnKey: (id <DTCIComparable>) aColumnKey;

/*
 *	Adds or updates a value in the table and sends a
 */
- (void) setValueWithDouble: (double) aValue rowKey: (id <DTCIComparable>) aRowKey columnKey: (id <DTCIComparable>) aColumnKey;

/*
 *	Adds the specified value to an existing value in the dataset (if the existing value is
 *	null, it is treated as if it were 0.0).
 */
- (void) incrementValue: (double) aValue rowKey: (id <DTCIComparable>) aRowKey columnKey: (id <DTCIComparable>) aColumnKey;

/*
 *	Removes a value from the dataset and sends a DatasetChangeEvent to all registered listeners.
 */
- (void) removeValueWithRowKey: (id <DTCIComparable>) aRowKey columnKey: (id <DTCIComparable>) aColumnKey;

/*
 *	Removes a row from the dataset and sends a DatasetChangeEvent
 */
- (void) removeRowWithIndex: (int) aRowIndex;

/*
 *	Removes a row from the dataset and sends a DatasetChangeEvent to all registered listeners.
 */
- (void) removeRowWithKey: (id <DTCIComparable>) aRowKey;

/*
 *	Removes a column from the dataset and sends a DatasetChangeEvent
 */
- (void) removeColumnWithIndex: (int) aColumnIndex;

/*
 *	Removes a column from the dataset and sends a DatasetChangeEvent to all registered listeners.
 */
- (void) removeColumnWithKey: (id <DTCIComparable>) aColumnKey;

/*
 *	Clears all data from the dataset and sends a DatasetChangeEvent to all registered listeners.
 */
- (void) clear;

@end
