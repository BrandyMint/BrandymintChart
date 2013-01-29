//
//  ShinobiChart+LineChart.m
//  LargeDataSet

#import "ShinobiChart+LineChart.h"

@implementation ShinobiChart (LineChart)

+ (ShinobiChart*)lineChartWithFrame:(CGRect)frame {

    BOOL iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    
    if (iPad) {
        frame.origin.x += 10;
        frame.origin.y += 50;
        frame.size.width -= 50;
        frame.size.height -= 100;
    } else {
        frame.size.width -= 10;
    }
    
    ShinobiChart *chart = [[ShinobiChart alloc] initWithFrame:frame];
    chart.autoresizingMask = ~UIViewAutoresizingNone;
    
    //Use the light theme
    chart.theme = [SChartLightTheme new];
    
    //Use a fixed range to start - there is too much to display in one go!
    SChartNumberRange *r = [[SChartNumberRange alloc] initWithMinimum:[NSNumber numberWithInt:0] andMaximum:[NSNumber numberWithInt:25]];
    chart.xAxis = [[SChartNumberAxis alloc] initWithRange:r];
    chart.xAxis.enableGesturePanning = YES;
    chart.xAxis.enableGestureZooming = YES;
    chart.xAxis.enableMomentumPanning = YES;
    chart.xAxis.enableMomentumZooming = YES;
    chart.xAxis.title = @"Decimal Position";
    
    chart.yAxis = [SChartNumberAxis new];
    chart.yAxis.enableGesturePanning = YES;
    chart.yAxis.enableGestureZooming = NO;
    chart.yAxis.enableMomentumPanning = YES;
    chart.yAxis.enableMomentumZooming = YES;
    chart.yAxis.labelFormatString = @"%.0f";
    chart.yAxis.majorTickFrequency = [NSNumber numberWithInt:1];
    chart.yAxis.rangePaddingHigh = [NSNumber numberWithFloat:0.5f];
    chart.yAxis.rangePaddingLow = [NSNumber numberWithFloat:0.5f];
    chart.yAxis.width = iPad ? [NSNumber numberWithFloat:75.f] : [NSNumber numberWithFloat:45.f];
    chart.yAxis.title = @"Decimal Value";
    
    //Add a nice Pi logo to the background
    SChartAnnotationZooming *icon = [[SChartAnnotationZooming alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    icon.xValue = [NSNumber numberWithInt:0];
    icon.yValue = [NSNumber numberWithInt:0];
    icon.stretchToBoundsOnX = YES;
    icon.stretchToBoundsOnY = YES;
    icon.position = SChartAnnotationBelowData;
    
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pi.png"]];
    [icon addSubview:iconView];
    icon.alpha = 0.1f;
    [chart addAnnotation:icon];
    
    return chart;
}

- (SChartSeries*)seriesForKey:(NSString*)key {
    SChartStepLineSeries *l = [SChartStepLineSeries new];
    l.style.lineWidth = [NSNumber numberWithInt:2];
    l.style.pointStyle.showPoints = YES;
    return l;
}

@end
