
#import <Foundation/Foundation.h>

#import "DTCRegularTimePeriod.h"
#import "DTCDay.h"

@interface DTCHour : DTCRegularTimePeriod {
@private
	DTCDay *day;
	int hour;
	long long firstMillisecond;
	long long lastMillisecond;
}

- (id) initWithHourValue: (int) aHour day: (DTCDay *) aDay;

- (id) initWithHourValue: (int) aHour dayValue: (int) aDay monthValue: (int) aMonth yearValue: (int) aYear;

- (id) initWithDate: (NSDate *) aTime;

- (id) initWithDate: (NSDate *) aTime timeZone: (NSTimeZone *) aZone;

- (id) initWithDate: (NSDate *) aTime timeZone: (NSTimeZone *) aZone locale: (NSLocale *) aLocale;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (int) getHourValue;

- (DTCDay *) getDay;

- (int) getYearValue;

- (int) getMonthValue;

- (int) getDayOfMonth;

/*
 *	Creates an Hour instance by parsing a string. The string is assumed to be in the format "YYYY-MM-DD HH", perhaps
 *	with leading or trailing whitespace.
 */
+ (DTCHour *) parseHourWithString: (NSString *) aStr;

@end
