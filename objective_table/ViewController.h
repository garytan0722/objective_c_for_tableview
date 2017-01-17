//
//  ViewController.h
//  objective_table
//
//  Created by garytan on 2017/1/12.
//  Copyright © 2017年 com.garygenglun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customcell.h"
#import "ViewDetailController.h"
@interface ViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>
@property (nonatomic, strong) UISearchController * searchController;
@property (nonatomic, strong) NSMutableArray * allItems;
@property (nonatomic, strong) NSMutableArray * filteredItems;
@property (nonatomic, weak) NSArray * displayedItems;


@end

