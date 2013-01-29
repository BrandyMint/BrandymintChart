
#import <Foundation/Foundation.h>

#import "DTCIValues2D.h"

@interface DTCDataUtilities : NSObject {
}



/*
 *	Returns the total of the values in one column of the supplied data table.
 */
+ (double) calculateColumnTotalWithData: (id <DTCIValues2D>) aData column: (int) aColumn;

/*
 *	Returns the total of the values in one column of the supplied data table by taking only the row numbers in the array into account.
 */
+ (double) calculateColumnTotalWithData: (id <DTCIValues2D>) aData column: (int) aColumn validRows: (NSMutableArray *) aValidRows;


@end
