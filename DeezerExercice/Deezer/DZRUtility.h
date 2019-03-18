//
//  DZUtility.h
//  Deezer
//
//  Created by David Liu on 2/20/19.
//  Copyright © 2019 Deezer. All rights reserved.
//

@import UIKit;

@interface DZRUtility : NSObject

+ (void)showAlertWithTitle:(nullable NSString *)title
                   message:(nullable NSString *)message
               actionTitle:(nullable NSString *)actionTitle
              dismissTitle:(nullable NSString *)dismissTitle
  presentingViewController:(nullable UIViewController *)presentingViewController;

@end
