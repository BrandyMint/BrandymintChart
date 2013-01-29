
#import <Foundation/Foundation.h>

#import "DTCRegularTimePeriod.h"

@interface DTCYear : DTCRegularTimePeriod {
@private
	//	The year
	short year;
	//	The first millisecond
	long long firstMillisecond;
	//	The last millisecond
	long long lastMillisecond;
}

- (id) initWithYearValue: (int) aYear;

- (id) initWithDate: (NSDate *) aTime;

- (id) initWithDate: (NSDate *) aTime timeZone: (NSTimeZone *) aZone;

- (id) initWithDate: (NSDate *) aTime timeZone: (NSTimeZone *) aZone locale: (NSLocale *) aLocale;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (int) getYear;

/*
 *	Parses the string argument as a year. The string format is YYYY.
 */
+ (DTCYear *) parseYearWithString: (NSString *) aStr;
	
@end
