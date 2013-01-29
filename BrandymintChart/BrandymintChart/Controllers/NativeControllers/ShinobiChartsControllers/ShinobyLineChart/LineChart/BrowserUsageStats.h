//
//  BrowserUsageStats.h
//  LineChart

#import <Foundation/Foundation.h>

#define opera @"Opera"
#define android @"Android"
#define safari @"Safari"
#define nokia @"Nokia"
#define blackberry @"BlackBerry"
#define other @"Other"

//This interface allows the data source to take any kind of
//browser data as long as it conforms
@protocol BrowserUsageStats <NSObject>

@required
- (NSMutableDictionary*)data;
- (NSArray*)months;
- (NSArray*)dataKeys;

@end
