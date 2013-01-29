
#import <Foundation/Foundation.h>

#import "DTCRegularTimePeriod.h"
#import "DTCDay.h"
#import "DTCHour.h"
#import "DTCMinute.h"

@interface DTCSecond : DTCRegularTimePeriod {
@private
	DTCDay *day;
	int hour;
	int minute;
	int second;
	long long firstMillisecond;	
}

- (id) initWithSecondValue: (int) aSecond minute: (DTCMinute *) aMinute;

- (id) initWithSecondValue: (int) aSecond
			   minuteValue: (int) aMinute
				 hourValue: (int) aHour
				  dayValue: (int) aDay
				monthValue: (int) aMonth
				 yearValue: (int) aYear;

- (id) initWithDate: (NSDate *) aTime;

- (id) initWithDate: (NSDate *) aTime timeZone: (NSTimeZone *) aZone;

- (id) initWithDate: (NSDate *) aTime timeZone: (NSTimeZone *) aZone locale: (NSLocale *) aLocale;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (int) getSecondValue;

- (DTCMinute *) getMinute;	//	caller to release

/*
 *	Creates a new instance by parsing a string. The string is assumed to be in the format "YYYY-MM-DD HH:MM:SS", perhaps
 *	with leading or trailing whitespace.
 */
//+ (DTCSecond *) parseSecondWithString: (NSString *) aStr;

@end
