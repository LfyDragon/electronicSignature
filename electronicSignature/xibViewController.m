//
//  xibViewController.m
//  electronicSignature
//
//  Created by ios2chen on 2018/1/9.
//  Copyright © 2018年 Lfy. All rights reserved.
//

#import "xibViewController.h"

@interface xibViewController ()

@property (nonatomic, copy) SignResult result;
@property (weak, nonatomic) IBOutlet UIImageView *iImageView;
@property (assign, nonatomic) CGPoint lastPoint;
@property (assign, nonatomic) BOOL isSwiping;
@end

@implementation xibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskLandscapeLeft;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.isSwiping = NO;
    UITouch *touch = [touches anyObject];
    self.lastPoint = [touch locationInView:self.iImageView];
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.isSwiping = YES;
    UITouch * touch = touches.anyObject;
    CGPoint currentPoint = [touch locationInView:self.iImageView];
    UIGraphicsBeginImageContext(self.iImageView.frame.size);
    [self.iImageView.image drawInRect:(CGRectMake(0, 0, self.iImageView.frame.size.width, self.iImageView.frame.size.height))];
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), self.lastPoint.x, self.lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(),kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 3.0);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(),0.0, 0.0, 0.0, 1.0);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.iImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.lastPoint = currentPoint;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if(!self.isSwiping) {
        UIGraphicsBeginImageContext(self.iImageView.frame.size);
        [self.iImageView.image drawInRect:(CGRectMake(0, 0, self.iImageView.frame.size.width, self.iImageView.frame.size.height))];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 3.0);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), self.lastPoint.x, self.lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), self.lastPoint.x, self.lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        self.iImageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
}

-(void)signImageWithBlock:(SignResult)result{
    
    self.result = result;
}

- (IBAction)cancelSign:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clearSign:(id)sender {
    self.iImageView.image = nil;
}
- (IBAction)signDone:(id)sender {
    
    if (self.result) {
        self.result(self.iImageView.image);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
