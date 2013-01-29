
#import <Foundation/Foundation.h>

#import "DTCRegularTimePeriod.h"
#import "DTCDay.h"
#import "DTCHour.h"

@interface DTCMinute : DTCRegularTimePeriod {
@private
	DTCDay *day;
	int hour;
	int minute;
	long long firstMillisecond;
	long long lastMillisecond;
}

- (id) initWithMinuteValue: (int) aMinute hour: (DTCHour *) aHour;

- (id) initWithMinuteValue: (int) aMinute hourValue: (int) aHour dayValue: (int) aDay monthValue: (int) aMonth yearValue: (int) aYear;

- (id) initWithDate: (NSDate *) aTime;

- (id) initWithDate: (NSDate *) aTime timeZone: (NSTimeZone *) aZone;

- (id) initWithDate: (NSDate *) aTime timeZone: (NSTimeZone *) aZone locale: (NSLocale *) aLocale;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (DTCDay *) getDay;

- (DTCHour *) getHour;	//	caller to release

- (int) getHourValue;

- (int) getMinuteValue;

/*
 *	Creates a Minute instance by parsing a string.  The string is assumed to be in the format "YYYY-MM-DD HH:MM", perhaps
 *	with leading or trailing whitespace.
 */
//+ (DTCMinute *) parseMinuteWithString: (NSString *) aStr;

@end
