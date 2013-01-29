
#import <Foundation/Foundation.h>

@interface DTCHistogramType : NSObject {
@private
	//	The name
	NSString *name;	
}

- (id) initWithName: (NSString *) aName;

+ (DTCHistogramType *) HistogramType_FREQUENCY;

+ (DTCHistogramType *) HistogramType_RELATIVE_FREQUENCY;

+ (DTCHistogramType *) HistogramType_SCALE_AREA_TO_1;

- (BOOL) isFREQUENCY;

- (BOOL) isRELATIVE_FREQUENCY;

- (BOOL) isSCALE_AREA_TO_1;

@end
