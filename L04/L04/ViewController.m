//
//  ViewController.m
//  L04
//
//  Created by Hanguang on 5/20/15.
//  Copyright (c) 2015 Hanguang. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "StudentCell.h"
#import "DetailViewController.h"
#import "AFNetworking.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *studentsArray;
@property (nonatomic, strong) NSArray *jsonArray;

@end

@implementation ViewController

#pragma mark - View life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.tabBarItem.title = @"学生";

    //编译navigationItem右边的按钮
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"学生"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(showInfo)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    //编译navigationItem左边的按钮
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                                                   target:self
                                                                                   action:nil ];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    //编译navigationItem中间title的信息
    self.navigationItem.title = @"学生信息";
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 100;
    
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    // Load the NIB file
    UINib *nib = [UINib nibWithNibName:@"StudentCell" bundle:nil];
    
    // Register this NIB, which contains the cell
    [self.tableView registerNib:nib forCellReuseIdentifier:@"StudentCell"];

    //[self.tableView registerClass:[StudentCell class] forCellReuseIdentifier:@"StudentCell"];
    NSLog(@"有什么需要服务的吗");
    [self loadReviews];
}

-(void)loadReviews{
    self.jsonArray = [[NSArray alloc] init];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *URL = @"http://api.staging.kangyu.co/v2/hospitals/206/reviews";
    
    [manager GET:URL
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             if (responseObject) {
                 self.jsonArray = responseObject;
             }
             [self.tableView reloadData];
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
         }];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    //显示tabbaritem栏目
    self.tabBarController.tabBar.hidden = NO;
}

- (void)showInfo {
    NSLog(@"你好");
}

#pragma mark - Getter
- (NSArray *)studentsArray {
    if (!_studentsArray) {
        // 生成可变数组
        NSMutableArray *array = [NSMutableArray array];
        // 循环5次 生成5个student
        for (int i =0; i < 4; i++) {
            // 初始化 student
            Student *student = [Student studentsCard:i];

            // 添加到数组
            [array addObject:student];
        }
        _studentsArray = [array copy];
    }
    return  _studentsArray;
}
//push

#pragma mark - Tableview delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.jsonArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    StudentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StudentCell" forIndexPath:indexPath];
//    Student *student = self.studentsArray[indexPath.row];
//    
//    // 自定义cell 信息
//    //设置name
//    cell.nameLabel.text = student.name;
//    [cell.nameLabel sizeToFit];
//    //设置age
//    cell.ageLabel.text = student.age;
//    [cell.ageLabel sizeToFit];
//    //设置ID
//    cell.idLabel.text = student.studentId;
//    [cell.idLabel sizeToFit];
//    //设置class
//    cell.classLabel.text = student.studentClass;
//    [cell.classLabel sizeToFit];
//     //设置图片
//    cell.mugshotImageVIew.image = student.image;
//    //设置时间
////  cell.timeLabel.text = [[NSDate date] descriptionWithLocale:[NSLocale currentLocale]];
//    cell.timeLabel.text = [NSString stringWithFormat:@"%@",[NSDate date]];// stringWithFormat
//    [cell.timeLabel sizeToFit];
    NSDictionary *dict = self.jsonArray[indexPath.row];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@",dict[@"note"]];
    [cell.nameLabel sizeToFit];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    
    NSDictionary *selectedStudent = self.jsonArray[indexPath.row];
    
    detailViewController.dict = selectedStudent;
    
    [self.navigationController pushViewController:detailViewController animated:YES];

}



@end
