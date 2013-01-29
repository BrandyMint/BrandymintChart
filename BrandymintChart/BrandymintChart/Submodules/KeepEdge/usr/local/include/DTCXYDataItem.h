
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCXYDataItem.h"

@interface DTCXYDataItem : NSObject <DTCIComparable> {
@private
	//	The x-value (null not permitted)
	NSNumber *xVal;
	//	The y-value
	NSNumber *yVal;
}

- (id) initWithXDouble: (double) xVal yDouble: (double) yVal;

- (id) initWithXVal: (NSNumber *) aXVal yVal: (NSNumber *) aYVal;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (NSNumber *) getX;
- (void) setX: (NSNumber *) aXVal;

- (double) getXValue;

- (NSNumber *) getY;

- (double) getYValue;

- (void) setYValue: (double) aYVal;

- (void) setY: (NSNumber *) aYVal;

@end
