//
//  DetailViewController.h
//  BrandymintChart
//
//  Created by denisdbv@gmail.com on 24.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGSplitViewController.h"

@interface DetailViewController : UIViewController <MGSplitViewControllerDelegate>
{
    IBOutlet UIBarButtonItem *showHide;
    IBOutlet MGSplitViewController *splitController;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollCards;

-(IBAction) showLeftPanel:(id)sender;

@end
