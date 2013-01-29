
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCIPieDataset.h"
#import "DTCAbstractDataset.h"
#import "DTCDefaultKeyedValues.h"

/*
 *	A default implementation of the "PieDataset" interface
 */
@interface DTCDefaultPieDataset : DTCAbstractDataset <DTCIPieDataset> {
@private
	DTCDefaultKeyedValues *data;	
}

//	...

- (void) setValueWithKey: (id <DTCIComparable>) aKey numberValue: (NSNumber *) aValue;

- (void) setValueWithKey: (id <DTCIComparable>) aKey doubleValue: (double) aValue;


@end
