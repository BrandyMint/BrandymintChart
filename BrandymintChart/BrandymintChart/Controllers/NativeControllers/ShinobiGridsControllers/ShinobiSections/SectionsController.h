//
//  SectionsController.h
//  BrandymintChart
//
//  Created by DenisDbv on 29.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "CardViewController.h"
#import <ShinobiGrids/ShinobiGrid.h>
#import "DataSource11.h"

@interface SectionsController : CardViewController <SGridDelegate>
{
    ShinobiGrid *grid;
}

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UIView *controlView;

@end
