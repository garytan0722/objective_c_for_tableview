//
//  ViewDetailController.h
//  objective_table
//
//  Created by garytan on 2017/1/16.
//  Copyright © 2017年 com.garygenglun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"
@interface ViewDetailController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UITextView *text;
@property(nonatomic,strong) Data *data;

@end
