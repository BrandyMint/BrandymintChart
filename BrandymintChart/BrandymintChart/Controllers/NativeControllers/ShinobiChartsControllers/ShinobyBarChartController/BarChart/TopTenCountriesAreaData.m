//
//  TopTenCountriesAreaData.m
//  BarChart

#import "TopTenCountriesAreaData.h"

@implementation TopTenCountriesAreaData

- (id)init {
    self = [super init];
    if (self) {
        
        _data = [NSMutableDictionary new];
        
        _dataKeys = [NSArray arrayWithObjects:land, water, nil];
        
        _countries = [NSArray arrayWithObjects:   @"Russia",
                     @"Canada",
                     @"China",
                     @"United States",
                     @"Brazil",
                     @"Australia",
                     @"India",
                     @"Argentina",
                     @"Kazakhstan",
                     @"Algeria",
                     nil];
        
        NSArray *russiaData = [NSArray arrayWithObjects:[NSNumber numberWithDouble:16377742], [NSNumber numberWithDouble:720500], nil];
        [_data setObject:[NSMutableDictionary dictionaryWithObjects:russiaData forKeys:_dataKeys] forKey:[_countries objectAtIndex:0]];
        
        NSArray *canadaData = [NSArray arrayWithObjects:[NSNumber numberWithDouble:9984670], [NSNumber numberWithDouble:891163], nil];
        [_data setObject:[NSMutableDictionary dictionaryWithObjects:canadaData forKeys:_dataKeys] forKey:[_countries objectAtIndex:1]];
        
        NSArray *chinaData = [NSArray arrayWithObjects:[NSNumber numberWithDouble:9569901], [NSNumber numberWithDouble:137060], nil];
        [_data setObject:[NSMutableDictionary dictionaryWithObjects:chinaData forKeys:_dataKeys] forKey:[_countries objectAtIndex:2]];
        
        NSArray *usaData = [NSArray arrayWithObjects:[NSNumber numberWithDouble:9158960], [NSNumber numberWithDouble:470131], nil];
        [_data setObject:[NSMutableDictionary dictionaryWithObjects:usaData forKeys:_dataKeys] forKey:[_countries objectAtIndex:3]];
        
        NSArray *brazilData = [NSArray arrayWithObjects:[NSNumber numberWithDouble:8459417], [NSNumber numberWithDouble:55460], nil];
        [_data setObject:[NSMutableDictionary dictionaryWithObjects:brazilData forKeys:_dataKeys] forKey:[_countries objectAtIndex:4]];
        
        NSArray *australiaData = [NSArray arrayWithObjects:[NSNumber numberWithDouble:7682300], [NSNumber numberWithDouble:58920], nil];
        [_data setObject:[NSMutableDictionary dictionaryWithObjects:australiaData forKeys:_dataKeys] forKey:[_countries objectAtIndex:5]];
        
        NSArray *indiaData = [NSArray arrayWithObjects:[NSNumber numberWithDouble:2973193], [NSNumber numberWithDouble:314070], nil];
        [_data setObject:[NSMutableDictionary dictionaryWithObjects:indiaData forKeys:_dataKeys] forKey:[_countries objectAtIndex:6]];
        
        NSArray *argentinaData = [NSArray arrayWithObjects:[NSNumber numberWithDouble:2736690], [NSNumber numberWithDouble:43710], nil];
        [_data setObject:[NSMutableDictionary dictionaryWithObjects:argentinaData forKeys:_dataKeys] forKey:[_countries objectAtIndex:7]];
        
        NSArray *kazakhstanData = [NSArray arrayWithObjects:[NSNumber numberWithDouble:2699700], [NSNumber numberWithDouble:25200], nil];
        [_data setObject:[NSMutableDictionary dictionaryWithObjects:kazakhstanData forKeys:_dataKeys] forKey:[_countries objectAtIndex:8]];
        
        NSArray *algeriaData = [NSArray arrayWithObjects:[NSNumber numberWithDouble:2381741], [NSNumber numberWithDouble:0], nil];
        [_data setObject:[NSMutableDictionary dictionaryWithObjects:algeriaData forKeys:_dataKeys] forKey:[_countries objectAtIndex:9]];
        
    }
    return self;
}


@end
