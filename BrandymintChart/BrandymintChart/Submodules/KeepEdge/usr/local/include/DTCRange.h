
#import <Foundation/Foundation.h>

@interface DTCRange : NSObject <NSCopying> {
@private
	double lower;
	double upper;
}

- (id) initWithLower: (double) aLower upper: (double) aUpper;

- (double) getLowerBound;

- (double) getUpperBound;

- (double) getLength;

- (double) getCentralValue;

- (BOOL) contains: (double) aValue;

- (BOOL) intersectsWith: (double) aValue1 another: (double) aValue2;

- (BOOL) intersectsWithRange: (DTCRange *) aRange;

- (double) constrain: (double) aValue;

+ (DTCRange *) combineRange: (DTCRange *) aRange1 another: (DTCRange *) aRange2;

+ (DTCRange *) expandToInclude: (DTCRange *) aRange value: (double) aValue;

+ (DTCRange *) expand: (DTCRange *) aRange lowerMargin: (double) aLowerMargin upperMargin: (double) aUpperMargin;

+ (DTCRange *) shift: (DTCRange *) aRange delta: (double) aDelta;

+ (DTCRange *) shift: (DTCRange *) aRange delta: (double) delta allowZeroCrossing: (BOOL) aFlag;

+ (DTCRange *) scale: (DTCRange *) aRange factor: (double) aFactor;

@end
