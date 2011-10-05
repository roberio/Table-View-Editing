//
//  Table_View_EditingAppDelegate.h
//  Table View Editing
//
//  Created by Robério Vitória on 05/10/11.
//  Copyright 2011 iRANV Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@property (nonatomic, retain) NSMutableArray *names;

- (void)loadData;
- (void)saveData;
- (NSString *)pathForFileInDocuments:(NSString *)filename;

@end
