//
//  EditStringViewController.h
//  Table View Editing
//
//  Created by Robério Vitória on 05/10/11.
//  Copyright 2011 iRANV Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppDelegate;

@interface EditStringViewController : UIViewController <UITextFieldDelegate>
{
    AppDelegate *appDelegate;
    IBOutlet UITextField *textField;
}

@property (nonatomic, retain) NSMutableDictionary *recebePessoa;

- (void)doneAction:(id)sender;

@end