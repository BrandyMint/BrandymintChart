
#import <Foundation/Foundation.h>

#import "IPCCategoryRender.h"

@interface IPCRenderBar : IPCCategoryRender {
@private
	// draw pie shadow
	BOOL showShadow;
	// draw pie section ourline
	BOOL showBarItemOutline;
	
	double beginMargin;
	double endMargin;
	double categoryMargin;
	double itemMargin;
	
	NSString *labelFormat;
}

- (double) getBeginMargin;
- (void) setBeginMargin: (double) aBeginMargin;

- (double) getEndMargin;
- (void) setEndMargin: (double) anEndMargin;

- (double) getCategoryMargin;
- (void) setCategoryMargin: (double) aCategoryMargin;

- (double) getItemMargin;
- (void) setItemMargin: (double) anItemMargin;

- (BOOL) isShowShadow;
- (void) setShowShadow: (BOOL) isShowShadow;

- (BOOL) isShowBarItemOutline;
- (void) setShowBarItemOutline: (BOOL) isShowBarItemOutline;

- (NSString *) getLabelFormat;
- (void) setLabelFormat: (NSString *) aLabelFormat;

@end
