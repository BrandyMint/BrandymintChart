
#import <Foundation/Foundation.h>

#import "IPCAbstractAxis.h"

@interface IPCTimeAxis : IPCAbstractAxis {
@private
	NSString *timeFormat;
}

- (NSString *) getTimeFormat;
- (void) setTimeFormat: (NSString *) aTimeFormat;

@end
