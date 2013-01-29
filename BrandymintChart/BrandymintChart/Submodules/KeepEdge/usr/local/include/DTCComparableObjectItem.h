
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"

@interface DTCComparableObjectItem : NSObject <DTCIComparable> {
@private
	id <DTCIComparable> xVal;
	NSObject *objItem;
}

- (id) initWithX: (id <DTCIComparable>) aX y: (NSObject *) aY;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (id <DTCIComparable>) getComparable;

- (NSObject *) getObject;
- (void) setObject: (NSObject *) aY;

@end
