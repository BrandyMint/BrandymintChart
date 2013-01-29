
#import <Foundation/Foundation.h>

@protocol DTCIValues2D

- (int) getRowCount;

- (int) getColumnCount;

- (NSNumber *) getValueWithRow: (int) aRow column: (int) aCol;

@end

