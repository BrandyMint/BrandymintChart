//
//  AppleStockData.m
//  FinancialChart
//
//  Created by Stuart Grey on 23/09/2012.
//  Copyright (c) 2012 Stuart Grey. All rights reserved.
//

#import "AppleStockData.h"

//This class will load the Apple stock data from a csv - see appleData.csv
@implementation AppleStockData

- (id)init {
    self = [super init];
    if (self) {
        
        _data = [NSMutableArray new];
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"appleData" ofType:@"csv"];
        NSString* fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        
        NSArray* allLinedStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        
        for (NSString *s in allLinedStrings) {
            if (s.length > 0) {
                NSArray *parts = [s componentsSeparatedByString:@","];
                [_data insertObject:parts atIndex:0];
            }
        }
        
    }
    return self;
}


@end
