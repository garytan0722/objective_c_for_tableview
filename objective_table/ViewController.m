//
//  ViewController.m
//  objective_table
//
//  Created by garytan on 2017/1/12.
//  Copyright © 2017年 com.garygenglun. All rights reserved.
//

#import "ViewController.h"
#import "Data.h"
@interface ViewController ()

@end

@implementation ViewController{
    //NSMutableArray *data,*data2;
    NSMutableArray *item;
    BOOL item_checked[10];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    // Do any additional setup after loading the view, typically from a nib.
    Data *data_obj1=[Data new];
    data_obj1.name=@"test1";
    data_obj1.time=@"123";
    data_obj1.image=@"test.jpg";
    data_obj1.conetnt=@"content1";
    Data *data_obj2=[Data new];
    data_obj2.name=@"test2";
    data_obj2.time=@"456";
    data_obj2.image=@"test.jpg";
    data_obj2.conetnt=@"content2";
    Data *data_obj3=[Data new];
    data_obj3.name=@"test3";
    data_obj3.time=@"789";
    data_obj3.image=@"test.jpg";
    data_obj3.conetnt=@"content3";
    Data *data_obj4=[Data new];
    data_obj4.name=@"test4";
    data_obj4.time=@"123456";
    data_obj4.image=@"test.jpg";
    data_obj4.conetnt=@"content4";
    item=[NSMutableArray arrayWithObjects:data_obj1,data_obj2,data_obj3,data_obj4, nil];
    //    data=[NSMutableArray arrayWithObjects:@"test1",@"test2",@"test3",@"test1",@"test2",@"test3",@"test1",@"test2",@"test3", nil];
    //    data2=[NSMutableArray arrayWithObjects:@"123",@"456",@"789",@"123",@"456",@"789",@"123",@"456",@"789", nil];
    [self.tableView setContentInset:UIEdgeInsetsMake(20,self.tableView.contentInset.left,self.tableView.contentInset.bottom,self.tableView.contentInset.right)];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"numberOfRowsInSection");
    return [item count];
}
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [item removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"cellForRowAtIndexPath");
    static NSString *simpleidentifier=@"customcell";
    Customcell *cell=[tableView dequeueReusableCellWithIdentifier:simpleidentifier];
    if(cell==nil){
        cell=[[Customcell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleidentifier];
        
    }
    Data *data=[item objectAtIndex:indexPath.row];
    cell.name.text=data.name;
    cell.time.text=data.time;
    cell.image.image=[UIImage imageNamed:data.image];
    if(item_checked[indexPath.row]){
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType=UITableViewCellAccessoryNone;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Data *data=[item objectAtIndex:indexPath.row];
    NSString *name =data.name;
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    if(item_checked[indexPath.row]){
        cell.accessoryType=UITableViewCellAccessoryNone;
        item_checked[indexPath.row]=NO;
    }else{
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
        item_checked[indexPath.row]=YES;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"gotodetail"]){
        NSIndexPath *indexpath=[self.tableView indexPathForSelectedRow];
        Data *data=[item objectAtIndex:indexpath.row];
        ViewDetailController *detail=segue.destinationViewController;
        detail.data=data;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
