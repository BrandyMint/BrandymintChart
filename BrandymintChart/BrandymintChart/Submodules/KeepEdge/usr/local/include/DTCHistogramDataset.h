
#import <Foundation/Foundation.h>

#import "DTCIIntervalXYDataset.h"
#import "DTCAbstractIntervalXYDataset.h"
#import "DTCHistogramType.h"

@interface DTCHistogramDataset : DTCAbstractIntervalXYDataset <DTCIIntervalXYDataset> {
@private
	NSMutableArray *list;
	
	DTCHistogramType *type;
}

- (DTCHistogramType *) getType;
- (void) setType: (DTCHistogramType *) aType;

/*
 *	Adds a series to the dataset, using the specified number of bins.
 */
- (void) addSeriesWithKey: (id <DTCIComparable>) aKey values: (NSMutableArray *) aValues bins: (int) aBins;

/*
 *	Adds a series to the dataset. Any data value less than minimum will be assigned to the first bin, and any
 *	data value greater than maximum will be assigned to the last bin. Values falling on the boundary of adjacent
 *	bins will be assigned to the higher indexed bin.
 */
- (void) addSeriesWithKey: (id <DTCIComparable>) aKey
				   values: (NSMutableArray *) aValues
					 bins: (int) aBins
				  minimum: (double) aMinimum
				  maximum: (double) aMaximum;

- (NSMutableArray *) getBinsWithSeries: (int) aSeries;

/*
 *	Returns the number of series in the dataset.
 */
- (int) getSeriesCount;

/*
 *	Returns the key for a series.
 */
- (id <DTCIComparable>) getSeriesKeyWithSeries:(int)aSeries;

/*
 *	Returns the number of data items for a series.
 */
- (int) getItemCountWithSeries:(int)aSeries;

- (NSNumber *) getXWithSeries: (int) aSeries item: (int) anItem;

- (NSNumber *) getYWithSeries: (int) aSeries item: (int) anItem;

- (NSNumber *) getStartXWithSeries: (int) aSeries item: (int) anItem;

- (NSNumber *) getEndXWithSeries: (int) aSeries item: (int) anItem;

- (NSNumber *) getStartYWithSeries: (int) aSeries item: (int) anItem;

- (NSNumber *) getEndYWithSeries: (int) aSeries item: (int) anItem;

@end
