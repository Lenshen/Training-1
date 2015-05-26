//
//  DetailViewController.m
//  L04
//
//  Created by MrMessy on 15/5/23.
//  Copyright (c) 2015年 Hanguang. All rights reserved.
//

#import "DetailViewController.h"
#import "Student.h"
#import "CompileViewController.h"

@interface DetailViewController ()
//@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
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
    
    //显示navigationitem栏目
    self.navigationController.navigationBarHidden = NO;
    //隐藏tabbaritem栏目
    self.tabBarController.tabBar.hidden = YES;
    //编译navigationItem右边的按钮
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"编辑"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(compileItem)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    Student *student = self.student;
//    
//    self.nameLabel.text = student.name;
//    [self.nameLabel sizeToFit];
//    
//    self.ageLabel.text = student.age;
//    [self.ageLabel sizeToFit];
//    
//    self.classLabel.text = student.studentClass;
//    [self.classLabel sizeToFit];
//    
//    self.idLabel.text = student.studentId;
//    [self.idLabel sizeToFit];
//    
//    self.dateLabel.text = [NSString stringWithFormat:@"%@",[NSDate date]];
//    [self.dateLabel sizeToFit];
//    
//    self.image.image = student.image;
    
    NSDictionary *dit = self.dict;
    
    self.nameLabel.text = [NSString stringWithFormat:@"%@",dit[@"note"]];
    [self.nameLabel sizeToFit];
    
    NSLog(@"欢迎进入viewWillAppear环节");
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    self.tabBarController.tabBar.hidden = NO;
    
    NSLog(@"欢迎再次光临");
}

-(void)compileItem{
    
    CompileViewController *compileItem = [[CompileViewController alloc] init];
    
    Student *comStudent = self.student;
    compileItem.student = comStudent;
    
    [self.navigationController pushViewController:compileItem animated:YES];
}

@end
