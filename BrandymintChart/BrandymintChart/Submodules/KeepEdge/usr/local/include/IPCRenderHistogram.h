
#import <Foundation/Foundation.h>

#import "IPCXYRender.h"

@interface IPCRenderHistogram : IPCXYRender {
@private
	double itemMargin;
}

- (double) getItemMargin;
- (void) setItemMargin: (double) anItemMargin;

@end
