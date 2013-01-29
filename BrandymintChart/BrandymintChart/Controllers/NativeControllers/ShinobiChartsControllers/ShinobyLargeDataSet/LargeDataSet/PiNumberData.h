//
//  PiNumberData.h
//  LargeDataSet

#import <Foundation/Foundation.h>
#import "NumberData.h"

//PiNumberData class is used to retrieve contents of .txt file
@interface PiNumberData : NSObject <NumberData>

@property (nonatomic) NSArray *data;

@end
