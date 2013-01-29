
#import <Foundation/Foundation.h>

#import "DTCRegularTimePeriod.h"
#import "DTCSerialDate.h"

@interface DTCDay : DTCRegularTimePeriod {
@private
	//	The day (uses SerialDate for convenience)
	DTCSerialDate *serialDate;
	//	The first millisecond
	long long firstMillisecond;
	//	The last millisecond
	long long lastMillisecond;
}

- (id) initWithDayValue: (int) aDay monthValue: (int) aMonth yearValue: (int) aYear;

- (id) initWithSerialDate: (DTCSerialDate *) aDate;

- (id) initWithDate: (NSDate *) aTime;

- (id) initWithDate: (NSDate *) aTime timeZone: (NSTimeZone *) aZone;

- (id) initWithDate: (NSDate *) aTime timeZone: (NSTimeZone *) aZone locale: (NSLocale *) aLocale;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (DTCSerialDate *) getSerialDate;

- (int) getYearValue;

- (int) getMonthValue;

- (int) getDayOfMonth;

/*
 *	Parses the string argument as a day.
 *	This method is required to recognise YYYY-MM-DD as a valid format. Anything else, for now, is a bonus.
 */
+ (DTCDay *) parseDayWithString: (NSString *) aStr;

@end
