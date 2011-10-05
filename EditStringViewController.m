//
//  EditStringViewController.m
//  Table View Editing
//
//  Created by Robério Vitória on 05/10/11.
//  Copyright 2011 iRANV Corporation. All rights reserved.
//

#import "EditStringViewController.h"
#import "AppDelegate.h"

@implementation EditStringViewController

@synthesize recebePessoa;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStylePlain target:self action:@selector(doneAction:)];
    self.navigationItem.hidesBackButton = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)doneAction:(id)sender
{
    [recebePessoa setValue:textField.text forKey:@"nome"];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    textField.text = [recebePessoa objectForKey:@"nome"];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[textField becomeFirstResponder];	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc 
{
    [super dealloc];
}

@end