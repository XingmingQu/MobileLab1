//
//  BrandAndPickerViewController.m
//  SMUExampleOne
//
//  Created by Xingming on 9/9/19.
//  Copyright © 2019 Eric Larson. All rights reserved.
//

#import "BrandAndPickerViewController.h"
#import "BrandsAndHistory.h"
@interface BrandAndPickerViewController () <UIPickerViewDelegate,UIPickerViewDataSource>
//@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControlButton;

{
NSArray *pickerData;
}

@property (weak, nonatomic) IBOutlet UITextView *historyText;
@property (weak, nonatomic) IBOutlet UIImageView *brandView;
@property (weak, nonatomic) IBOutlet UISwitch *SwitchButton;
@property (weak, nonatomic) IBOutlet UILabel *DarkModelLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *brandPicker;


@property (strong,nonatomic) BrandsAndHistory* myBrandHistory;


@end

@implementation BrandAndPickerViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    _historyText.text = @"HisroryHisroryHisroryHisroryHisrory";
    
//    NSString *ss = [BrandsAndHistory sharedInstance].BrandHistory[1];
//    NSLog(@"%@",ss);
    
    pickerData = [BrandsAndHistory sharedInstance].BrandNames;

    self.brandPicker.dataSource = self;
    self.brandPicker.delegate = self;
}

- (IBAction)SwitchChanged:(UISwitch *)sender {
    if (sender.on) {
        self.view.backgroundColor = [UIColor lightGrayColor];
        _historyText.backgroundColor = [UIColor lightGrayColor];
        _brandView.backgroundColor =[UIColor lightGrayColor];
        _brandPicker.backgroundColor = [UIColor lightGrayColor];
        
        _DarkModelLabel.textColor = [UIColor whiteColor];
        _historyText.textColor = [UIColor whiteColor];
        _titleLabel.textColor = [UIColor whiteColor];
    }else{
        self.view.backgroundColor = [UIColor whiteColor];
        _historyText.backgroundColor =[UIColor whiteColor];
        _brandView.backgroundColor =[UIColor whiteColor];
        _brandPicker.backgroundColor = [UIColor colorWithRed:235.0f/255 green:252.0f/255 blue:255.0f/255 alpha:1];
        
        _DarkModelLabel.textColor = [UIColor blackColor];
        _historyText.textColor = [UIColor blackColor];
        _titleLabel.textColor = [UIColor blackColor];
    }
}




-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return pickerData.count;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickerData objectAtIndex:row];
}

//- (IBAction)SegIndexChanged:(UISegmentedControl *)sender {
//    switch (sender.selectedSegmentIndex) {
//    case 0:
////        NSLog(@"@000");
//            self.view.backgroundColor = [UIColor whiteColor];
//            _historyText.backgroundColor =[UIColor whiteColor];
//            _brandView.backgroundColor =[UIColor whiteColor];
//            break;
//    case 1:
////        NSLog(@"@1111");
//            self.view.backgroundColor = [UIColor lightGrayColor];
//            _historyText.backgroundColor = [UIColor lightGrayColor];
//            _brandView.backgroundColor =[UIColor lightGrayColor];
//            break;
//    }
//
//}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
