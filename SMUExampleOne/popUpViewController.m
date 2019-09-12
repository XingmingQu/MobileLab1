//
//  popUpViewController.m
//  SMUExampleOne
//
//  Created by Xingming on 9/11/19.
//  Copyright © 2019 Eric Larson. All rights reserved.
//

#import "popUpViewController.h"

@interface popUpViewController ()


@end

@implementation popUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)closePopUp:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
