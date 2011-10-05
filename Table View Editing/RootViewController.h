//
//  RootViewController.h
//  Table View Editing
//
//  Created by Robério Vitória on 05/10/11.
//  Copyright 2011 iRANV Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppDelegate;

@interface RootViewController : UITableViewController
{
    AppDelegate *appDelegate;
}

// Método para adiconar
- (void)addAction:(id)sender;
// Método para editar
- (void)editAction:(id)sender;

@end
