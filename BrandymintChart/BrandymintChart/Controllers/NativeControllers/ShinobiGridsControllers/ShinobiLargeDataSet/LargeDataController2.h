//
//  LargeDataController.h
//  BrandymintChart
//
//  Created by DenisDbv on 29.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "CardViewController.h"
#import <ShinobiGrids/ShinobiGrid.h>
#import "DataSource8.h"

@interface LargeDataController2 : CardViewController
{
    ShinobiGrid *spreadSheet;
    DataSource8 *datasource;
}

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UIView *controlView;

@end
