//
//  DetailViewController.m
//  BrandymintChart
//
//  Created by denisdbv@gmail.com on 24.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import "DetailViewController.h"
#import "CardViewController.h"

#import "PieChartController.h"
#import "PlotWithLineController.h"

@interface DetailViewController ()
@property (nonatomic, strong) NSMutableArray *pageViews;
@end

@implementation DetailViewController
{
    //NSMutableArray *pageViews;
    bool stateLeftPanel;
    int curPage;
    
    CGRect scrollViewRect;
    CGRect scrollViewRectIncrease;
    CGRect innerViewRect;
    
    NSMutableArray *controllers;
}

@synthesize scrollCards;
@synthesize pageViews = _pageViews;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    stateLeftPanel = NO;
    curPage = 0;
}

-(void) viewDidAppear:(BOOL)animated
{
    scrollViewRect = scrollCards.frame;
    scrollViewRectIncrease = CGRectMake(0, scrollViewRect.origin.y, self.view.frame.size.width - OPEN_MASTER_SPLITVIEW_POSITION , scrollViewRect.size.height);
    
    [self reconfigurationController:0];
    //[self initScrollCards];
    
    //CardViewController *curController = (CardViewController *)[self.pageViews objectAtIndex:0];
    //[curController reloadCurrentController];
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

-(IBAction) showLeftPanel:(id)sender
{
    UIBarButtonItem *btn = self.btnBar;
    
    stateLeftPanel = !stateLeftPanel;

    if(stateLeftPanel == YES)   {
        NSLog(@"show master panel");
        //[splitController setSplitPosition:OPEN_MASTER_SPLITVIEW_POSITION animated:YES];
        scrollCards.clipsToBounds = YES;
        [self animateIncreaseWindows];
        btn.title = @"Скрыть";
    }
    else    {
        NSLog(@"hide master panel");
        //[splitController setSplitPosition:CLOSE_MASTER_SPLITVIEW_POSITION animated:YES];
        [self animateDecreaseWindows];
        btn.title = @"Показать";
    }
}

-(void) animateDecreaseWindows
{
    scrollCards.scrollEnabled = YES;
    [self showAllWindowInScrollView];
    
    if(self.pageViews.count > 0)
    {
        UIView* curView = ((UIViewController*)[self.pageViews objectAtIndex:curPage]).view;
        
        [UIView animateWithDuration:CLOSE_MASTER_SPLITVIEW_POSITION_DURATION animations:^(void) {
            splitController.splitPosition = CLOSE_MASTER_SPLITVIEW_POSITION;
            scrollCards.frame = scrollViewRect;
            curView.frame = innerViewRect;
            }completion:^(BOOL finished) {
            scrollCards.clipsToBounds = NO;
        }];
    }
    else
    {
        [UIView animateWithDuration:CLOSE_MASTER_SPLITVIEW_POSITION_DURATION animations:^(void) {
            splitController.splitPosition = CLOSE_MASTER_SPLITVIEW_POSITION;
            scrollCards.frame = scrollViewRect;
        }completion:^(BOOL finished) {
            scrollCards.clipsToBounds = NO;
        }];
    }
}

-(void) animateIncreaseWindows
{
    scrollCards.scrollEnabled = NO;
    [self hideAllWindowWithoutIndexInScrollView:curPage];
    
    if(self.pageViews.count > 0)
    {
        UIView* curView = ((UIViewController*)[self.pageViews objectAtIndex:curPage]).view;
        innerViewRect = curView.frame;

        [UIView animateWithDuration:OPEN_MASTER_SPLITVIEW_POSITION_DURATION animations:^(void) {
            splitController.splitPosition = OPEN_MASTER_SPLITVIEW_POSITION;
            scrollCards.frame = scrollViewRectIncrease;
            curView.frame = CGRectMake(innerViewRect.origin.x - 13.5, 0, scrollViewRectIncrease.size.width, scrollViewRectIncrease.size.height);    //ofs in next function = 13.5
        }completion:^(BOOL finished) {
            
        }];
    }
    else
    {
        [UIView animateWithDuration:OPEN_MASTER_SPLITVIEW_POSITION_DURATION animations:^(void) {
            splitController.splitPosition = OPEN_MASTER_SPLITVIEW_POSITION;
            scrollCards.frame = scrollViewRectIncrease;
        }completion:^(BOOL finished) {
            
        }];
    }
}

-(void) hideAllWindowWithoutIndexInScrollView:(int)index
{
    for(int loop = 0; loop < [self.pageViews count]; loop++)
    {
        if(loop != index)
        {
            ((UIViewController*)[self.pageViews objectAtIndex:loop]).view.hidden = YES;
        }
    }
}

-(void) showAllWindowInScrollView
{
    for(int loop = 0; loop < [self.pageViews count]; loop++)
    {
        ((UIViewController*)[self.pageViews objectAtIndex:loop]).view.hidden = NO;
    }
}

-(void) initScrollCards
{
    NSLog(@"init scroll cards");
    
    //Обнуляем все переменные используемые в процессе дальнейшей работы
    curPage = 0;
    self.pageViews = [[NSMutableArray alloc] init];
    
    for (UIView *v in scrollCards.subviews) {
        [v removeFromSuperview];
    }
    
    CGFloat itemWidth = self.scrollCards.frame.size.width;
    CGFloat cardWidth = 877;
    CGFloat ofs = (itemWidth-cardWidth)/2;
    
    NSLog(@"showing controllers = %i", controllers.count);
    for(int loop = 0; loop < controllers.count; loop++)
    {
        CGRect frame;
        
        frame.origin.x = ofs + itemWidth * loop;
        frame.origin.y = 20;
        frame.size.width = cardWidth;
        frame.size.height = self.scrollCards.frame.size.height - 40;
        
        CardViewController *myController = [controllers objectAtIndex:loop];
        myController.view.frame = frame;
        
        [self.pageViews addObject:myController];
        [self.scrollCards addSubview:myController.view];
    }

    NSLog(@"showing pageView = %i", self.pageViews.count);
    
    self.scrollCards.contentSize = CGSizeMake(itemWidth * controllers.count,
                                              self.scrollCards.frame.size.height);
    scrollCards.contentOffset = CGPointMake(0, 0);  //Перематываем на первый элемент при каждой инициализации
    
    if(controllers.count > 0)   {
        CardViewController *curController = (CardViewController *)[self.pageViews objectAtIndex:0];
        [curController reloadCurrentController];
    }
    
    [self updatePageAlpha:0];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
    if(self.pageViews.count == 0)
        return;
    
    CGFloat pageWidth = self.scrollCards.frame.size.width;
    CGFloat scrollOfs = self.scrollCards.contentOffset.x;
    
    int curPageIndex = floor(scrollOfs/pageWidth - 0.5) + 1;
    
    NSLog(@"current page=%i last page=%i", curPageIndex, curPage);
    if(curPageIndex != curPage) {
        [((CardViewController*)[self.pageViews objectAtIndex:curPageIndex]) reloadCurrentController];
        
        if(curPageIndex > curPage)  {
            [((CardViewController*)[self.pageViews objectAtIndex:curPageIndex - 1]) clearCurrentController];
        }
        else
        {
            [((CardViewController*)[self.pageViews objectAtIndex:curPageIndex + 1]) clearCurrentController];
        }
    }
    
    curPage = curPageIndex;
    CGFloat pageOfs = scrollOfs/pageWidth - curPageIndex; // -0.5..0.5
    
    UIView* v1 = ((UIViewController*)[self.pageViews objectAtIndex:curPageIndex]).view; //[self.scrollCards.subviews objectAtIndex:curPageIndex];
    v1.alpha = 1.0f - fabs(pageOfs);
    
    [self updatePageAlpha:curPageIndex];
}

-(void)updatePageAlpha:(int)pageIndex
{
    if(self.pageViews.count == 0)
        return;
    
    if (pageIndex > 0){
        UIView* v = ((UIViewController*)[self.pageViews objectAtIndex:pageIndex-1]).view;
        v.alpha = 0.5f;
    }
    if (pageIndex < self.pageViews.count - 1)  {
        NSLog(@"%i < %i", pageIndex, self.pageViews.count-1);
        UIView* v = ((UIViewController*)[self.pageViews objectAtIndex:pageIndex+1]).view;
        v.alpha = 0.5f;
    }
}


-(void) reconfigurationController:(int)index
{
    switch (index) {
        case 0:
        {
            PieChartController *myPieController = [[PieChartController alloc]
                                                   initWithNibName:@"PieChartController" bundle:[NSBundle mainBundle]];
            PlotWithLineController *myPlotWithLine = [[PlotWithLineController alloc]
                                                      initWithNibName:@"PlotWithLineController" bundle:[NSBundle mainBundle]];
            
            controllers = [[NSMutableArray alloc] initWithObjects:myPieController, myPlotWithLine, nil];
        }
        break;
            
        default:
            [controllers removeAllObjects];
            break;
    }
    
    if(stateLeftPanel == YES) {
        [self showLeftPanel:nil];
    }
    
    [self initScrollCards];
}

@end
