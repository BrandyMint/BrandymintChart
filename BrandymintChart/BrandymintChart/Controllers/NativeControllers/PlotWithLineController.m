//
//  PlotWithLineController.m
//  BrandymintChart
//
//  Created by denisdbv@gmail.com on 29.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "PlotWithLineController.h"

@interface PlotWithLineController ()

@end

@implementation PlotWithLineController
{
    PCPieChart *pieChart;
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
    
    int height = [self.controlView bounds].size.height; // 220;
    int width = [self.controlView bounds].size.width; //320;
    pieChart = [[PCPieChart alloc] initWithFrame:CGRectMake(([self.view bounds].size.width-width)/2,([self.view bounds].size.height-height)/2,width,height)];
    [pieChart setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin];
    [pieChart setDiameter:width/2];
    [pieChart setSameColorLabel:YES];
    
    [self.controlView addSubview:pieChart];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom]==UIUserInterfaceIdiomPad)
    {
        pieChart.titleFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:30];
        pieChart.percentageFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:50];
    }
    
    NSString *sampleFile = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"sample_piechart_data.plist"];
    NSDictionary *sampleInfo = [NSDictionary dictionaryWithContentsOfFile:sampleFile];
    NSMutableArray *components = [NSMutableArray array];
    for (int i=0; i<[[sampleInfo objectForKey:@"data"] count]; i++)
    {
        NSDictionary *item = [[sampleInfo objectForKey:@"data"] objectAtIndex:i];
        PCPieComponent *component = [PCPieComponent pieComponentWithTitle:[item objectForKey:@"title"] value:[[item objectForKey:@"value"] floatValue]];
        [components addObject:component];
        
        if (i==0)
        {
            [component setColour:PCColorYellow];
        }
        else if (i==1)
        {
            [component setColour:PCColorGreen];
        }
        else if (i==2)
        {
            [component setColour:PCColorOrange];
        }
        else if (i==3)
        {
            [component setColour:PCColorRed];
        }
        else if (i==4)
        {
            [component setColour:PCColorBlue];
        }
    }
    [pieChart setComponents:components];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated
{
    //[self.pieChartLeft reloadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

-(void) reloadCurrentController
{
    
}

-(void) clearCurrentController
{
    
}

-(void) viewWillLayoutSubviews
{
    CGRect baseRect = self.baseView.frame;
    CGRect controlRect = self.controlView.frame;
    
    CGRect switchRect = self.switchView.frame;
    
    controlRect.origin.x = (baseRect.size.width - controlRect.size.width)/2;
    controlRect.origin.y = (baseRect.size.height - controlRect.size.height)/2;
    switchRect.origin.x = (baseRect.size.width - switchRect.size.width)/2;
    
    self.controlView.frame = controlRect;
    self.switchView.frame = switchRect;
}

- (IBAction)showSlicePercentage:(id)sender
{
    UISwitch *perSwitch = (UISwitch *)sender;
    [pieChart setShowArrow:perSwitch.isOn];
    
    [pieChart setNeedsDisplay];
}

@end
