//
//  AppDelegate.h
//  ToDoList
//
//  Created by Sanjith Kanagavel on 11/10/16.
//  Copyright © 2016 Sanjith Kanagavel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,readonly,nonatomic) NSManagedObjectModel *mom;
@property (strong,readonly,nonatomic) NSManagedObjectContext *moc;
@property (strong,readonly,nonatomic) NSPersistentStoreCoordinator *psc;

-(void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

