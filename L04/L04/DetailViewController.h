//
//  DetailViewController.h
//  L04
//
//  Created by MrMessy on 15/5/23.
//  Copyright (c) 2015年 Hanguang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Student;
@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property(nonatomic, weak)Student *student;

@end
