
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "IPCRender.h"

@interface IPCRenderPie : IPCRender {
@private
	// draw pie shadow
	BOOL showShadow;
	// draw pie section ourline
	BOOL showSectionsOutline;
	
	UIColor *dataLinkColor;
	
	/*
	 * For the label format, use {0} where the pie section key should be inserted,
	 * {1} for the absolute section value and {2} for the percent amount of the pie
	 * section, e.g. <code>"{0} = {1} ({2})"</code> will display as
	 * <code>apple = 120 (5%)</code>.
	 *
	 */
	// pie section item label format
	NSString *itemLabelsFormat;
	// pie legend item format
	NSString *legendItemLabelsFormat;
	
	NSNumberFormatter *percentageFormat;
}

- (BOOL) isShowShadow;
- (void) setShowShadow: (BOOL) isShowShadow;

- (BOOL) isShowSectionsOutline;
- (void) setShowSectionsOutline: (BOOL) isShowSectionsOutline;

- (UIColor *) getDataLinkColor;
- (void) setDataLinkColor: (UIColor *) aColor;

- (NSString *) getItemLabelsFormat;
- (void) setItemLabelsFormat: (NSString *) anItemLabelsFormat;

- (NSString *) getLegendItemLabelsFormat;
- (void) setLegendItemLabelsFormat: (NSString *) anLegendItemLabelsFormat;

- (NSNumberFormatter *) getPercentageFormat;
- (void) setPercentageFormat: (NSNumberFormatter *) aPercentageFormat;

@end
