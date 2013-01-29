//
//  UKWeatherData.m
//  ColumnChart

#import "UKWeatherData.h"

@implementation UKWeatherData

- (id)init {
    self = [super init];
    if (self) {
        
        _data = [NSMutableDictionary new];
        
        _months = [NSArray arrayWithObjects:
                    @"Jan 11",
                    @"Feb 11",
                    @"Mar 11",
                    @"Apr 11",
                    @"May 11",
                    @"Jun 11",
                    @"Jul 11",
                    @"Aug 11",
                    @"Sep 11",
                    @"Oct 11",
                    @"Nov 11",
                    @"Dec 11",
                    @"Jan 12",
                    @"Feb 12",
                    @"Mar 12",
                    @"Apr 12",
                    @"May 12",
                    @"Jun 12",
                    @"Jul 12",
                    @"Aug 12",
                    nil];
        
        _dataKeys = [NSArray arrayWithObjects:
                                maxTemp,
                                minTemp,
                                meanTemp,
                                rainfall,
                                sunshine,
                                nil];
        
        NSArray *janData11 = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:5.8f],
                              [NSNumber numberWithFloat:0.4f],
                              [NSNumber numberWithFloat:3.1f],
                              [NSNumber numberWithFloat:102.8f],
                              [NSNumber numberWithFloat:49.9f],
                              nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:janData11 forKeys:_dataKeys] forKey:[_months objectAtIndex:0]];
        
        NSArray *febData11 = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:8.1f],
                              [NSNumber numberWithFloat:2.6f],
                              [NSNumber numberWithFloat:5.3f],
                              [NSNumber numberWithFloat:114.5f],
                              [NSNumber numberWithFloat:51.6f],
                              nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:febData11 forKeys:_dataKeys] forKey:[_months objectAtIndex:1]];
        
        NSArray *marData11 = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:9.8f],
                              [NSNumber numberWithFloat:1.9f],
                              [NSNumber numberWithFloat:5.8f],
                              [NSNumber numberWithFloat:121.6f],
                              [NSNumber numberWithFloat:49.7f],
                              nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:marData11 forKeys:_dataKeys] forKey:[_months objectAtIndex:2]];
        
        NSArray *aprData11 = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:15.7f],
                              [NSNumber numberWithFloat:5.7f],
                              [NSNumber numberWithFloat:10.7f],
                              [NSNumber numberWithFloat:202.8f],
                              [NSNumber numberWithFloat:36.7f],
                              nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:aprData11 forKeys:_dataKeys] forKey:[_months objectAtIndex:3]];
        
        NSArray *mayData11 = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:15.2f],
                              [NSNumber numberWithFloat:6.9f],
                              [NSNumber numberWithFloat:11.0f],
                              [NSNumber numberWithFloat:191.6f],
                              [NSNumber numberWithFloat:101.8f],
                              nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:mayData11 forKeys:_dataKeys] forKey:[_months objectAtIndex:4]];
        
        NSArray *junData11 = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:17.1f],
                              [NSNumber numberWithFloat:8.3f],
                              [NSNumber numberWithFloat:12.7f],
                              [NSNumber numberWithFloat:175.4f],
                              [NSNumber numberWithFloat:85.1f],
                              nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:junData11 forKeys:_dataKeys] forKey:[_months objectAtIndex:5]];
        
        NSArray *julData11 = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:18.7f],
                              [NSNumber numberWithFloat:9.7f],
                              [NSNumber numberWithFloat:14.2f],
                              [NSNumber numberWithFloat:170.0f],
                              [NSNumber numberWithFloat:76.1f],
                              nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:julData11 forKeys:_dataKeys] forKey:[_months objectAtIndex:6]];
        
        NSArray *augData11 = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:18.0f],
                              [NSNumber numberWithFloat:10.3f],
                              [NSNumber numberWithFloat:14.1f],
                              [NSNumber numberWithFloat:105.8f],
                              [NSNumber numberWithFloat:127.4f],
                              nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:augData11 forKeys:_dataKeys] forKey:[_months objectAtIndex:7]];
        
        NSArray *sepData11 = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:17.5f],
                              [NSNumber numberWithFloat:10.1f],
                              [NSNumber numberWithFloat:13.8f],
                              [NSNumber numberWithFloat:108.5f],
                              [NSNumber numberWithFloat:127.3f],
                              nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:sepData11 forKeys:_dataKeys] forKey:[_months objectAtIndex:8]];
        
        NSArray *octData11 = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:14.5f],
                              [NSNumber numberWithFloat:8.0f],
                              [NSNumber numberWithFloat:11.3f],
                              [NSNumber numberWithFloat:122.8f],
                              [NSNumber numberWithFloat:90.4f],
                              nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:octData11 forKeys:_dataKeys] forKey:[_months objectAtIndex:9]];
        
        NSArray *novData11 = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:11.7f],
                              [NSNumber numberWithFloat:5.8f],
                              [NSNumber numberWithFloat:8.7f],
                              [NSNumber numberWithFloat:100.6f],
                              [NSNumber numberWithFloat:59.4f],
                              nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:novData11 forKeys:_dataKeys] forKey:[_months objectAtIndex:10]];
        
        NSArray *decData11 = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:7.6f],
                              [NSNumber numberWithFloat:2.1f],
                              [NSNumber numberWithFloat:4.8f],
                              [NSNumber numberWithFloat:167.0f],
                              [NSNumber numberWithFloat:41.3f],
                              nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:decData11 forKeys:_dataKeys] forKey:[_months objectAtIndex:11]];
        
        NSArray *jan12Data = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:7.4f],
                              [NSNumber numberWithFloat:1.9f],
                              [NSNumber numberWithFloat:4.7f],
                              [NSNumber numberWithFloat:108.3f],
                              [NSNumber numberWithFloat:60.3f],
                              nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:jan12Data forKeys:_dataKeys] forKey:[_months objectAtIndex:12]];
        
        
        NSArray *febData = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:7.1f],
                            [NSNumber numberWithFloat:1.2f],
                            [NSNumber numberWithFloat:4.1f],
                            [NSNumber numberWithFloat:54.5f],
                            [NSNumber numberWithFloat:65.f],
                            nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:febData forKeys:_dataKeys] forKey:[_months objectAtIndex:13]];
        
        NSArray *marData = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:12.0f],
                            [NSNumber numberWithFloat:3.5f],
                            [NSNumber numberWithFloat:7.7f],
                            [NSNumber numberWithFloat:36.4f],
                            [NSNumber numberWithFloat:156.5f],
                            nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:marData forKeys:_dataKeys] forKey:[_months objectAtIndex:14]];
        
        NSArray *aprData = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:10.1f],
                            [NSNumber numberWithFloat:2.5f],
                            [NSNumber numberWithFloat:6.3f],
                            [NSNumber numberWithFloat:126.5f],
                            [NSNumber numberWithFloat:127.7f],
                            nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:aprData forKeys:_dataKeys] forKey:[_months objectAtIndex:15]];
        
        NSArray *mayData = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:14.9f],
                            [NSNumber numberWithFloat:6.0f],
                            [NSNumber numberWithFloat:10.5f],
                            [NSNumber numberWithFloat:66.8f],
                            [NSNumber numberWithFloat:207.1],
                            nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:mayData forKeys:_dataKeys] forKey:[_months objectAtIndex:16]];
        
        NSArray *junData = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:15.8f],
                            [NSNumber numberWithFloat:8.8f],
                            [NSNumber numberWithFloat:12.3f],
                            [NSNumber numberWithFloat:145.3f],
                            [NSNumber numberWithFloat:119.2],
                            nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:junData forKeys:_dataKeys] forKey:[_months objectAtIndex:17]];
        
        NSArray *julData = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:17.8f],
                            [NSNumber numberWithFloat:10.4f],
                            [NSNumber numberWithFloat:14.1f],
                            [NSNumber numberWithFloat:115.9f],
                            [NSNumber numberWithFloat:140.3f],
                            nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:julData forKeys:_dataKeys] forKey:[_months objectAtIndex:18]];
        
        NSArray *augData = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:19.3f],
                            [NSNumber numberWithFloat:11.4f],
                            [NSNumber numberWithFloat:15.3f],
                            [NSNumber numberWithFloat:109.5f],
                            [NSNumber numberWithFloat:154.2f],
                            nil];
        [_data setObject:[NSDictionary dictionaryWithObjects:augData forKeys:_dataKeys] forKey:[_months objectAtIndex:19]];
    }
    return self;
}

@end
