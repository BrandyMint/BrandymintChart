
#import <Foundation/Foundation.h>

#import "IPCPattern.h"

@interface IPCTitle : IPCPattern {
@private
	NSString *title;
}

- (id) initWithTitle: (NSString *) aTitle;

+ (NSString *) getTitleTextWithTitle: (IPCTitle *) aTitle;

- (NSString *) getTitle;
- (void) setTitle: (NSString *) aTitle;

@end
