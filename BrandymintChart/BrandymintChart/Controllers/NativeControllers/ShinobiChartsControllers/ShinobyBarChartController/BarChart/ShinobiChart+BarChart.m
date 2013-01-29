//
//  ShinobiChart+BarChart.m
//  BarChart

#import "ShinobiChart+BarChart.h"
#import <ShinobiCharts/SChartLightTheme.h>
#import "CountriesAreaData.h"

@implementation ShinobiChart (BarChart)

+ (ShinobiChart*)barChartForCountryByAreaWithFrame:(CGRect)frame {
    BOOL iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    
    ShinobiChart *chart;
    
    if (iPad) {
        frame.origin.x += 10;
        frame.origin.y += 50;
        frame.size.width -= 50;
        frame.size.height -= 100;
    } else {
        frame.size.width -= 10;
    }
    
    chart = [[ShinobiChart alloc] initWithFrame:frame];
    chart.autoresizingMask = ~UIViewAutoresizingNone;
    
    //We want to use the lighter theme
    chart.theme = [SChartLightTheme new];
    
    //Bars are horizontal - which means this axis has our data values
    SChartNumberAxis *xAxis = [SChartNumberAxis new];
    xAxis.title = @"Country";
    xAxis.rangePaddingHigh = [NSNumber numberWithInt:2500000];
    chart.xAxis = xAxis;
    
    //A category axis displays each country
    SChartCategoryAxis *yAxis = [SChartCategoryAxis new];
    //Our title will be over two lines on the iPad
    yAxis.title = @"Area covered\n(Sq. km)";
    chart.yAxis = yAxis;
    
    if (iPad) {
        chart.legend.hidden = NO;
        chart.legend.position = SChartLegendPositionBottomRight;
        chart.legend.placement = SChartLegendPlacementInsidePlotArea;
    }
    
    return chart;
}

- (NSString*)titleForKey:(NSString*)key {
    NSString *title = nil;
    
    if ([key isEqualToString:land]) {
        title = @"Land";
    } else if ([key isEqualToString:water]) {
        title = @"Water";
    }
    
    return title;
}

- (SChartSeries*)barSeriesForKey:(NSString*)key {
    
    SChartBarSeries *series = [SChartBarSeries new];
    series.stackIndex = [NSNumber numberWithInt:1];
    
    series.title = [self titleForKey:key];
    
    if ([key isEqualToString:land]) {
        series.style = [self.theme barSeriesStyleForSeriesAtIndex:3 selected:NO];
    }
    
    return series;
}


@end
