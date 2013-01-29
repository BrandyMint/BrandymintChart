//
//  LargeDataController.m
//  BrandymintChart
//
//  Created by DenisDbv on 29.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "LargeDataController2.h"
#import <QuartzCore/QuartzCore.h>

@interface LargeDataController2 ()

@end

@implementation LargeDataController2

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
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [iv setImage:[UIImage imageNamed:@"ios-linen.png"]];
    iv.autoresizingMask = ~UIViewAutoresizingNone;
    [self.view addSubview:iv];
    [iv release];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        UIImageView *headerView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo_black.png"]];
        [headerView setFrame:CGRectMake((self.view.bounds.size.width-446) / 2, 0, 446, 92)];
        headerView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [self.view addSubview:headerView];
        [headerView release];
        
        //Create the grid
        spreadSheet = [[ShinobiGrid alloc] initWithFrame:CGRectMake(50, 150, self.view.bounds.size.width-100, self.view.bounds.size.height-200)];
    } else {
        //Create the grid
        spreadSheet = [[ShinobiGrid alloc] initWithFrame:self.view.bounds];
    }
    
    spreadSheet.licenseKey = @"hjWhq0JgoOgvvZ5MjAxMzAyMjhpbmZvQHNoaW5vYmljb250cm9scy5jb20=BEOZ6VzrCBEs5cpeIODa/KY2+rBP4OJvMk+I61NMPtItTrL+AE8V9HRUduAeax45WgkOpsX9NA9SRavZtn5D6wmWnZhvEBLohM8MYTWv4C93Ebtl79iWdNcbakVsELBauhP9U0SXqs5vG1jJuIWO2MmZK5nI=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+ ";
    
    spreadSheet.autoresizingMask = ~UIViewAutoresizingNone;
    
    //Setup the data source for the grid
    datasource = [[DataSource8 alloc] init];
    spreadSheet.dataSource = datasource;
    
    //Freeze our top and left most rows
    [spreadSheet freezeRowsAboveAndIncludingRow:SGridRowMake(0, 0)];
    [spreadSheet freezeColsToTheLeftOfAndIncludingIndex:0];
    
    //Some basic grid styling
    spreadSheet.backgroundColor = [UIColor clearColor];
    spreadSheet.rowStylesTakePriority = YES;
    spreadSheet.defaultGridLineStyle.width = 1.0f;
    spreadSheet.defaultGridLineStyle.color = [UIColor lightGrayColor];
    spreadSheet.defaultBorderStyle.color = [UIColor darkGrayColor];
    spreadSheet.defaultBorderStyle.width = 1.0f;
    [spreadSheet.layer setCornerRadius:10.f];
    
    //provide default row heights and col widths
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        spreadSheet.defaultRowStyle.size = [NSNumber numberWithFloat:30];
        spreadSheet.defaultColumnStyle.size = [NSNumber numberWithFloat:100];
    } else {
        spreadSheet.defaultRowStyle.size = [NSNumber numberWithFloat:20];
        spreadSheet.defaultColumnStyle.size = [NSNumber numberWithFloat:50];
    }
    
    //ensure that section header is hidden (a grid has one section by default)
    spreadSheet.defaultSectionHeaderStyle.hidden = YES;
    
    //We want to be able to edit our cells
    spreadSheet.canEditCellsViaDoubleTap = YES;
    
    //Disable all dragging - we don't want to be able to reorder in any direction
    spreadSheet.canReorderColsViaLongPress = NO;
    spreadSheet.canReorderRowsViaLongPress = NO;
    
    [self.view addSubview:spreadSheet];
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
    
}

@end
