
#import <Foundation/Foundation.h>

@interface DemoTimeSeriesChart : NSObject {
}

+ (void) processDemoWithContext: (CGContextRef) aContext;

+ (void) processDemoWithContext: (CGContextRef) aContext area: (CGRect) anImageArea;

@end
