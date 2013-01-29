
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCIKeyedValue.h"

@interface DTCDefaultKeyedValue : NSObject <DTCIKeyedValue, NSCopying> {
@private
	//	The key
	id <DTCIComparable> key;
	//	The value
	NSNumber *value;
}

- (id) initWithKey: (id <DTCIComparable>) aKey value: (NSNumber *) aValue;

- (id <DTCIComparable>) getKey;

- (NSNumber *) getValue;
- (void) setValue: (NSNumber *) aValue;

- (NSComparisonResult) compareWithKey: (DTCDefaultKeyedValue *) anObj;

- (NSComparisonResult) compareWithValue: (DTCDefaultKeyedValue *) anObj;

@end
