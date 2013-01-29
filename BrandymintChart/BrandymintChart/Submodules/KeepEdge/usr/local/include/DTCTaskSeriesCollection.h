
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCIGanttCategoryDataset.h"
#import "DTCAbstractSeriesDataset.h"
#import "DTCTaskSeries.h"

@interface DTCTaskSeriesCollection : DTCAbstractSeriesDataset <DTCIGanttCategoryDataset> {
@private
	NSMutableArray *keys;
	NSMutableArray *data;
}

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (DTCTaskSeries *) getSeriesWithKey: (id <DTCIComparable>) aKey;

- (DTCTaskSeries *) getSeriesWithIndex: (int) aSeries;

- (int) getSeriesCount;

- (id <DTCIComparable>) getSeriesKeyWithSeries: (int) aSeries;

- (int) getRowCount;

- (NSMutableArray *) getRowKeys;

- (int) getColumnCount;

- (NSMutableArray *) getColumnKeys;

- (id <DTCIComparable>) getColumnKeyWithColumn: (int) anIndex;

- (int) getColumnIndexWithKey: (id <DTCIComparable>) aColumnKey;

- (int) getRowIndexWithKey: (id <DTCIComparable>) aRowKey;

- (id <DTCIComparable>) getRowKeyWithRow: (int) anIndex;

/*
 *	Adds a series to the dataset
 */
- (void) addWithTaskSeries: (DTCTaskSeries *) aSeries;

/*
 *	Removes a series from the collection
 */
- (void) removeWithTaskSeries: (DTCTaskSeries *) aSeries;

/*
 *	Removes a series from the collection
 */
- (void) removeWithSeries: (int) aSeries;

/*
 *	Removes all the series from the collection
 */
- (void) removeAll;

@end
