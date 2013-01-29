
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "IPCGlobal.h"

@interface IPCPattern : NSObject {
@private
	BOOL display;
	
	BOOL displayBorder;
	UIColor *borderColor;
	int borderSize;
	// title background color
	UIColor *backgroundColor;
	
	// title position in the chart
	IPCPlacement placement;
	
	UIFont *textFont;
	UIColor *textColor;
}

+ (BOOL) isDisplayWithPattern: (IPCPattern *) aPattern;

- (BOOL) isDisplay;
- (void) setDisplay: (BOOL) isDisplay;

- (BOOL) isDisplayBorder;
- (void) setDisplayBorder: (BOOL) isDisplayBorder;

- (UIColor *) getBorderColor;
- (void) setBorderColor: (UIColor *) aColor;

- (int) getBorderSize;
- (void) setBorderSize: (int) aBorderSize;

- (UIColor *) getBackgroundColor;
- (void) setBackgroundColor: (UIColor *) aColor;

- (IPCPlacement) getPlacement;
- (void) setPlacement: (IPCPlacement) aPlacement;

- (UIFont *) getTextFont;
- (void) setTextFont: (UIFont *) aFont;

- (UIColor *) getTextColor;
- (void) setTextColor: (UIColor *) aColor;

@end
