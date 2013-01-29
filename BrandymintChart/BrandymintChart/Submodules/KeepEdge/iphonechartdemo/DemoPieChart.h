
#import <Foundation/Foundation.h>

@interface DemoPieChart : NSObject {
}

+ (void) processDemoWithContext: (CGContextRef) aContext;

+ (void) processDemoWithContext: (CGContextRef) aContext area: (CGRect) anImageArea;

@end
