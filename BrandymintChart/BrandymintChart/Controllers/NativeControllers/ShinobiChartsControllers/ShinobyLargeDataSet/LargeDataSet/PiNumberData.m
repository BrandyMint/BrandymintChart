//
//  PiNumberData.m
//  LargeDataSet

#import "PiNumberData.h"

//PiNumberData class is used to retrieve contents of .txt file
@implementation PiNumberData

- (id)init {
    self = [super init];
    if (self) {
        
        //load the decimal places from the text file 
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"PI50K_DP" ofType:@"TXT"];
        NSString* fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        
        NSMutableArray *numberData = [[NSMutableArray alloc] initWithCapacity:fileContents.length];
        
        for (int i=0; i<fileContents.length; i++) {
            [numberData addObject:[NSString stringWithFormat: @"%C", [fileContents characterAtIndex:i]]];
        }
        
        _data = [NSArray arrayWithArray:numberData];
    }
    return self;
}

@end
