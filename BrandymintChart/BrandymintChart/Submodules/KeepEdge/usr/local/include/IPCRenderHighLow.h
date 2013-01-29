
#import <Foundation/Foundation.h>

#import "IPCXYRender.h"
#import "DTCStroke.h"

@interface IPCRenderHighLow : IPCXYRender {
@private
	UIColor *lineColor;
	DTCStroke *lineStroke;
	
	/** A flag that controls whether the open ticks are drawn. */
	BOOL drawOpenTicks;
	
	/** A flag that controls whether the close ticks are drawn. */
	BOOL drawCloseTicks;
	
	/**
	 * The paint used for the open ticks (if <code>null</code>, the series
	 * paint is used instead).
	 */
	UIColor *openTickColor;
	
	/**
	 * The paint used for the close ticks (if <code>null</code>, the series
	 * paint is used instead).
	 */
	UIColor *closeTickColor;
	
	/**
	 * The tick length
	 */
	double tickLength;
}

- (UIColor *) getLineColor;
- (void) setLineColor: (UIColor *) aColor;

- (DTCStroke *) getLineStroke;
- (void) setLineStroke: (DTCStroke *) aStroke;

- (BOOL) isDrawOpenTicks;
- (void) setDrawOpenTicks: (BOOL) isDrawOpenTicks;

- (BOOL) isDrawCloseTicks;
- (void) setDrawCloseTicks: (BOOL) isDrawCloseTicks;

- (UIColor *) getOpenTickColor;
- (void) setOpenTickColor: (UIColor *) aColor;

- (UIColor *) getCloseTickColor;
- (void) setCloseTickColor: (UIColor *) aColor;

- (double) getTickLength;
- (void) setTickLength: (double) aTickLength;

@end
