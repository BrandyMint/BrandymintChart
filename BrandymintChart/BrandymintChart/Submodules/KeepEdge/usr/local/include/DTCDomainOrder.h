
#import <Foundation/Foundation.h>

@interface DTCDomainOrder : NSObject {
@private
	//	The name
	NSString *name;
}

- (id) initWithName: (NSString *) aName;

+ (DTCDomainOrder *) DomainOrder_NONE;

+ (DTCDomainOrder *) DomainOrder_ASCENDING;

+ (DTCDomainOrder *) DomainOrder_DESCENDING;

- (BOOL) isNONE;

- (BOOL) isASCENDING;

- (BOOL) isDESCENDING;

@end
