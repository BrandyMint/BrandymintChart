
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//	Joins path segments by extending their outside edges until they meet.
extern int const DTC_STROKE_JOIN_MITER;

//	Joins path segments by rounding off the corner at a radius of half the
//	line width.
extern int const DTC_STROKE_JOIN_ROUND;

//	Joins path segments by connecting the outer corners of their wide outlines
//	with a straight segment.
extern int const DTC_STROKE_JOIN_BEVEL;

//	Ends unclosed subpaths and dash segments with no added decoration.
extern int const DTC_STROKE_CAP_BUTT;

//	Ends unclosed subpaths and dash segments with a round decoration that has
//	a radius equal to half of the width of the pen.
extern int const DTC_STROKE_CAP_ROUND;

//	Ends unclosed subpaths and dash segments with a square projection that extends
//	beyond the end of the segment to a distance equal to half of the line width.
extern int const DTC_STROKE_CAP_SQUARE;

@interface DTCStroke : NSObject <NSCopying> {
@private
	float lineWidth;
	int endCap;
	int lineJoin;
	float miterLimit;
	NSMutableArray *dashs;
	float dashPhase;
}

- (id) initWithWidth: (float) aWidth;

- (id) initWithWidth: (float) aWidth endCap: (int) anEndCap lineJoin: (int) aLineJoin;

- (id) initWithWidth: (float) aWidth endCap: (int) anEndCap lineJoin: (int) aLineJoin miterLimit: (float) aMiterLimit;

- (id) initWithWidth: (float) aWidth
			  endCap: (int) anEndCap
			lineJoin: (int) aLineJoin
		  miterLimit: (float) aMiterLimit
			   dashs: (float *) aDashs
			 dashNum: (int) aDashNum
		   dashPhase: (float) aDashPhase;

- (id) initWithWidth: (float) aWidth
			  endCap: (int) anEndCap
			lineJoin: (int) aLineJoin
		  miterLimit: (float) aMiterLimit
			   dashs: (NSMutableArray *) aDashs
		   dashPhase: (float) aDashPhase;

//	...

- (float) getLineWidth;

- (int) getEndCap;

- (CGLineCap) getCGEndCap;

- (int) getLineJoin;

- (CGLineJoin) getCGLineJoin;

- (float) getMiterLimit;

- (NSMutableArray *) getDashs;

- (float) getDashPhase;

- (void) updateContext: (CGContextRef) aContext;

@end
