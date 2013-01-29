
#import "DTCIComparable.h"
#import "DTCIValue.h"

@protocol DTCIKeyedValue <DTCIValue>

- (id <DTCIComparable>) getKey;

@end
