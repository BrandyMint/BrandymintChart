
#import <Foundation/Foundation.h>

@interface DTCHistogramBin : NSObject {
@private
	int count;
	double startBoundary;
	double endBoundary;
}

- (id) initWithStart: (double) aStart end: (double) anEnd;

- (int) getCount;

- (void) incrementCount;

- (double) getStartBoundary;

- (double) getEndBoundary;

- (double) getBinWidth;

@end
