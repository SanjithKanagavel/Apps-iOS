//
//  DetailViewController.m
//  ToDoList
//
//  Created by Sanjith Kanagavel on 10/10/16.
//  Copyright © 2016 Sanjith Kanagavel. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    [self.detailDescriptionLabel setNumberOfLines:0];
    [self.detailDescriptionLabel sizeToFit];
    [self.detailDescriptionLabel setContentMode:UIViewContentModeTop];
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"message"] description];
        self.navigationItem.title = [[self.detailItem valueForKey:@"header"] description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
