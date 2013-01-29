//
//  WebPlatformController.h
//  BrandymintChart
//
//  Created by DenisDbv on 30.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "CardViewController.h"

@interface WebPlatformController : CardViewController

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UIView *controlView;

@property (strong, nonatomic) IBOutlet UIWebView *viewWeb;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil indexIn:(int)index;

@end
