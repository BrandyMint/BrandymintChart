//
//  ShinobyColumnChartController.m
//  BrandymintChart
//
//  Created by DenisDbv on 29.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "ShinobyColumnChartController.h"
#import "ShinobiChart+columnChart.h"
#import <ShinobiCharts/SChartDarkTheme.h>

@interface ShinobyColumnChartController ()

@end

@implementation ShinobyColumnChartController

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
    
    //Create a chart object capable of displaying UK weather data using columns
    columnChart = [ShinobiChart columnChartForWeatherWithFrame:self.baseView.bounds];//view.bounds];
    columnChart.title = @"Monthly UK Weather Summary";
    
    //Enter your trial license key here
    columnChart.licenseKey = @"hjWhq0JgoOgvvZ5MjAxMzAyMjhpbmZvQHNoaW5vYmljb250cm9scy5jb20=BEOZ6VzrCBEs5cpeIODa/KY2+rBP4OJvMk+I61NMPtItTrL+AE8V9HRUduAeax45WgkOpsX9NA9SRavZtn5D6wmWnZhvEBLohM8MYTWv4C93Ebtl79iWdNcbakVsELBauhP9U0SXqs5vG1jJuIWO2MmZK5nI=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+ ";
    
    //Create weather data and then assign it to our datasource
    ukWeatherData = [UKWeatherData new];
    datasource = [[Datasource3 alloc] init];
    datasource.weatherdata = ukWeatherData;
    columnChart.datasource = datasource;
    
    //set this controller to be the delegate for our chart
    columnChart.delegate = self;
    
    [self.baseView addSubview:columnChart];
    
    self.view.backgroundColor = columnChart.theme.chartStyle.backgroundColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sChart:(ShinobiChart *)chart alterTickMark:(SChartTickMark *)tickMark beforeAddingToAxis:(SChartAxis *)axis {
    if (chart.yAxis != axis && tickMark.value > 30.f) {
        //Limit second y-axis labels to max of 30
        tickMark.tickLabel.text = @"";
        tickMark.tickMarkView.hidden = YES;
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
