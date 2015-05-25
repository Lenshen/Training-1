//
//  CompileViewController.m
//  L04
//
//  Created by MrMessy on 15/5/24.
//  Copyright (c) 2015年 Hanguang. All rights reserved.
//

#import "CompileViewController.h"
#import "Student.h"


@interface CompileViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *classField;
@property (weak, nonatomic) IBOutlet UITextField *idField;

@end

@implementation CompileViewController
- (IBAction)comfirmButton:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"编辑学生信息";
    
    Student *student = self.student;
    self.nameField.text = student.name;
    self.ageField.text = student.age;
    self.classField.text = student.studentClass;
    self.idField.text = student.studentId;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    Student *student = self.student;
    student.name = self.nameField.text;
    student.age = self.ageField.text;
    student.studentClass = self.classField.text;
    student.studentId = self.idField.text;
}



@end
