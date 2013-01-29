
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCIIntervalCategoryDataset.h"

@protocol DTCIGanttCategoryDataset <DTCIIntervalCategoryDataset>

/*
 *	Returns the percent complete for a given item.
 */
- (NSNumber *) getPercentCompleteWithRow: (int) aRow column: (int) aColumn;

/*
 *	Returns the percent complete for a given item.
 */
- (NSNumber *) getPercentCompleteWithRowKey: (id <DTCIComparable>) aRowKey columnKey: (id <DTCIComparable>) aColumnKey;

/*
 *	Returns the number of sub-intervals for a given item.
 */
- (int) getSubIntervalCountWithRow: (int) aRow column: (int) aColumn;

/*
 *	Returns the number of sub-intervals for a given item.
 */
- (int) getSubIntervalCountWithRowKey: (id <DTCIComparable>) aRowKey columnKey: (id <DTCIComparable>) aColumnKey;

/*
 *	Returns the start value of a sub-interval for a given item.
 */
- (NSNumber *) getStartValueWithRow: (int) aRow column: (int) aColumn subinterval: (int) aSubinterval;

/*
 *	Returns the start value of a sub-interval for a given item.
 */
- (NSNumber *) getStartValueWithRowKey: (id <DTCIComparable>) aRowKey
							 columnKey: (id <DTCIComparable>) aColumnKey
						   subinterval: (int) aSubinterval;

/*
 *	Returns the end value of a sub-interval for a given item.
 */
- (NSNumber *) getEndValueWithRow: (int) aRow column: (int) aColumn subinterval: (int) aSubinterval;

/*
 *	Returns the end value of a sub-interval for a given item.
 */
- (NSNumber *) getEndValueWithRowKey: (id <DTCIComparable>) aRowKey
						   columnKey: (id <DTCIComparable>) aColumnKey
						 subinterval: (int) aSubinterval;

/*
 *Returns the percentage complete value of a sub-interval for a given item.
 */
- (NSNumber *) getPercentCompleteWithRow: (int) aRow column: (int) aColumn subinterval: (int) aSubinterval;

/*
 *	Returns the percentage complete value of a sub-interval for a given item.
 */
- (NSNumber *) getPercentCompleteWithRowKey: (id <DTCIComparable>) aRowKey
								  columnKey: (id <DTCIComparable>) aColumnKey
								subinterval: (int) aSubinterval;

@end
