//
//  WIZipcodeTableViewController.m
//  WeatherInfo
//
//  Created by PCS MV on 2/27/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import "WIZipcodeTableViewController.h"

static NSString *const cellIdentifier = @"cellIdentifier";
static NSString *const detailSegueIdentifier = @"pushDetail";


@interface WIZipcodeTableViewController ()

@property (nonatomic, strong) NSMutableArray *zipCodes;

@end

@implementation WIZipcodeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.zipCodes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *zipCodeCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    zipCodeCell.textLabel.text = [self.zipCodes objectAtIndex:indexPath.row];
    return zipCodeCell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSString *zipCode = [self.zipCodes objectAtIndex:indexPath.row];
    NSString *query = [zipCode stringByAppendingString:@".json"];
    [SVProgressHUD show];
    
    [[WIHTTPSessionManager sharedManager] fetchWeatherDataForZipCode:query andOnSuccess:^(WIWeatherData *weatherData) {
        [SVProgressHUD dismiss];
        [self performSegueWithIdentifier:detailSegueIdentifier sender:weatherData];
    } onFailure:^(NSError *error) {
        [SVProgressHUD dismiss];
        [self showAlertForError:error];
    }];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row >= 3;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.zipCodes removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}

- (IBAction)addZipCode:(UIBarButtonItem *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"ZipCode"
                                                                             message:@"Please enter a 5-digit zipcode"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    [self configureZipCodeAlertController:alertController];
    
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
        _zipCodes = [NSMutableArray arrayWithArray:@[@"94086",@"75080",@"75252",@"00000"]];
    }
    return _zipCodes;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:detailSegueIdentifier]) {
        WIDetailInfoViewController *detailVC = segue.destinationViewController;
        detailVC.weatherData = (WIWeatherData *)sender;
    }
}

- (void)showAlertForError:(NSError *)error {
    NSString *message = [error valueForKey:@"description"];
    UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                        message:message
                                                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [errorAlert addAction:okAction];
    [self presentViewController:errorAlert animated:YES completion:nil];

}


- (void)configureZipCodeAlertController:(UIAlertController *)alertController {

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
         [weakSelf.tableView reloadData];
     }];
    okAction.enabled = NO;
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
}

@end
