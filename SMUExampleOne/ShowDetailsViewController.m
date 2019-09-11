//
//  ShowDetailsViewController.m
//  SMUExampleOne
//
//  Created by Ketan Jogalekar on 9/9/19.
//  Copyright © 2019 Eric Larson. All rights reserved.
//

#import "ShowDetailsViewController.h"

@interface ShowDetailsViewController ()

@end

@implementation ShowDetailsViewController

-(UITextView*)specificationText{
    if(_specificationText != nil)
    {
        NSLog(@"in getter");
        _specificationText = [UITextView alloc];
    }
    return _specificationText;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.specificationText.text = @"This is awesome !!!";
    [self.view addSubview:self.specificationText];
    [self.view bringSubviewToFront:self.specificationText];
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
