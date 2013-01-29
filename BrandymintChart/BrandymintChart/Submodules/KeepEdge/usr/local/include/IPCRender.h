
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IPCRender : NSObject {
@private
	// data values format
	BOOL showDataValues;
	UIColor *dataValuesColor;
	UIFont *dataValuesFont;
	
	NSNumberFormatter *dataFormat;
}

- (BOOL) isShowDataValues;
- (void) setShowDataValues: (BOOL) isShowDataValues;

- (UIColor *) getDataValuesColor;
- (void) setDataValuesColor: (UIColor *) aColor;

- (UIFont *) getDataValuesFont;
- (void) setDataValuesFont: (UIFont *) aFont;

- (NSNumberFormatter *) getDataFormat;
//- (NSNumberFormatter *) getDataFormatNonNull;
- (void) setDataFormat: (NSNumberFormatter *) aDataFormat;

@end
