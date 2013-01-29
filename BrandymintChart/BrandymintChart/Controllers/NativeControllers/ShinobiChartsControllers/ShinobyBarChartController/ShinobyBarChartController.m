//
//  ShinobyBarChartController.m
//  BrandymintChart
//
//  Created by DenisDbv on 29.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "ShinobyBarChartController.h"
#import "ShinobiChart+BarChart.h"

@interface ShinobyBarChartController ()

@end

@implementation ShinobyBarChartController

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sChartRenderFinished:(ShinobiChart *)chart {
    BOOL iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    
    //use multi-line title on the yAxis for iPad
    if (iPad) {
        chart.yAxis.titleLabel.numberOfLines = 0;
        [chart.yAxis.titleLabel sizeToFit];
    }
}

-(void) reloadCurrentController
{
    if(barChart != nil) return;
    //Create a chart object capable of displaying countries by area using bars
    barChart = [ShinobiChart barChartForCountryByAreaWithFrame:self.baseView.bounds];
    
    //Enter your trial license key here
    barChart.licenseKey = @"hjWhq0JgoOgvvZ5MjAxMzAyMjhpbmZvQHNoaW5vYmljb250cm9scy5jb20=BEOZ6VzrCBEs5cpeIODa/KY2+rBP4OJvMk+I61NMPtItTrL+AE8V9HRUduAeax45WgkOpsX9NA9SRavZtn5D6wmWnZhvEBLohM8MYTWv4C93Ebtl79iWdNcbakVsELBauhP9U0SXqs5vG1jJuIWO2MmZK5nI=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+ ";
    
    barChart.title = @"Top Ten Countries by Area";
    
    //Create our top ten data and assign it to our datasource
    topTenCountriesAreaData = [TopTenCountriesAreaData new];
    dataSource = [Datasource2 new];
    dataSource.countriesAreaData = topTenCountriesAreaData;
    barChart.datasource = dataSource;
    
    //set this controller to be the delegate for our chart
    barChart.delegate = self;
    
    [self.baseView addSubview:barChart];
    
    self.baseView.backgroundColor = barChart.backgroundColor;
}

-(void) clearCurrentController
{
    //[barChart removeFromSuperview];
}

-(void) viewWillLayoutSubviews
{
    
}

@end
