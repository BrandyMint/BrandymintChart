
#import <Foundation/Foundation.h>

#import "DTCRegularTimePeriod.h"
#import "DTCDay.h"
#import "DTCHour.h"
#import "DTCMinute.h"
#import "DTCSecond.h"

@interface DTCMillisecond : DTCRegularTimePeriod {
@private
	DTCDay *day;
	int hour;
	int minute;
	int second;
	int millisecond;
	long long firstMillisecond;
}

- (id) initWithMillisecondValue: (int) aMillisecond second: (DTCSecond *) aSecond;

- (id) initWithMillisecondValue: (int) aMillisecond
					secondValue: (int) aSecond
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
- (DTCSecond *) getSecond;	//	caller to release

- (long) getMillisecond;

@end
