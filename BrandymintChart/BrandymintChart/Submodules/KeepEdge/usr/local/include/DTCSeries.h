
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"

@interface DTCSeries : NSObject <NSCopying> {
@private
	//	The key for the series
	id key;
	//	A description of the series
	NSString *description;
}

- (id) initWithKey: (id <DTCIComparable>) aKey;

- (id) initWithKey: (id <DTCIComparable>) aKey description: (NSString *) aDescription;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (id <DTCIComparable>) getKey;
- (void) setKey: (id <DTCIComparable>) aKey;

- (NSString *) getDescription;
- (void) setDescription: (NSString *) aDescription;

/*
 *	Returns true if the series contains no data items, and false otherwise.
 */
- (BOOL) isEmpty;

/*
 *	Returns the number of data items in the series.
 */
//	Abstract method
- (int) getItemCount;

@end
