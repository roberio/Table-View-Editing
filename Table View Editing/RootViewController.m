//
//  RootViewController.m
//  Table View Editing
//
//  Created by Robério Vitória on 05/10/11.
//  Copyright 2011 iRANV Corporation. All rights reserved.
//

#import "RootViewController.h"
#import "EditStringViewController.h"
#import "AppDelegate.h"

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    // Adiciona o titulo na NavigationBar
    [self.navigationItem setTitle:@"Lista"];
    // Cria o botão do lado direito da NavigationBar
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction:)] autorelease];
    // Cria o botão do lado esquerdo da NavigationBar
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Editar" style:UIBarButtonItemStylePlain target:self action:@selector(editAction:)] autorelease];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // Atualiza os dados da tableView
    [self.tableView reloadData];
}

- (void)addAction:(id)sender
{
    NSMutableDictionary *novaPessoa = [[NSMutableDictionary alloc] init];
    [novaPessoa setValue:@"" forKey:@"nome"];
    // Adiciona novaPessoa no array nomes
    [appDelegate.names addObject:novaPessoa];
    
    EditStringViewController *editView = [[EditStringViewController alloc] init];
    editView.recebePessoa = novaPessoa;
    [self.navigationController pushViewController:editView animated:YES];
    [novaPessoa release];
    [editView release];
}

- (void)editAction:(id)sender
{
    if ([self.tableView isEditing]) {
		[self setEditing:NO animated:YES];
	} else {
		[self setEditing:YES animated:YES];
	}
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [appDelegate.names count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    
    // Configure the cell.
    NSDictionary *n = [appDelegate.names objectAtIndex:indexPath.row];
    NSString *titulo = [n valueForKey:@"nome"];
    
    cell.textLabel.text = titulo;

    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath 
{
    NSMutableDictionary *pesquisa = [appDelegate.names objectAtIndex:indexPath.row];   
    EditStringViewController *editView = [[EditStringViewController alloc] init];
    editView.recebePessoa = pesquisa;
    [self.navigationController pushViewController:editView animated:YES];
    [editView release];
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath 
{
	return NO;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	return UITableViewCellEditingStyleNone;
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIdexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath 
{
	if ([proposedDestinationIndexPath row] >= [appDelegate.names count]) {
		NSIndexPath *betterIndexPath = [NSIndexPath indexPathForRow:([appDelegate.names count] - 1) inSection:0];
		return betterIndexPath;
	}
	return proposedDestinationIndexPath;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath 
{
	[appDelegate.names exchangeObjectAtIndex:[fromIndexPath row] withObjectAtIndex:[toIndexPath row]];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated 
{
	[super setEditing:editing animated:animated];
	if ([self.tableView isEditing]) { 
		[self.tableView setEditing:editing animated:animated];
		[self.navigationItem.leftBarButtonItem setTitle:@"OK"];
    }else {
		[self.tableView setEditing:editing animated:animated];
		[self.navigationItem.leftBarButtonItem setTitle:@"Editar"];
	}
}

- (void)dealloc
{
    [super dealloc];
}

@end