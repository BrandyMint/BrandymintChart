//
//  KeepEdgeController.m
//  BrandymintChart
//
//  Created by DenisDbv on 30.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "KeepEdgeController.h"
#import "KeepEdgeView.h"

@interface KeepEdgeController ()

@end

@implementation KeepEdgeController
{
    KeepEdgeView *cgv;
    int testIndex;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil indexIn:(int)index
{
    testIndex = index;
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    cgv = [[KeepEdgeView alloc] initWithFrame:self.view.frame demoIdx:testIndex];
    self.view = cgv;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) reloadCurrentController
{
    
}

-(void) clearCurrentController
{
    
}

-(void) viewWillLayoutSubviews
{
    [cgv setNeedsDisplay];
}

@end
