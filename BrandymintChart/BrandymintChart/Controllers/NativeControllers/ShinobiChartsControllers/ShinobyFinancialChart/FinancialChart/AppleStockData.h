//
//  AppleStockData.h
//  FinancialChart
//
//  Created by Stuart Grey on 23/09/2012.
//  Copyright (c) 2012 Stuart Grey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockData.h"

@interface AppleStockData : NSObject <StockData>

@property (nonatomic)  NSMutableArray *data;

@end
