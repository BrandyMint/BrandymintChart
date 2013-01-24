//
//  DetailViewController.m
//  BrandymintChart
//
//  Created by denisdbv@gmail.com on 24.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "DetailViewController.h"
#import "CardViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
{
    NSMutableArray *pageViews;
}

@synthesize scrollCards;

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
    // Do any additional setup after loading the view from its nib.
}

-(void) viewDidAppear:(BOOL)animated
{
    //[self initScrollCards];
    splitController.splitPosition = OPEN_MASTER_SPLITVIEW_POSITION;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

-(NSUInteger) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (float)splitViewController:(MGSplitViewController *)svc constrainSplitPosition:(float)proposedPosition splitViewSize:(CGSize)viewSize
{
    NSLog(@"%@ and %f", NSStringFromCGSize(viewSize), proposedPosition);
	return proposedPosition;
}

-(IBAction) showLeft
{
    //[splitController setSplitPosition:0.0f animated:YES];
    //splitController.showsMasterInLandscape = NO;
}

-(void) initScrollCards
{
    pageViews = [[NSMutableArray alloc] init];
    
    CGFloat itemWidth = self.scrollCards.frame.size.width;
    CGFloat cardWidth = 877;
    CGFloat ofs = (itemWidth-cardWidth)/2;
    
    for(int loop = 0; loop < 10; loop++)
    {
        CGRect frame;
        
        frame.origin.x = ofs + itemWidth * loop;
        frame.origin.y = 20;
        frame.size.width = cardWidth;
        frame.size.height = self.scrollCards.frame.size.height - 40;
        
        CardViewController *myController = [[CardViewController alloc]
                                                initWithNibName:@"CardViewController" bundle:[NSBundle mainBundle]];
        myController.view.frame = frame;
        
        [pageViews addObject:myController];
        [self.scrollCards addSubview:myController.view];
    }
    
    self.scrollCards.contentSize = CGSizeMake(itemWidth * 10,
                                              self.scrollCards.frame.size.height);
    
    [self updatePageAlpha:0];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
    CGFloat pageWidth = self.scrollCards.frame.size.width;
    CGFloat scrollOfs = self.scrollCards.contentOffset.x;
    
    int curPageIndex = floor(scrollOfs/pageWidth - 0.5) + 1;
    CGFloat pageOfs = scrollOfs/pageWidth - curPageIndex; // -0.5..0.5
    
    UIView* v1 = [self.scrollCards.subviews objectAtIndex:curPageIndex];
    v1.alpha = 1.0 - fabs(pageOfs);
    
    [self updatePageAlpha:curPageIndex];
}

-(void)updatePageAlpha:(int)pageIndex
{
    if (pageIndex > 0){
        UIView* v = [self.scrollCards.subviews objectAtIndex:pageIndex-1];
        v.alpha = 0.5;
    }
    if (pageIndex < self.scrollCards.subviews.count-1){
        UIView* v = [self.scrollCards.subviews objectAtIndex:pageIndex+1];
        v.alpha = 0.5;
    }
}

@end
