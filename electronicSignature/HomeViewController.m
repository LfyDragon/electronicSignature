//
//  HomeViewController.m
//  electronicSignature
//
//  Created by ios2chen on 2018/1/9.
//  Copyright © 2018年 Lfy. All rights reserved.
//

#import "HomeViewController.h"
#import "xibViewController.h"
@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iImageView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBarHidden = YES;
    
}
- (IBAction)xibSignature:(id)sender {
    
    xibViewController *xibVC = [[xibViewController alloc]init];
    [xibVC signImageWithBlock:^(UIImage *signImage) {
        self.iImageView.image = signImage;
    }];
    [self presentViewController:xibVC animated:YES completion:nil];
    
}
- (IBAction)noXibSignatue:(id)sender {
    
    
    
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
