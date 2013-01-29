
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCIKeyedValues2D.h"

@interface DTCDefaultKeyedValues2D : NSObject <DTCIKeyedValues2D, NSCopying> {
@private
	//	The row keys
	NSMutableArray *rowKeys;
	//	The column keys
	NSMutableArray *columnKeys;
	//	The row data
	NSMutableArray *rows;
	//	If the row keys should be sorted by their comparable order
	BOOL sortRowKeys;
}

- (id) initWithSort: (BOOL) aFlag;

/*
 *	Adds a value to the table. Performs the same function as #setValue(Number, Comparable, Comparable).
 */
- (void) addValueWithValue: (NSNumber *) aValue rowKey: (id <DTCIComparable>) aRowKey columnKey: (id <DTCIComparable>) aColumnKey;

/*
 *	Adds or updates a value.
 */
- (void) setValueWithValue: (NSNumber *) aValue rowKey: (id <DTCIComparable>) aRowKey columnKey: (id <DTCIComparable>) aColumnKey;

/*
 *	Removes a value from the table by setting it to null. If all the values in the specified
 *	row and/or column are now null, the row and/or column is removed from the table.
 */
- (void) removeValueWithRowKey: (id <DTCIComparable>) aRowKey columnKey: (id <DTCIComparable>) aColumnKey;

/*
 *	Removes a row.
 */
- (void) removeRowWithIndex: (int) aRowIndex;

/*
 *	Removes a row from the table.
 */
- (void) removeRowWithKey: (id <DTCIComparable>) aRowKey;

/*
 *	Removes a column.
 */
- (void) removeColumnWithIndex: (int) aColumnIndex;

/*
 *	Removes a column from the table.
 */
- (void) removeColumnWithKey: (id <DTCIComparable>) aColumnKey;

- (void) clear;

@end
