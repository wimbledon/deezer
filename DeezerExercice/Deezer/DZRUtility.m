//
//  DZUtility.m
//  Deezer
//
//  Created by David Liu on 2/20/19.
//  Copyright © 2019 Deezer. All rights reserved.
//

#import "DZRUtility.h"

@implementation DZRUtility

+ (void)showAlertWithTitle:(nullable NSString *)title
                   message:(nullable NSString *)message
               actionTitle:(nullable NSString *)actionTitle
              dismissTitle:(nullable NSString *)dismissTitle
  presentingViewController:(nullable UIViewController *)presentingViewController {
    UIAlertController *alertController =
    [UIAlertController alertControllerWithTitle:title
                                        message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    if (actionTitle) {
        UIAlertAction *action =
        [UIAlertAction actionWithTitle:actionTitle
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *_Nonnull action) {
                               }];
        [alertController addAction:action];
    }
    
    if (dismissTitle) {
        UIAlertAction *dismissAction =
        [UIAlertAction actionWithTitle:dismissTitle
                                 style:UIAlertActionStyleCancel
                               handler:^(UIAlertAction * _Nonnull action) {
                               }];
        [alertController addAction:dismissAction];
    }
    
    if (presentingViewController) {
        [presentingViewController presentViewController:alertController animated:YES completion:nil];
    } else {
        UIViewController *viewController = [[UIViewController alloc] init];
        viewController.view.backgroundColor = UIColor.clearColor;
        UIWindow *window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        window.rootViewController = viewController;
        window.windowLevel = UIWindowLevelAlert + 1;
        [window makeKeyAndVisible];
        [viewController presentViewController:alertController animated:YES completion:nil];
    }
}

@end
