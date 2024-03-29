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
// Cria a variável -names do tipo NSMutableArray- e suas propriedades(métodos getter e setter)
@property (nonatomic, retain) NSMutableArray *names;

// Método para carregar os dados apartir do Plist
- (void)loadData;
// Método para salvar os dados apartir do Plist
- (void)saveData;
// Método para mostrar o caminho em que será salvo os dadoss
- (NSString *)pathForFileInDocuments:(NSString *)filename;

@end
