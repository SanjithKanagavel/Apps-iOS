//
//  AppDelegate.m
//  ToDoList
//
//  Created by Sanjith Kanagavel on 11/10/16.
//  Copyright © 2016 Sanjith Kanagavel. All rights reserved.
//

/* 1. Model
 * 2. Context
 * 3. Persistence
 */

#import "AppDelegate.h"
#import "DetailViewController.h"
#import "MasterViewController.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    splitViewController.delegate = self;
    
    UINavigationController *masterNavigationController = splitViewController.viewControllers[0];
    MasterViewController *mvc = (MasterViewController *)masterNavigationController.topViewController;
    mvc.moc = self.moc;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self saveContext];
}

#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]] && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] detailItem] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
}

#pragma - Core Data Stack 
/**
 Setting up proper get setter for the fields they run automatically
 **/
@synthesize mom = _mom;
@synthesize moc = _moc;
@synthesize psc = _psc;

/*
 * Url to documentary function which be used in psc
 */

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

/*
 * Model  is usually setting up the url link to the file and linking the file
 */
-(NSManagedObjectModel *) mom {
    
    if(_mom != nil) {
        return _mom;
    }
    NSURL *modelUrl = [[NSBundle mainBundle]URLForResource:@"File" withExtension:@"momd"];
    _mom  = [[NSManagedObjectModel alloc]initWithContentsOfURL:modelUrl];
    return _mom;
}

/* Steps for creating :
 * 1. Allocate itself with mom
 * 2. Get sql url from documents directory
 * 3. addPersistancStoreWithType
 */

-(NSPersistentStoreCoordinator *) psc {
        if(_psc!=nil) {
            return _psc;
        }
    
    _psc = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:_mom];
    NSURL *storeURL = [[self applicationDocumentsDirectory]URLByAppendingPathComponent:@"File.sqlite"];
    NSError *error;
    NSString *errorDesc = @"Problem in connecting the data %@ %@";
    if(![_psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        if(error!=nil)
        {
            NSLog(errorDesc,error,[error userInfo]);
            abort();
        }
    }
    return _psc;
}

/* Steps to create ManagedObjectContext
 * 1. Create moc with concurrency main queue
 * 2. Add Persistent Store Coordinator to moc
 */
-(NSManagedObjectContext *) moc {
    if(_moc != nil) {
        return _moc;
    }
    
    NSPersistentStoreCoordinator *t_psc = [self psc];
    if(t_psc == nil) {
        NSLog(@"PersistentStoreCoordinator is null");
        abort();
    }
    
    _moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_moc setPersistentStoreCoordinator:t_psc];
    return _moc;
}


#pragma - Core Data Utility functions

-(void)saveContext{
    NSManagedObjectContext *managedObject  = self.moc;
    if( managedObject==nil ) {
        return ;
    }
    NSError *error;
    if([managedObject hasChanges] && [managedObject save:&error])
    {
        if(error != nil)
        {
            NSLog(@"Error occured while saving context %@ Desc : %@",error,[error userInfo]);
        }
    }
}

@end
