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
    
    brandScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(343, 595, self.view.frame.size.width, self.view.frame.size.height)];

    [brandScrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2)];
// subview that can be scroll at different direction
//    [self.view addSubview:brandScrollView];
    
    [brandScrollView addSubview:_historyText];
    [brandScrollView addSubview:_brandView];
    [brandScrollView addSubview:_SwitchButton];
    [brandScrollView addSubview:_DarkModelLabel];
    [brandScrollView addSubview:_titleLabel];
    [brandScrollView addSubview:_brandPicker];
    [brandScrollView addSubview:stackView];
    [brandScrollView addSubview:darkModelStackView];
    
    
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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [self.historyText setContentOffset:CGPointMake(0, 0) animated:YES];
    self.historyText.text = [BrandsAndHistory sharedInstance].BrandHistory[row];
    [self.historyText setContentOffset:CGPointMake(0, 0) animated:YES];

    NSString *logoImageName = [BrandsAndHistory sharedInstance].BrandNames[row];
    logoImageName = [logoImageName stringByAppendingString:@"_ic"];
//    NSLog(@"%@",logoImageName);
//    UIImage* image = [UIImage imageNamed:logoImageName];
    UIImage* image = nil;
    image = [UIImage imageNamed:logoImageName];
    self.brandView.image = image;

//    self.historyText.scrollsToTop = true;
//    [[UIImageView alloc] initWithImage:image];
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
