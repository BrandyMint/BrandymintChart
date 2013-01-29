//
//  CountriesAreaData.h
//  BarChart

#import <Foundation/Foundation.h>

#define land @"land"
#define water @"water"

//Countries area data must conform to this - our chart datasource
//can then understand it
@protocol CountriesAreaData <NSObject>

@required
- (NSMutableDictionary*)data;
- (NSArray*)dataKeys;
- (NSArray*)countries;

@end
