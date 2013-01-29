//
//  WebPlatformController.m
//  BrandymintChart
//
//  Created by DenisDbv on 30.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "WebPlatformController.h"
#import "MBProgressHUD.h"

@interface WebPlatformController ()

@end

@implementation WebPlatformController
{
    MBProgressHUD *HUD;
    int testIndex;
}

@synthesize viewWeb = _viewWeb;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil indexIn:(int)index
{
    testIndex = index;
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
    }
    
    return self;
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
    
    NSArray *webLinks = [[NSArray alloc] initWithObjects:@"http://chart.icfdev.ru/pie", @"http://chart.icfdev.ru/pie_morris", @"http://chart.icfdev.ru/bar", @"http://chart.icfdev.ru/bar_morris", @"http://chart.icfdev.ru/table", @"http://chart.icfdev.ru/quote", nil];
    
    NSString *fullURL = [webLinks objectAtIndex:testIndex];
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    _viewWeb.delegate = (id)self;
    [_viewWeb loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

-(void)webViewDidStartLoad:(UIWebView *)webView {
    HUD = [[MBProgressHUD alloc] initWithView:self.baseView];
    [self.baseView addSubview:HUD];
    HUD.dimBackground = YES;
    HUD.labelText = @"Скачивание контента";
    HUD.detailsLabelText = @"подключение";
    [HUD show:YES];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [HUD hide:YES];
}

@end
