//
//  ViewController.m
//  SMUExampleOne
//
//  Created by Eric Larson on 1/21/15.
//  Copyright (c) 2015 Eric Larson. All rights reserved.
//

#import "ViewController.h"
#import "ImageModel.h"
#import "Cars.h"
@interface ViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) UIImageView* imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *ModelLabel;
@property (weak, nonatomic) IBOutlet UILabel *MakeLabel;
@property (weak, nonatomic) IBOutlet UILabel *PriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *ColorLabel;
- (IBAction)JumpToWeb:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIStepper *monthSteper;

//- (IBAction)JumpToWeb:(UIButton *)sender;
- (IBAction)stepperValueChanged:(UIStepper *)sender;

@property (weak, nonatomic) IBOutlet UILabel *ARPLabel;
@property (weak, nonatomic) IBOutlet UILabel *LoanTermLabel;

@property (strong,nonatomic) ImageModel* myImageModel;
@property (strong,nonatomic) Cars* myCarModel;

@end

@implementation ViewController

- (IBAction)JumpToWeb:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.cars.com"]];
}

-(ImageModel*)myImageModel{
    
    if(!_myImageModel)
        _myImageModel =[ImageModel sharedInstance];
    
    return _myImageModel;
}

-(Cars*)myCarModel{
    
    if(!_myCarModel)
        _myCarModel =[Cars sharedInstance];
    
    return _myCarModel;
}


-(NSString*)imageName{
    
    if(!_imageName)
        _imageName = @"bmw";
    
    return _imageName;
}

-(NSString*)imageIndex{
    
    if(!_imageIndex)
        _imageIndex = @"0";
    
    return _imageIndex;
}

-(UIImageView*)imageView{
    
    if(!_imageView)
        _imageView = [[UIImageView alloc] initWithImage:[[ImageModel sharedInstance] getImageWithName:self.imageName]];
    
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.frame = CGRectMake(0, 440, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    return _imageView;
}

-(void)changeLabelColor{
//    static BOOL seeded = NO;
//    if (!seeded){
//        seeded = YES;
//        time(NULL);
//    }
    
    CGFloat red = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
    
    [_ColorLabel setTextColor:[UIColor colorWithRed:red green:green blue:blue alpha:1]];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.imageView.image.size;
    self.scrollView.minimumZoomScale = 0.1;
    self.scrollView.maximumZoomScale = 4;
    self.scrollView.delegate = self;
    
    //------------set table----------------
    NSString *modelName = @"Model:  ";
    modelName = [modelName stringByAppendingString:[Cars sharedInstance].CarNames[[_imageIndex intValue]]];
    NSString *MakeName = @"Make:  ";
    MakeName = [MakeName stringByAppendingString:[Cars sharedInstance].CarBrands[[_imageIndex intValue]]];
    NSString *Price = @"Price:  ";
    Price = [Price stringByAppendingString:[Cars sharedInstance].CarPrices[[_imageIndex intValue]]];
    
    self.ModelLabel.text = modelName;
    self.MakeLabel.text = MakeName;
    self.PriceLabel.text = Price;
    
    //------------set table----------------
    
    
    
    

    self.monthSteper.transform = CGAffineTransformMakeScale(0.7, 0.7);
    
    //------------set label border----------------
    self.ARPLabel.layer.borderColor = [[UIColor grayColor]CGColor];
    self.ARPLabel.layer.borderWidth = 1;
    self.LoanTermLabel.layer.borderColor = [[UIColor grayColor]CGColor];
    self.LoanTermLabel.layer.borderWidth = 1;
    //------------set label border----------------
    
    
    
//    self.LoanTermLabel.text = self.monthSteper.
//    [self changeLabelColor];
//    [_ColorLabel setTextColor:[UIColor redColor]];
//    NSTimer *timer = NSTimer sche
    //timer
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeLabelColor) userInfo:nil repeats:(YES)];
    
    [timer fire];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}


- (IBAction)stepperValueChanged:(UIStepper *)sender {
    NSString *stepperValue = [NSString stringWithFormat:@"%.0f", sender.value];
    self.LoanTermLabel.text = stepperValue;
}
@end
