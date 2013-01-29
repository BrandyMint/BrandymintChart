//
//  FinancialChartController.m
//  BrandymintChart
//
//  Created by DenisDbv on 29.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "FinancialChartController.h"
#import "ShinobiChart+CandlestickChart.h"
#import "Datasource4.h"

@interface FinancialChartController ()

@end

@implementation FinancialChartController
{
    BOOL firstChartRender;
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
    
    BOOL iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    
    CGRect frame = self.view.bounds;
    
    //alter chart frame based on device
    if (iPad) {
        frame.origin.x += 10;
        frame.origin.y += 50;
        frame.size.width -= 50;
        frame.size.height -= 100;
    } else {
        frame = self.view.bounds;
    }
    frame = self.baseView.bounds;
    //Create a chart object capable of displaying countries by area using bars
    financialChart = [ShinobiChart candlestickChartForStockData:frame];
    
    //Enter your trial license key here
    financialChart.licenseKey = @"hjWhq0JgoOgvvZ5MjAxMzAyMjhpbmZvQHNoaW5vYmljb250cm9scy5jb20=BEOZ6VzrCBEs5cpeIODa/KY2+rBP4OJvMk+I61NMPtItTrL+AE8V9HRUduAeax45WgkOpsX9NA9SRavZtn5D6wmWnZhvEBLohM8MYTWv4C93Ebtl79iWdNcbakVsELBauhP9U0SXqs5vG1jJuIWO2MmZK5nI=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+ ";
    
    //We want to use a darker theme
    financialChart.theme = [SChartDarkTheme new];
    financialChart.title = @"Historical Nasdaq Prices - Apple Inc. (AAPL)";
    
    //Create our Apple stock data and assign it to our datasource
    appleStockData = [AppleStockData new];
    datasource = [Datasource4 new];
    datasource.stockData = appleStockData;
    financialChart.datasource = datasource;
    
    //Set this controller to be the delegate for our chart
    financialChart.delegate = self;
    [self.baseView addSubview:financialChart];
    
    self.baseView.backgroundColor = financialChart.backgroundColor;
    
    firstChartRender = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sChartRenderStarted:(ShinobiChart *)chart withFullRedraw:(BOOL)fullRedraw {
    if (firstChartRender) {
        
        //Setup date range before first render
        NSDate *min = [NSDate dateWithTimeIntervalSince1970:1341702000];
        NSDate *max = [NSDate dateWithTimeIntervalSince1970:1347577200];
        
        SChartDateRange *dr = [[SChartDateRange alloc] initWithDateMinimum:min andDateMaximum:max];
        chart.xAxis.defaultRange = dr;
        [chart.xAxis setRangeWithMinimum:min andMaximum:max];
        
        [chart redrawChart];
    }
}

- (void)sChartRenderFinished:(ShinobiChart *)chart {
    if (firstChartRender) {
        firstChartRender = NO;
        
        //Now setup annotations - each 'annotation' will have a line annotation and a label annotation
        
        //Setup a 90 degree rotation transform to use with our label annotations
        CGAffineTransform rotationTransform = CGAffineTransformRotate(CGAffineTransformIdentity, -M_PI/2);
        
        struct
        {
            NSTimeInterval date;
            int yPosition;
            const char *label;
        } announcementTable[] = {
            { 1347436800,  580,  "iPhone5 Announced"   },
            { 1317974400,  550,  "iPhone4S Released"   },
            { 1277366400,  400,  "iPhone4 Released"    },
            { 1245398400,  280,  "iPhone3GS Released"  },
            { 1215763200,  300,  "iPhone3G Released"   },
            { 1183104000,  250,  "iPhone Released"     },
            { } // terminator
        };
        
        
        
        for(int i = 0; announcementTable[i].date; i++){
            //Setup LINE annotation
            NSDate *releaseDate = [NSDate dateWithTimeIntervalSince1970:announcementTable[i].date];
            
            SChartAnnotation *releaseAnnotation = [SChartAnnotation verticalLineAtPosition:releaseDate
                                                                                 withXAxis:financialChart.xAxis
                                                                                  andYAxis:financialChart.yAxis
                                                                                 withWidth:2.f
                                                                                 withColor:chart.plotAreaBorderColor];
            
            releaseAnnotation.position = SChartAnnotationBelowData;
            [financialChart addAnnotation:releaseAnnotation];
            
            //Setup LABEL annotation
            SChartAnnotation *releaseLabel = [SChartAnnotation annotationWithText:[NSString stringWithUTF8String:announcementTable[i].label]
                                                                          andFont:[UIFont fontWithName:@"Nunito-Light" size:14.f]
                                                                        withXAxis:chart.xAxis
                                                                         andYAxis:chart.yAxis
                                                                      atXPosition:releaseDate
                                                                     andYPosition:@(announcementTable[i].yPosition)
                                                                    withTextColor:[UIColor whiteColor]
                                                              withBackgroundColor:chart.plotAreaBackgroundColor];
            
            releaseLabel.transform = rotationTransform;
            releaseLabel.position = SChartAnnotationBelowData;
            [financialChart addAnnotation:releaseLabel];
        }
    }
    
}

- (void)sChart:(ShinobiChart *)chart alterTickMark:(SChartTickMark *)tickMark beforeAddingToAxis:(SChartAxis *)axis {
    axis.style.majorGridLineStyle.showMajorGridLines = NO;
    
    //Hide any tickmarks over 40M on the right y-axis
    if (axis == [chart.allYAxes lastObject]) {
        if (tickMark.value > 40.f) {
            tickMark.tickLabel.text = @"";
            tickMark.tickMarkView.hidden = YES;
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
