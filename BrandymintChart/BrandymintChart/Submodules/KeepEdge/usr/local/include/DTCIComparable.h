
#import <Foundation/Foundation.h>

@protocol DTCIComparable

- (NSComparisonResult) compare: (id <DTCIComparable>) anObj;

@end
