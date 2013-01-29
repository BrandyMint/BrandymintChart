//
//  TopTenCountriesAreaData.h
//  BarChart

#import <Foundation/Foundation.h>
#import "CountriesAreaData.h"

//Our countries area data - in this case it's the top ten countries
@interface TopTenCountriesAreaData : NSObject <CountriesAreaData>

@property (nonatomic) NSMutableDictionary *data;
@property (nonatomic) NSArray *dataKeys;
@property (nonatomic) NSArray *countries;

@end
