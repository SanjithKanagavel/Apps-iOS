//
//  MasterViewController.h
//  ToDoList
//
//  Created by Sanjith Kanagavel on 11/10/16.
//  Copyright © 2016 Sanjith Kanagavel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong,nonatomic) NSFetchedResultsController *frc;
@property (strong,nonatomic) NSManagedObjectContext *moc;

@end

