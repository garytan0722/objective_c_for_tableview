//
//  UIWebViewController.m
//  objective_table
//
//  Created by garytan on 2017/1/17.
//  Copyright © 2017年 com.garygenglun. All rights reserved.
//

#import "UIWebViewController.h"

@interface UIWebViewController ()

@end

@implementation UIWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"WebView load");
    self.webview.delegate = self;
    NSString *urlAddress = [NSString stringWithFormat:@"https://amds.nrl.mcu.edu.tw"];
    NSURL *url=[NSURL URLWithString:urlAddress];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [self.webview setScalesPageToFit:YES];
    [self.webview loadRequest:request];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Error : %@",error);
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
