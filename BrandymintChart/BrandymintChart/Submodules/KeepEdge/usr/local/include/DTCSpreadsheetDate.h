
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCSerialDate.h"

@interface DTCSpreadsheetDate : DTCSerialDate <DTCIComparable> {
@private
	//	The day number (1-Jan-1900 = 2, 2-Jan-1900 = 3, ..., 31-Dec-9999 = 2958465)
	int serial;
	//	The day of the month (1 to 28, 29, 30 or 31 depending on the month)
	int day;
	//	The month of the year (1 to 12)
	int month;
	//	The year (1900 to 9999)
	int year;
}

- (id) initWithDay: (int) aDay month: (int) aMonth year: (int) aYear;

- (id) initWithSerial: (int) aSerial;

/*
 *	Returns a Date equivalent to this date.
 */
- (NSDate *) toDate;

@end
