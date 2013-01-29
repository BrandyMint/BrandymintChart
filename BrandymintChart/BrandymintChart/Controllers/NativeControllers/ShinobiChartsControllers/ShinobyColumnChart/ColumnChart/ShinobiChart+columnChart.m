//
//  ShinobiChart+columnChart.m
//  ColumnChart

#import "ShinobiChart+columnChart.h"
#import "WeatherData.h"
#import <ShinobiCharts/SChartDarkTheme.h>

@implementation ShinobiChart (columnChart)

+ (ShinobiChart*)columnChartForWeatherWithFrame:(CGRect)frame {
    
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
    chart.clipsToBounds = NO;
    chart.autoresizingMask = ~UIViewAutoresizingNone;
    
    //We want to use the darker theme
    chart.theme = [SChartDarkTheme new];
    
    //Setup category axis for x-axis - each category to represent a month
    SChartCategoryAxis *xAxis = [SChartCategoryAxis new];
    xAxis.title = @"Month";
    xAxis.style.majorGridLineStyle.showMajorGridLines = NO;
    xAxis.style.majorTickStyle.tickLabelOrientation = TickLabelOrientationVertical;
    chart.xAxis = xAxis;
    
    //Our chart will have two y-axis - one on left and one on right
    
    //Setup rainfall y-axis on left of chart
    SChartNumberRange *rainfallRange = [[SChartNumberRange alloc] initWithMinimum:[NSNumber numberWithInt:0] andMaximum:[NSNumber numberWithInt:300]];
    SChartNumberAxis *rainfallAxis = [[SChartNumberAxis alloc] initWithRange:rainfallRange];
    rainfallAxis.title = @"Rainfall (mm)";
    rainfallAxis.style.majorGridLineStyle.showMajorGridLines = NO;
    chart.yAxis = rainfallAxis;
    
    //setup temperature y-axis on right of chart
    SChartNumberRange *tempRange = [[SChartNumberRange alloc] initWithMinimum:[NSNumber numberWithInt:0] andMaximum:[NSNumber numberWithInt:50]];
    SChartNumberAxis *tempAxis = [[SChartNumberAxis alloc] initWithRange:tempRange];
    tempAxis.title = [NSString stringWithFormat:@"Temp (%@C)",@"\xC2\xB0"];
    tempAxis.axisPosition = SChartAxisPositionReverse;
    tempAxis.style.majorGridLineStyle.showMajorGridLines = NO;
    [chart addYAxis: tempAxis];
    
    if (iPad) {
        chart.legend.hidden = NO;
        chart.legend.position = SChartLegendPositionBottomMiddle;
        chart.legend.placement = SChartLegendPlacementOutsidePlotArea;
    }
    
    return chart;
}

- (NSString*)titleForKey:(NSString*)key {
    NSString *title = nil;
    
    if ([key isEqualToString:rainfall]) {
        title = @"Rainfall";
    } else if ([key isEqualToString:minTemp] || [key isEqualToString:maxTemp]) {
        title = @"Temp. Range";
    } else if ([key isEqualToString:meanTemp]) {
        title = @"Temp. Avg.";
    } else if ([key isEqualToString:sunshine]) {
        title = @"Sunshine";
    }
    return title;
}

- (SChartSeries*)weatherSeriesForKey:(NSString*)key {
    
    SChartSeries *series = nil;
    
    if ([key isEqualToString:rainfall]) {
        SChartLineSeries *lineSeries = [SChartLineSeries new];
        lineSeries.style = [self.theme lineSeriesStyleForSeriesAtIndex:1 selected:NO];
        lineSeries.style.showFill = YES;
        lineSeries.title = [self titleForKey:key];
        series = lineSeries;
        
    } else if ([key isEqualToString:minTemp] || [key isEqualToString:maxTemp]) {
        SChartColumnSeries *colSeries = [SChartColumnSeries new];
        colSeries.title = [self titleForKey:key];
        
        if ([key isEqualToString:minTemp]) {
            colSeries.style.areaColor = [UIColor clearColor];
            colSeries.style.areaColorGradient = [UIColor clearColor];
            colSeries.style.lineColor = [UIColor clearColor];
            colSeries.showInLegend = NO;
            
        } else {
            colSeries.style = [self.theme columnSeriesStyleForSeriesAtIndex:5 selected:NO];
        }
        
        colSeries.stackIndex = [NSNumber numberWithInt:1];
        series = colSeries;
        
    } else if ([key isEqualToString:meanTemp]) {
        SChartLineSeries *lineSeries = [SChartLineSeries new];
        lineSeries.title = [self titleForKey:key];
        lineSeries.style = [self.theme lineSeriesStyleForSeriesAtIndex:2 selected:NO];
        series = lineSeries;
        
    } else if ([key isEqualToString:sunshine]) {
        SChartScatterSeries *scatterSeries = [SChartScatterSeries new];
        scatterSeries.title = [self titleForKey:key];
        scatterSeries.style = [self.theme scatterSeriesStyleForSeriesAtIndex:4 selected:NO];
        scatterSeries.style.pointStyle.innerColor = scatterSeries.style.pointStyle.color;
        series = scatterSeries;
    }

    return series;
}

@end
