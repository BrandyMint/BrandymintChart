//
//  MobileBrowserUsageStats.m
//  LineChart

#import "MobileBrowserUsageStats.h"

@implementation MobileBrowserUsageStats

@synthesize data = _data;
@synthesize dataKeys = _dataKeys;
@synthesize months = _months;

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        _data = [NSMutableDictionary new];
                
        _dataKeys = [NSArray arrayWithObjects:@"Opera", @"Android",@"Safari", @"Nokia", @"BlackBerry", @"Other", nil];
        
        _months = [NSArray arrayWithObjects:
                   @"Mar 12",
                   @"Feb 12",
                   @"Jan 12",
                   @"Dec 11",
                   @"Nov 11",
                   @"Oct 11",
                   @"Sep 11",
                   @"Aug 11",
                   @"Jul 11",
                   @"Jun 11",
                   @"May 11",
                   @"Apr 11",
                   @"Mar 11",
                   @"Feb 11",
                   @"Jan 11",
                   nil];
        
        NSDictionary *mar12Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:22.86f],
                                                                       [NSNumber numberWithFloat:21.16f],
                                                                       [NSNumber numberWithFloat:24.86f],
                                                                       [NSNumber numberWithFloat:11.86f],
                                                                       [NSNumber numberWithFloat:6.18f],
                                                                       [NSNumber numberWithFloat:7.08f],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:mar12Data forKey:[_months objectAtIndex:0]];
        
        NSDictionary *feb12Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:21.07f],
                                                                       [NSNumber numberWithFloat:22.67f],
                                                                       [NSNumber numberWithFloat:25.36f],
                                                                       [NSNumber numberWithFloat:11.24f],
                                                                       [NSNumber numberWithFloat:6.53],
                                                                       [NSNumber numberWithFloat:12.48f],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:feb12Data forKey:[_months objectAtIndex:1]];
        
        NSDictionary *jan12Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:23.34f],
                                                                       [NSNumber numberWithFloat:21.39f],
                                                                       [NSNumber numberWithFloat:23.91f],
                                                                       [NSNumber numberWithFloat:11.72],
                                                                       [NSNumber numberWithFloat:6.68],
                                                                       [NSNumber numberWithFloat:12.92],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:jan12Data forKey:[_months objectAtIndex:2]];
        
        NSDictionary *dec11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:24.22],
                                                                       [NSNumber numberWithFloat:20.22],
                                                                       [NSNumber numberWithFloat:22.59],
                                                                       [NSNumber numberWithFloat:12.92],
                                                                       [NSNumber numberWithFloat:7.53],
                                                                       [NSNumber numberWithFloat:12.54],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:dec11Data forKey:[_months objectAtIndex:3]];
        
        NSDictionary *nov11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:22.49],
                                                                       [NSNumber numberWithFloat:20.41],
                                                                       [NSNumber numberWithFloat:24.08],
                                                                       [NSNumber numberWithFloat:11.94],
                                                                       [NSNumber numberWithFloat:8.20],
                                                                       [NSNumber numberWithFloat:12.88],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:nov11Data forKey:[_months objectAtIndex:4]];
        
        NSDictionary *oct11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:21.52],
                                                                       [NSNumber numberWithFloat:20.88],
                                                                       [NSNumber numberWithFloat:23.36],
                                                                       [NSNumber numberWithFloat:12.40],
                                                                       [NSNumber numberWithFloat:9.26],
                                                                       [NSNumber numberWithFloat:12.58],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:oct11Data forKey:[_months objectAtIndex:5]];
        
        NSDictionary *sep11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:22.45],
                                                                       [NSNumber numberWithFloat:19.90],
                                                                       [NSNumber numberWithFloat:21.10],
                                                                       [NSNumber numberWithFloat:16.01],
                                                                       [NSNumber numberWithFloat:10.51],
                                                                       [NSNumber numberWithFloat:10.03],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:sep11Data forKey:[_months objectAtIndex:6]];
        
        NSDictionary *aug11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:21.61],
                                                                       [NSNumber numberWithFloat:19.72],
                                                                       [NSNumber numberWithFloat:19.31],
                                                                       [NSNumber numberWithFloat:16.99],
                                                                       [NSNumber numberWithFloat:11.64],
                                                                       [NSNumber numberWithFloat:10.73],
                                                                       nil] forKeys:_dataKeys];
        
        [_data setObject:aug11Data forKey:[_months objectAtIndex:7]];
        
        NSDictionary *jul11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:22.07],
                                                                       [NSNumber numberWithFloat:18.17],
                                                                       [NSNumber numberWithFloat:19.95],
                                                                       [NSNumber numberWithFloat:17.10],
                                                                       [NSNumber numberWithFloat:12.30],
                                                                       [NSNumber numberWithFloat:10.41],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:jul11Data forKey:[_months objectAtIndex:8]];
        
        NSDictionary *jun11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:22.81],
                                                                       [NSNumber numberWithFloat:17.25],
                                                                       [NSNumber numberWithFloat:15.25],
                                                                       [NSNumber numberWithFloat:17.66],
                                                                       [NSNumber numberWithFloat:11.98],
                                                                       [NSNumber numberWithFloat:15.08],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:jun11Data forKey:[_months objectAtIndex:9]];
        
        NSDictionary *may11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:21.81],
                                                                       [NSNumber numberWithFloat:17.01],
                                                                       [NSNumber numberWithFloat:16.71],
                                                                       [NSNumber numberWithFloat:16.50],
                                                                       [NSNumber numberWithFloat:12.76],
                                                                       [NSNumber numberWithFloat:15.23],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:may11Data forKey:[_months objectAtIndex:10]];
        
        NSDictionary *apr11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:21.90],
                                                                       [NSNumber numberWithFloat:15.49],
                                                                       [NSNumber numberWithFloat:17.43],
                                                                       [NSNumber numberWithFloat:16.32],
                                                                       [NSNumber numberWithFloat:13.37],
                                                                       [NSNumber numberWithFloat:15.50],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:apr11Data forKey:[_months objectAtIndex:11]];
        
        NSDictionary *mar11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:21.03],
                                                                       [NSNumber numberWithFloat:15.27],
                                                                       [NSNumber numberWithFloat:18.18],
                                                                       [NSNumber numberWithFloat:15.95],
                                                                       [NSNumber numberWithFloat:13.93],
                                                                       [NSNumber numberWithFloat:15.64],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:mar11Data forKey:[_months objectAtIndex:12]];
        
        NSDictionary *feb11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:21.15],
                                                                       [NSNumber numberWithFloat:14.70],
                                                                       [NSNumber numberWithFloat:18.08],
                                                                       [NSNumber numberWithFloat:15.77],
                                                                       [NSNumber numberWithFloat:14.35],
                                                                       [NSNumber numberWithFloat:15.95],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:feb11Data forKey:[_months objectAtIndex:13]];
        
        NSDictionary *jan11Data = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                       [NSNumber numberWithFloat:21.04],
                                                                       [NSNumber numberWithFloat:14.19],
                                                                       [NSNumber numberWithFloat:18.17],
                                                                       [NSNumber numberWithFloat:15.52],
                                                                       [NSNumber numberWithFloat:14.85],
                                                                       [NSNumber numberWithFloat:16.24],
                                                                       nil] forKeys:_dataKeys];
        [_data setObject:jan11Data forKey:[_months objectAtIndex:14]];
        
    }
    
    return self;
    
}

@end
