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

@property (strong,nonatomic) ImageModel* myImageModel;
@property (strong,nonatomic) Cars* myCarModel;

@end

@implementation ViewController

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
    _imageView.frame = CGRectMake(0, 480, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    return _imageView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.imageView.image.size;
    self.scrollView.minimumZoomScale = 0.1;
    self.scrollView.maximumZoomScale = 4;
    self.scrollView.delegate = self;
    
    NSString *modelName = @"Model:  ";
    modelName = [modelName stringByAppendingString:[Cars sharedInstance].CarNames[[_imageIndex intValue]]];
    NSString *MakeName = @"Make:  ";
    MakeName = [MakeName stringByAppendingString:[Cars sharedInstance].CarBrands[[_imageIndex intValue]]];
    NSString *Price = @"Price:  ";
    Price = [Price stringByAppendingString:[Cars sharedInstance].CarPrices[[_imageIndex intValue]]];
    self.ModelLabel.text = modelName;
    self.MakeLabel.text = MakeName;
    self.PriceLabel.text = Price;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}

@end
