
#import <Foundation/Foundation.h>

@interface DTCTimePeriodAnchor : NSObject {
@private
	//	The name
	NSString *name;
}

- (id) initWithName: (NSString *) aName;

+ (DTCTimePeriodAnchor *) TimePeriodAnchor_START;

+ (DTCTimePeriodAnchor *) TimePeriodAnchor_MIDDLE;

+ (DTCTimePeriodAnchor *) TimePeriodAnchor_END;

- (BOOL) isSTART;

- (BOOL) isMIDDLE;

- (BOOL) isEND;

@end
