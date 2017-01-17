//
//  ViewDetailController.m
//  objective_table
//
//  Created by garytan on 2017/1/16.
//  Copyright © 2017年 com.garygenglun. All rights reserved.
//

#import "ViewDetailController.h"

@interface ViewDetailController ()

@end

@implementation ViewDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=self.data.name;
    self.time.text=self.data.time;
    self.ImageView.image=[UIImage imageNamed:self.data.image];
    self.text.text=self.data.conetnt;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
