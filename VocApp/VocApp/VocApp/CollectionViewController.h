//
//  CollectionViewController.h
//  VocApp
//
//  Created by Tim Härle on 13.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UICollectionViewController <UICollectionViewDataSource,UICollectionViewDelegate,UINavigationBarDelegate,UINavigationControllerDelegate,UIGestureRecognizerDelegate,UIAlertViewDelegate>

- (void) loadComplete:(NSArray *)objects error:(NSError *)error;
-(void)reload;
-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer;
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
@end
