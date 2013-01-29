
#import "DTCIComparable.h"
#import "DTCIValues2D.h"

@protocol DTCIKeyedValues2D <DTCIValues2D>

- (id <DTCIComparable>) getRowKeyWithRow: (int) aRow;

- (int) getRowIndexWithKey: (id <DTCIComparable>) aKey;

- (NSMutableArray *) getRowKeys;

- (id <DTCIComparable>) getColumnKeyWithColumn: (int) aColumn;

- (int) getColumnIndexWithKey: (id <DTCIComparable>) aKey;

- (NSMutableArray *) getColumnKeys;

- (NSNumber *) getValueWithRowKey: (id <DTCIComparable>) aRowKey columnKey: (id <DTCIComparable>) aColumnKey;

@end

