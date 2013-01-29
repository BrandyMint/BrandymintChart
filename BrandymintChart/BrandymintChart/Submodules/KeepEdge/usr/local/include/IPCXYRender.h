
#import <Foundation/Foundation.h>

#import "IPCRender.h"

@interface IPCXYRender : IPCRender {
@private
	NSNumberFormatter *xDataFormat;
}

- (NSNumberFormatter *) getxDataFormat;
- (void) setXDataFormat: (NSNumberFormatter *) aXDataFormat;

@end
