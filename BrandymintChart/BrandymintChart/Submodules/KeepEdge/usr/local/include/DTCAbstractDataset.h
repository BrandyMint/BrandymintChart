
#import <Foundation/Foundation.h>

#import "DTCIDataset.h"
#import "DTCDatasetGroup.h"

/*
 *	An abstract implementation of the "Dataset" interface, containing a mechanism for
 *	registering change listeners.
 */
@interface DTCAbstractDataset : NSObject <DTCIDataset, NSCopying> {
@private
	DTCDatasetGroup *group;
}

- (DTCDatasetGroup *) getGroup;
- (void) setGroup: (DTCDatasetGroup *) aGroup;

- (void) fireDatasetChanged;

@end
