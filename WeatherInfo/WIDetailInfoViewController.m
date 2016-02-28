//
//  WIDetailInfoController.m
//  WeatherInfo
//
//  Created by PCS MV on 2/26/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import "WIDetailInfoViewController.h"

@interface WIDetailInfoViewController ()

@end

@implementation WIDetailInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)dismissButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
