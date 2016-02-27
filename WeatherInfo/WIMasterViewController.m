//
//  ViewController.m
//  WeatherInfo
//
//  Created by PCS MV on 2/25/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import "WIMasterViewController.h"

@interface WIMasterViewController ()

@property (nonatomic, strong) NSMutableArray *zipCodes;

@end

@implementation WIMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.zipTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellIdentifier"];
    [self.zipTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.zipCodes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *zipCodeCell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    zipCodeCell.textLabel.text = [self.zipCodes objectAtIndex:indexPath.row];
    return zipCodeCell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [[WIHTTPSessionManager sharedManager] fetchWeatherDataForZipCode:@" " andOnSuccess:^(id responseObject) {
        
    } onFailure:^(NSError *error) {
        
    }];
    [self performSegueWithIdentifier:@"ModelSegue" sender:nil];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row >= 3;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.zipCodes removeObjectAtIndex:indexPath.row];
        [self.zipTableView reloadData];
    }
}


- (IBAction)addZipCode:(UIBarButtonItem *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"ZipCode"
                                                                             message:@"Please enter a 5-digit zipcode"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * textField) {
            textField.placeholder = @"ZipCode";
            [textField addTarget:self
                          action:@selector(textFieldTextDidChange:)
                forControlEvents:UIControlEventEditingChanged];
    }];
    
    __weak typeof(self) weakSelf = self;
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
         UITextField *zipField = alertController.textFields.lastObject;
         [weakSelf.zipCodes addObject:zipField.text];
         [weakSelf.zipTableView reloadData];
     }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)textFieldTextDidChange:(UITextField *)sender {
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    UITextField *textField = alertController.textFields.firstObject;
    UIAlertAction *okAction  = alertController.actions.lastObject;
    okAction.enabled = textField.text.length == 5;
}

- (NSMutableArray *)zipCodes {
    if (!_zipCodes) {
        _zipCodes = [NSMutableArray arrayWithArray:@[@"94086",@"75080",@"75252"]];
    }
    return _zipCodes;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

@end
























