//
//  CustomCell.h
//  GroupChat
//
//  Created by Sanjith Kanagavel on 13/10/16.
//  Copyright © 2016 Sanjith Kanagavel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *message;

@property (strong, nonatomic) IBOutlet UILabel *timestamp;

@end
