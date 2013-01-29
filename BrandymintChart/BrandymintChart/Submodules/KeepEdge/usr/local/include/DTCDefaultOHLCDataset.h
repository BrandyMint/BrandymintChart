
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCIOHLCDataset.h"
#import "DTCAbstractXYDataset.h"

@interface DTCDefaultOHLCDataset : DTCAbstractXYDataset <DTCIOHLCDataset> {
@private
	id <DTCIComparable> key;

	NSMutableArray *data;	
}

@end
