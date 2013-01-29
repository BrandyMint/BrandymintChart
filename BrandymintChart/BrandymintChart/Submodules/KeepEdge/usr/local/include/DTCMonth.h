
#import <Foundation/Foundation.h>

#import "DTCRegularTimePeriod.h"
#import "DTCYear.h"

@interface DTCMonth : DTCRegularTimePeriod {
@private
	//	The month (1-12)
	int month;
	//	The year in which the month falls
	int year;
	//	The first millisecond
	long long firstMillisecond;
	//	The last millisecond
	long long lastMillisecond;
}

- (id) initWithMonthValue: (int) aMonth yearValue: (int) aYear;

- (id) initWithMonthValue: (int) aMonth year: (DTCYear *) aYear;

- (id) initWithDate: (NSDate *) aTime;

- (id) initWithDate: (NSDate *) aTime timeZone: (NSTimeZone *) aZone;

- (id) initWithDate: (NSDate *) aTime timeZone: (NSTimeZone *) aZone locale: (NSLocale *) aLocale;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (DTCYear *) getYear;

- (int) getYearValue;

- (int) getMonth;

/*
 *	Parses the string argument as a month. This method is required to accept the format "YYYY-MM".
 *	It will also accept "MM-YYYY". Anything else, at the moment, is a bonus.
 */
+ (DTCMonth *) parseMonthWithString: (NSString *) aStr;

@end
