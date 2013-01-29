//
//  NumberData.h
//  LargeDataSet

#import <Foundation/Foundation.h>

//Number data must conform to this - our chart datasource can then understand it
@protocol NumberData <NSObject>

@required
- (NSArray*)data;

@end
