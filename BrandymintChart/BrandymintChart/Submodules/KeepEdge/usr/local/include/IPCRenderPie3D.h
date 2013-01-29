
#import <Foundation/Foundation.h>

#import "IPCRenderPie.h"

@interface IPCRenderPie3D : IPCRenderPie {
@private	
	/**
	 * Sets the starting angle and sends a  to all
	 * registered listeners.  The initial default value is 90 degrees, which
	 * corresponds to 12 o'clock.  A value of zero corresponds to 3 o'clock...
	 * this is the encoding used by Java's Arc2D class.
	 */
	double startAngle;
	
	// 1: CLOCKWISE
	// 2: ANTICLOCKWISE
	int direction;
	float foregroundAlpha;
}

- (double) getStartAngle;
- (void) setStartAngle: (double) aStartAngle;

- (int) getDirection;
- (void) setDirection: (int) aDirection;

- (float) getForegroundAlpha;
- (void) setForegroundAlpha: (float) aForegroundAlpha;

@end
