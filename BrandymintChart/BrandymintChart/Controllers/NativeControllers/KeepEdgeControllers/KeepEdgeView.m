//
//  KeepEdgeView.m
//  BrandymintChart
//
//  Created by DenisDbv on 30.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "KeepEdgeView.h"

#import "DemoPieChart.h"
#import "DemoBarChart.h"
#import "DemoBarStackedChart.h"
#import "DemoBarStackedPercentageChart.h"
#import "DemoAreaChart.h"
#import "DemoAreaStackedChart.h"
#import "DemoBar3DChart.h"
#import "DemoBarStacked3DChart.h"
#import "DemoBarStackedPercentage3DChart.h"
#import "DemoLineChart.h"
#import "DemoLineXYChart.h"
#import "DemoScatterChart.h"
#import "DemoAreaXYChart.h"
#import "DemoAreaXYStackedChart.h"
#import "DemoTimeSeriesChart.h"
#import "DemoHistogramChart.h"
#import "DemoHighLowChart.h"
#import "DemoMultiAxesChart.h"

@implementation KeepEdgeView

- (id) initWithFrame: (CGRect) frame
{
	return [self initWithFrame: frame demoIdx: 0];
}

- (id)initWithFrame: (CGRect) frame demoIdx: (int) anIndex
{
	if (self = [super initWithFrame:frame]) {
        // Initialization code
		//self.backgroundColor = [UIColor greenColor];
    }
	
	self->demoIdx = anIndex;
	
    return self;
}

- (void) drawRect: (CGRect) rect
{
	printf("Start Testing ... \n");
    
	CGContextRef aContext = UIGraphicsGetCurrentContext();
	CGRect imageArea = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
	
    if(self->demoIdx == 0)
    	[DemoBarChart processDemoWithContext: aContext area: imageArea];
    else if(self->demoIdx == 1)
    	[DemoBarStackedChart processDemoWithContext: aContext area: imageArea];
    else if(self->demoIdx == 2)
    	[DemoBarStackedPercentageChart processDemoWithContext: aContext area: imageArea];
    else if(self->demoIdx == 3)
    	[DemoAreaChart processDemoWithContext: aContext area: imageArea];
    else if(self->demoIdx == 4)
    	[DemoAreaStackedChart processDemoWithContext: aContext area: imageArea];
    else if(self->demoIdx == 5)
        [DemoBar3DChart processDemoWithContext: aContext area: imageArea];
    else if(self->demoIdx == 6)
    	[DemoBarStacked3DChart processDemoWithContext: aContext area: imageArea];
    else if(self->demoIdx == 7)
    	[DemoBarStackedPercentage3DChart processDemoWithContext: aContext area: imageArea];
	else if(self->demoIdx == 8)
    	[DemoLineChart processDemoWithContext: aContext area: imageArea];
    else if(self->demoIdx == 9)
    	[DemoLineXYChart processDemoWithContext: aContext area: imageArea];
    else if(self->demoIdx == 10)
    	[DemoScatterChart processDemoWithContext: aContext area: imageArea];
    else if(self->demoIdx == 11)
    	[DemoAreaXYChart processDemoWithContext: aContext area: imageArea];
    else if(self->demoIdx == 12)
	// AreaXYStackedChart, TimeSeries has some bugs, cannot run
    	[DemoAreaXYStackedChart processDemoWithContext: aContext area: imageArea];
    else if(self->demoIdx == 13)
        [DemoTimeSeriesChart processDemoWithContext: aContext area: imageArea];
    else if(self->demoIdx == 14)
    	[DemoHistogramChart processDemoWithContext: aContext area: imageArea];
    else if(self->demoIdx == 15)
    	[DemoHighLowChart processDemoWithContext: aContext area: imageArea];
    else if(self->demoIdx == 16)
    	[DemoMultiAxesChart processDemoWithContext: aContext area: imageArea];
	
	printf("Finish Testing.\n");
}


@end
