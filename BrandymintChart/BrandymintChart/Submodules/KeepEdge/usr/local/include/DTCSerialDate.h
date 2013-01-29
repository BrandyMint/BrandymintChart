
#import <Foundation/Foundation.h>

#import "DTCIMonthConstants.h"

//	The serial number for 1 January 1900
extern int const DTC_SERIAL_LOWER_BOUND;

//	The serial number for 31 December 9999
extern int const DTC_SERIAL_UPPER_BOUND;

//	The lowest year value supported by this date format
extern int const DTC_MINIMUM_YEAR_SUPPORTED;

//	The highest year value supported by this date format
extern int const DTC_MAXIMUM_YEAR_SUPPORTED;

//	A useful constant for referring to the first week in a month
extern int const DTC_FIRST_WEEK_IN_MONTH;

//	A useful constant for referring to the second week in a month
extern int const DTC_SECOND_WEEK_IN_MONTH;

//	A useful constant for referring to the third week in a month
extern int const DTC_THIRD_WEEK_IN_MONTH;

//	A useful constant for referring to the fourth week in a month
extern int const DTC_FOURTH_WEEK_IN_MONTH;

//	A useful constant for referring to the last week in a month
extern int const DTC_LAST_WEEK_IN_MONTH;

//	Useful range constant
extern int const DTC_INCLUDE_NONE;

//	Useful range constant
extern int const DTC_INCLUDE_FIRST;

//	Useful range constant
extern int const DTC_INCLUDE_SECOND;

//	Useful range constant
extern int const DTC_INCLUDE_BOTH;

//	Useful constant for specifying a day of the week relative to a fixed date
extern int const DTC_PRECEDING;

//	Useful constant for specifying a day of the week relative to a fixed date
extern int const DTC_NEAREST ;

//	Useful constant for specifying a day of the week relative to a fixed date
extern int const DTC_FOLLOWING;

@interface DTCSerialDate : NSObject {
@private
	//	A description for the date
	NSString *description;
}

+ (BOOL) isValidWeekdayCode: (int) aCode;
 
/*
 *	Converts the supplied string to a day of the week.
 */
//+ (int) stringToWeekdayCode: (NSString *) aStr;
  
/*
 *	Returns a string representing the supplied day-of-the-week. Need to find a better approach.
 */
//+ (NSString *) weekdayCodeToString: (int) aWeekday;

/*
 *	Returns an array of month names.
 */
//+ (NSMutableArray *) getMonths;
	
/*
 *	Returns an array of month names.
 */
//+ (NSMutableArray *) getMonthsWithShort: (BOOL) aFlag;
	 
/*
 *	Returns true if the supplied integer code represents a valid month.
 */
+ (BOOL) isValidMonthCode: (int) aCode;

/*
 *	Returns the quarter for the specified month.
 */
+ (int) monthCodeToQuarter: (int) aCode;

/*
 *	Returns a string representing the supplied month. The string returned is the long form of the month name taken from the default locale.
 */
+ (NSString *) monthCodeToString: (int) aMonth;
		
/*
 *	Returns a string representing the supplied month. The string returned is the long or short form of the month name
 *	taken from the default locale.
 */
+ (NSString *) monthCodeToStringWithMonth: (int) aMonth shortened: (BOOL) aFlag;
		 
/*
 *	Converts a string to a month code. This method will return one of the constants JANUARY, FEBRUARY, ..., DECEMBER that
 *	corresponds to the string. If the string is not recognised, this method returns -1.
 */
+ (int) stringToMonthCode: (NSString *) aStr;
		  
/*
 *	Returns true if the supplied integer code represents a valid  week-in-the-month, and false otherwise.
 */
+ (BOOL) isValidWeekInMonthCode: (int) aCode;

/*
 *	Determines whether or not the specified year is a leap year.
 */
+ (BOOL) isLeapYear: (int) aYyyy;
			
/*
 *	Returns the number of leap years from 1900 to the specified year INCLUSIVE.
 */
+ (int) leapYearCountWithYear: (int) aYyyy;

/*
 *	Returns the number of the last day of the month, taking into account leap years.
 */
+ (int) lastDayOfMonthWithMonth: (int) aMonth year: (int) aYyyy;
			  
/*
 *	Creates a new date by adding the specified number of days to the base date.
 */
+ (DTCSerialDate *) addDaysWithDays: (int) aDays base: (DTCSerialDate *) aBase;
			   
/*
 *	Creates a new date by adding the specified number of months to the base date.
 *	If the base date is close to the end of the month, the day on the result may be adjusted slightly: 31 May + 1 month = 30 June.
 */
+ (DTCSerialDate *) addMonthsWithMonths: (int) aMonths base: (DTCSerialDate *) aBase;
				
/*
 *	Creates a new date by adding the specified number of years to the base date.
 */
+ (DTCSerialDate *) addYearsWithYears: (int) aYears base: (DTCSerialDate *) aBase;
				 
/*
 *	Returns the latest date that falls on the specified day-of-the-week and is BEFORE the base date.
 */
//+ (DTCSerialDate *) getPreviousDayOfWeekWithWeekday: (int) aTargetWeekday base: (DTCSerialDate *) aBase;
				  
/*
 *	Returns the earliest date that falls on the specified day-of-the-week and is AFTER the base date.
 */
//+ (DTCSerialDate *) getFollowingDayOfWeekWithWeekday: (int) aTargetWeekday base: (DTCSerialDate *) aBase;
				   
/*
 *	Returns the date that falls on the specified day-of-the-week and is CLOSEST to the base date.
 */
//+ (DTCSerialDate *) getNearestDayOfWeekWithWeekday: (int) aTargetWeekday base: (DTCSerialDate *) aBase;

/*
 *	Rolls the date forward to the last day of the month.
 */
//- (DTCSerialDate *) getEndOfCurrentMonthWithBase: (DTCSerialDate *) aBase;

/*
 *	Returns a string corresponding to the week-in-the-month code. Need to find a better approach.
 */
//+ (NSString *) weekInMonthToString: (int) aCode;
					 
/*
 *	Returns a string representing the supplied 'relative'. Need to find a better approach.
 */
//+ (NSString *) relativeToString: (int) aRelative;
					   
/*
 *	Factory method that returns an instance of some concrete subclass of SerialDate.
 */
+ (DTCSerialDate *) createInstanceWithDay: (int) aDay month: (int) aMonth year: (int) aYyyy;
						
/*
 *	Factory method that returns an instance of some concrete subclass of SerialDate.
 */
+ (DTCSerialDate *) createInstanceWithSerial: (int) aSerial;
						 
/*
 *	Factory method that returns an instance of a subclass of SerialDate.
 */
//+ (DTCSerialDate *) createInstanceWithDate: (NSDate *) aDate;
						  
/*
 *	Returns the serial number for the date, where 1 January 1900 = 2 (this corresponds, almost, to the numbering system used
 *	in Microsoft Excel for Windows and Lotus 1-2-3).
 */
- (int) toSerial;
						   
/*
 *	Returns a NSDate. Since NSDate has more precision than DTCSerialDate, we need to define a convention for the 'time of day'.
 */
- (NSDate *) toNSDate;
							
- (NSString *) getDescription;
- (void) setDescription: (NSString *) aDescription;
							  
/*
 *	Converts the date to a string.
 */
- (NSString *) toString;
							   
/*
 *	Returns the year (assume a valid range of 1900 to 9999).
 */
- (int) getYYYY;
								
/*
 *	Returns the month (January = 1, February = 2, March = 3).
 */
- (int) getMonth;
								 
/*
 *	Returns the day of the month.
 */
- (int) getDayOfMonth;
								  
/*
 *	Returns the day of the week.
 */
- (int) getDayOfWeek;
								   
/*
 *	Returns the difference (in days) between this date and the specified 'other' date.
 *	The result is positive if this date is after the 'other' date and negative if it is before the 'other' date.
 */
- (int) compareWithSerialDate: (DTCSerialDate *) anOther;
									
/*
 *	Returns true if this SerialDate represents the same date as the specified SerialDate.
 */
- (BOOL) isOn: (DTCSerialDate *) anOther;

/*
 *	Returns true if this SerialDate represents an earlier date compared tothe specified SerialDate.
 */
- (BOOL) isBefore: (DTCSerialDate *) anOther;

/*
 *	Returns true if this SerialDate represents the same date as the specified SerialDate.
 */
- (BOOL) isOnOrBefore: (DTCSerialDate *) anOther;

/*
 *	Returns true if this SerialDate represents the same date as the specified SerialDate.
 */
- (BOOL) isAfter: (DTCSerialDate *) anOther;

/*
 *	Returns true if this SerialDate represents the same date as the specified SerialDate.
 */
- (BOOL) isOnOrAfter: (DTCSerialDate *) anOther;

/*
 *	Returns true if this SerialDate is within the specified range (INCLUSIVE). The date order of d1 and d2 is not important.
 */
- (BOOL) isInRange: (DTCSerialDate *) d1 and: (DTCSerialDate *) d2;

/*
 *	Returns true if this SerialDate is within the specified range (caller specifies whether or not the end-points are 
 *	included). The date order of d1 and d2 is not important.
 */
- (BOOL) isInRange: (DTCSerialDate *) d1 and: (DTCSerialDate *) d2 include: (int) anInclude;
										   
/*
 *	Returns the latest date that falls on the specified day-of-the-week and is BEFORE this date.
 */
//- (DTCSerialDate *) getPreviousDayOfWeek: (int) aTargetDOW;
											
/*
 *	Returns the earliest date that falls on the specified day-of-the-week and is AFTER this date.
 */
//- (DTCSerialDate *) getFollowingDayOfWeek: (int) aTargetDOW;
											 
/*
 *	Returns the nearest date that falls on the specified day-of-the-week.
 */
//- (DTCSerialDate *) getNearestDayOfWeek: (int) aTargetDOW;

+ (int) getLastDayOfMonthWithMonth: (int) aMonth;

+ (int) getAggregateDaysToEndOfMonth: (int) aMonth;

+ (int) getAggregateDaysToEndOfPrecedingMonth: (int) aMonth;

+ (int) getLeapYearAggregateDaysToEndOfMonth: (int) aMonth;

+ (int) getLeapYearAggregateDaysToEndOfPrecedingMonth: (int) aMonth;

+ (NSDate *) convertStringToDate: (NSString *) aStr format: (NSString *) aFormat;

@end
