
#import <Foundation/Foundation.h>

#import "DTCITimePeriod.h"

@interface DTCTask : NSObject <NSCopying> {
@private
	NSString *description;
	id <DTCITimePeriod> duration;
	NSNumber *percentComplete;	//	double value
	NSMutableArray *subtasks;
}

- (id) initWithDescription: (NSString *) aDescription duration: (id <DTCITimePeriod>) aDuration;

- (id) initWithDescription: (NSString *) aDescription start: (NSDate *) aStart end: (NSDate *) anEnd;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (NSString *) getDescription;
- (void) setDescription: (NSString *) aDescription;

- (id <DTCITimePeriod>) getDuration;
- (void) setDuration: (id <DTCITimePeriod>) aDuration;

- (NSNumber *) getPercentComplete;
- (void) setPercentComplete: (NSNumber *) aPercent;

- (void) setPercentCompleteValue: (double) aPercent;

- (void) addSubtask: (DTCTask *) aSubtask;

- (void) removeSubtask: (DTCTask *) aSubtask;

- (int) getSubtaskCount;

- (DTCTask *) getSubtaskWithIndex: (int) anIndex;

@end
