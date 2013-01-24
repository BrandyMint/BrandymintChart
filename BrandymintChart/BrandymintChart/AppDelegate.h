//
//  AppDelegate.h
//  BrandymintChart
//
//  Created by denisdbv@gmail.com on 24.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;
@class DetailViewController;
@class MGSplitViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
    MGSplitViewController *splitViewController;
    RootViewController *rootViewController;
    DetailViewController *detailViewController;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;

@property (nonatomic, strong) IBOutlet MGSplitViewController *splitViewController;
@property (nonatomic, strong) IBOutlet RootViewController *rootViewController;
@property (nonatomic, strong) IBOutlet DetailViewController *detailViewController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
