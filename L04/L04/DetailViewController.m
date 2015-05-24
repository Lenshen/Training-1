//
//  DetailViewController.m
//  L04
//
//  Created by MrMessy on 15/5/23.
//  Copyright (c) 2015年 Hanguang. All rights reserved.
//

#import "DetailViewController.h"
#import "Student.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;


@end

@implementation DetailViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    //将detailview中的navigationItem.title设置成学生的姓名
    self.navigationItem.title = _student.name;
    
//    self.student.age = @"100";
//    self.student.studentId = @"111111";
//    self.student.studentClass = @"六年级";
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    Student *student = self.student;
    
    self.nameLabel.text = student.name;
    [self.nameLabel sizeToFit];
    
    self.ageLabel.text = student.age;
    [self.ageLabel sizeToFit];
    
    self.classLabel.text = student.studentClass;
    [self.classLabel sizeToFit];
    
    self.idLabel.text = student.studentId;
    [self.idLabel sizeToFit];
    
    self.dateLabel.text = [NSString stringWithFormat:@"%@",[NSDate date]];
    [self.dateLabel sizeToFit];
    
    self.image.image = student.image;
    NSLog(@"欢迎进入viewWillAppear环节");
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    NSLog(@"欢迎再次光临");
}


@end