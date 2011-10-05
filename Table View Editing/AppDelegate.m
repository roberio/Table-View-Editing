//
//  Table_View_EditingAppDelegate.m
//  Table View Editing
//
//  Created by Robério Vitória on 05/10/11.
//  Copyright 2011 iRANV Corporation. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;
@synthesize names;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self loadData];
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)loadData
{
    NSString *path = [self pathForFileInDocuments:@"pessoas.plist"];
    NSMutableArray *p = [NSMutableArray arrayWithContentsOfFile:path];
    self.names = p;
    
    if ([names count] < 1) {
        names = [[NSMutableArray alloc] init];
    }
}

- (void)saveData 
{
    NSString *path = [self pathForFileInDocuments:@"pessoas.plist"];
    
    if ([names count] > 0) {
        [names writeToFile:path atomically:NO];
    }
}

- (NSString *)pathForFileInDocuments:(NSString *)filename 
{
    NSString *homePath = NSHomeDirectory();
    
    homePath = [homePath stringByAppendingPathComponent:@"Documents"];
    homePath = [homePath stringByAppendingPathComponent:filename];
    
    return homePath;
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [super dealloc];
}

@end