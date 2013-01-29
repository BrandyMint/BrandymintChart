
#import "DTCIComparable.h"
#import "DTCIValues.h"

@protocol DTCIKeyedValues <DTCIValues>

- (id <DTCIComparable>) getKeyWithIndex: (int) index;

- (int) getIndexWithKey: (id <DTCIComparable>) key;

- (NSMutableArray *) getKeys;

- (NSNumber *) getValueWithKey: (id <DTCIComparable>) key;

@end

