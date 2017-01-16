//
//  ViewController.m
//  objective_table
//
//  Created by garytan on 2017/1/12.
//  Copyright © 2017年 com.garygenglun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSMutableArray *data,*data2;
    BOOL item_checked[10];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    // Do any additional setup after loading the view, typically from a nib.
    data=[NSMutableArray arrayWithObjects:@"test1",@"test2",@"test3",@"test1",@"test2",@"test3",@"test1",@"test2",@"test3", nil];
    data2=[NSMutableArray arrayWithObjects:@"123",@"456",@"789",@"123",@"456",@"789",@"123",@"456",@"789", nil];
    [self.tableView setContentInset:UIEdgeInsetsMake(20,self.tableView.contentInset.left,self.tableView.contentInset.bottom,self.tableView.contentInset.right)];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"numberOfRowsInSection");
    return [data count];
}
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [data removeObjectAtIndex:indexPath.row];
    [data2 removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"cellForRowAtIndexPath");
    static NSString *simpleidentifier=@"customcell";
    Customcell *cell=[tableView dequeueReusableCellWithIdentifier:simpleidentifier];
    if(cell==nil){
        cell=[[Customcell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleidentifier];
        
    }
    cell.name.text=[data objectAtIndex:indexPath.row];
    cell.time.text=[data2 objectAtIndex:indexPath.row];
    cell.image.image=[UIImage imageNamed:@"test.jpg"];
    if(item_checked[indexPath.row]){
            cell.accessoryType=UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType=UITableViewCellAccessoryNone;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *name =[data objectAtIndex:indexPath.row];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:name delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    //[alert show];
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




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
