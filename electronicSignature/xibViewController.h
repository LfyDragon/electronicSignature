//
//  xibViewController.h
//  electronicSignature
//
//  Created by ios2chen on 2018/1/9.
//  Copyright © 2018年 Lfy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SignResult)(UIImage *signImage);
@interface xibViewController : UIViewController

-(void)signImageWithBlock:(SignResult)result;
@end
