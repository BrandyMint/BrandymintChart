
#import <Foundation/Foundation.h>

@interface DTCOHLC : NSObject {
@private
	double open;
	double close;
	double high;
	double low;
}

- (id) initWithOpen: (double) anOpne high: (double) aHigh low: (double) aLow close: (double) aClose;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (double) getOpen;

- (double) getClose;

- (double) getHigh;

- (double) getLow;

@end
