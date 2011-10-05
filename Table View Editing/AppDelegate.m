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
// Necessário para que o compilador possa criar os métodos getter e setter corretamente de names
@synthesize names;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Chama o método loadData quando a aplicação começar
    [self loadData];
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)loadData
{
    // Caminho em qual a aplicação irá buscas as informações
    NSString *path = [self pathForFileInDocuments:@"pessoas.plist"];
    // Tenta carregar um array a partir do arquivo
    NSMutableArray *p = [NSMutableArray arrayWithContentsOfFile:path];
    self.names = p;
    
    // Verifica se a contem dados o array
    if ([names count] < 1) {
        // Cria um array vazio
        names = [[NSMutableArray alloc] init];
    }
}

- (void)saveData 
{
    // Caminho em qual a aplicação irá salvar as informações
    NSString *path = [self pathForFileInDocuments:@"pessoas.plist"];
    
    // Verifica se tem arquivos a serem gravados
    if ([names count] > 0) {
        // Passa o array para o caminho a ser gravado
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

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Quando o aplicativo fica inativo ele usa o método saveData
    [self saveData];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Antes do aplicativo terminar ele usa o método saveData
    [self saveData];
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [super dealloc];
}

@end