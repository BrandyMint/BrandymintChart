//
//  StockData.h
//  FinancialChart
//
//  Created by Stuart Grey on 23/09/2012.
//  Copyright (c) 2012 Stuart Grey. All rights reserved.
//

#import <Foundation/Foundation.h>

//The stock data (inside our datasource) must conform to this
@protocol StockData <NSObject>

@required
- (NSMutableArray*)data;

@end
