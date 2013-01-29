
#import <Foundation/Foundation.h>

/*
 *	A class that is used to group datasets
 */
@interface DTCDatasetGroup : NSObject <NSCopying> {
@private
	//	The group id
	NSString *groupID;
}

//	Creates a new group with the specified ID
- (id) initWithGroupID: (NSString *) aString;

- (NSString *) getGroupID;

@end
