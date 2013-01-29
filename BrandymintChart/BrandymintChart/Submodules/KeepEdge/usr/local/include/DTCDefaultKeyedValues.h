
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCIKeyedValues.h"
#import "DTCSortOrder.h"

/*
 *	An ordered list of (key, value) items. This class provides a default
 *	implementation of the "KeyedValues" interface
 */
@interface DTCDefaultKeyedValues : NSObject <DTCIKeyedValues, NSCopying> {
@private
	NSMutableArray *keys;
	NSMutableArray *values;	
	NSMutableDictionary *indexMap;
}

/*
 *	Update an existing value, or adds a new value to the collection.
 */
- (void) addValueWithKey: (id <DTCIComparable>) aKey value: (double) aValue;

/*
 *	Update an existing value, or adds a new value to the collection.
 *	This method passes control directly to the setValue method.
 */
- (void) addValueWithKey: (id <DTCIComparable>) aKey valueObj: (NSNumber *) anObj;

/*
 *	Update an existing value, or adds a new value to the collection.
 */
- (void) setValueWithKey: (id <DTCIComparable>) aKey value: (double) aValue;

/*
 *	Update an existing value, or adds a new value to the collection.
 */
- (void) setValueWithKey: (id <DTCIComparable>) aKey valueObj: (NSNumber *) anObj;

/*
 *	Inserts a new value at the specified position in the dataset or, if
 *	there is an existing item with the specified key, updates the value
 *	for that item and moves it to the specified position.
 */
- (void) insertValueWithPos: (int) aPos key: (id <DTCIComparable>) aKey value: (double) aValue;

/*
 *	Inserts a new value at the specified position in the dataset or, if
 *	there is an existing item with the specified key, updates the value
 *	for that item and moves it to the specified position.
 */
- (void) insertValueWithPos: (int) aPos key: (id <DTCIComparable>) aKey valueObj: (NSNumber *) anObj;

/*
 *	Rebuilds the key to indexed-position mapping after an positioned insert or
 *	 a remove operation.
 */
- (void) rebuildIndex;

/*
 *	Removes a value from the collection.
 */
- (void) removeValueWithIndex: (int) anIndex;

/*
 *	Removes a value from the collection.
 */
- (void) removeValueWithKey: (id <DTCIComparable>) aKey;

/*
 *	Clears all values from the collection.
 */
- (void) clear;

/*
 *	Sorts the items in the list by key.
 */
- (void) sortByKeys: (DTCSortOrder *) anOrder;

/*
 *	Sorts the items in the list by value. If the list contains null values, they will
 *	sort to the end of the list irrespective of the sort order.
 */
- (void) sortByValues: (DTCSortOrder *) anOrder;

@end
