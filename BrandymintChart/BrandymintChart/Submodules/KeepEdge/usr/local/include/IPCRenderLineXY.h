
#import <Foundation/Foundation.h>

#import "IPCXYRender.h"
#import "DTCStroke.h"

@interface IPCRenderLineXY : IPCXYRender {
@private	
	BOOL showLine;
	DTCStroke *lineStroke;
	
	BOOL showShapes;
	BOOL shapeFilled;
	NSMutableArray *seriesShapes;
}

- (BOOL) isShowLine;
- (void) setShowLine: (BOOL) isShowLine;

- (DTCStroke *) getLineStroke;
- (void) setLineStroke: (DTCStroke *) aStroke;

- (BOOL) isShowShapes;
- (void) setShowShapes: (BOOL) isShowShapes;

- (BOOL) isShapeFilled;
- (void) setShapeFilled: (BOOL) isShapeFilled;

- (NSMutableArray *) getSeriesShapes;
- (void) setSeriesShapes: (NSMutableArray *) aSeriesShapes;

@end
