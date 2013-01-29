//
//  LineChartController.m
//  BrandymintChart
//
//  Created by DenisDbv on 29.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "LineChartController.h"
#import "ShinobiChart+LineChart2.h"

@interface LineChartController ()

@end

@implementation LineChartController

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
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //Create a chart object suitable for viewing our data
    lineChart = [ShinobiChart lineChartForBrowserUsageWithFrame:self.view.bounds];
    lineChart.title = @"Mobile browser use";
    
    //Enter you trial license key here
    lineChart.licenseKey = @"hjWhq0JgoOgvvZ5MjAxMzAyMjhpbmZvQHNoaW5vYmljb250cm9scy5jb20=BEOZ6VzrCBEs5cpeIODa/KY2+rBP4OJvMk+I61NMPtItTrL+AE8V9HRUduAeax45WgkOpsX9NA9SRavZtn5D6wmWnZhvEBLohM8MYTWv4C93Ebtl79iWdNcbakVsELBauhP9U0SXqs5vG1jJuIWO2MmZK5nI=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+ ";
    
    //Initialise our data and assign it to the data source - then assign the datasource to our chart
    mobileBrowserUsageStats = [MobileBrowserUsageStats new];
    datasource = [Datasource6 new];
    datasource.browserUsageStats = mobileBrowserUsageStats;
    lineChart.datasource = datasource;
    
    //Use this controller as our delegate
    lineChart.delegate = self;
    
    //add our chart to the main view
    [self.view addSubview:lineChart];
    
    
    //fill our border with the same background as the chart
    self.view.backgroundColor = lineChart.backgroundColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ShinobiChart Delegate
- (void)sChart:(ShinobiChart *)chart alterTickMark:(SChartTickMark *)tickMark beforeAddingToAxis:(SChartAxis *)axis {
    //remove some of the tickmarks in portrait
    if ([axis isXAxis]) {
        
        BOOL iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
        if (!iPad || UIInterfaceOrientationIsPortrait([[UIDevice currentDevice] orientation])) {
            
            //xAxis is a category, each tick value is 1,2,3,4,.. etc
            //a mod 2 operation will give us every other xValue
            if ((int)tickMark.value%2) {
                tickMark.tickLabel.text = @"";
            }
        }
    }
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
