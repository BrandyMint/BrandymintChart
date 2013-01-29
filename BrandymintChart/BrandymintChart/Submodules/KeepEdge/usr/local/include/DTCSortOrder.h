
#import <Foundation/Foundation.h>

/*
 *	Defines token used to indicate sorting order
 */
@interface DTCSortOrder : NSObject {
@private
	//	The name
	NSString *name;	
}

- (id) initWithName: (NSString *) aName;

+ (DTCSortOrder *) SortOrder_ASCENDING;

+ (DTCSortOrder *) SortOrder_DESCENDING;

- (BOOL) isASCENDING;

- (BOOL) isDESCENDING;

@end
