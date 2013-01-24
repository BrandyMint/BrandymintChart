//
//  RootViewController.h
//  BrandymintChart
//
//  Created by denisdbv@gmail.com on 24.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface RootViewController : UITableViewController
{
    DetailViewController *detailViewController;
}

@property (nonatomic, strong) IBOutlet DetailViewController *detailViewController;

@end
