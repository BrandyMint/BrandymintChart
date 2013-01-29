
#import <Foundation/Foundation.h>

@interface DTCRangeType : NSObject <NSCopying> {
@private
	//	The name
	NSString *name;
}

- (id) initWithName: (NSString *) aName;

+ (DTCRangeType *) RangeType_FULL;

+ (DTCRangeType *) RangeType_POSITIVE;

+ (DTCRangeType *) RangeType_NEGATIVE;

- (BOOL) isFULL;

- (BOOL) isPOSITIVE;

- (BOOL) isNEGATIVE;

@end
