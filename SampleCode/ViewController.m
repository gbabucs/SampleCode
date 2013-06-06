//
//  ViewController.m
//  SampleCode
//
//  Created by tcs on 12/7/12.
//  Copyright (c) 2012 tcs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    inputView=[[UITextView alloc] initWithFrame:CGRectMake(20, 20, 300, 300)];
    inputView.autocapitalizationType=UITextAutocapitalizationTypeNone;
    inputView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:inputView];
    
    
    outputView=[[UITextView alloc] initWithFrame:CGRectMake(20, 450, 300, 300)];
    outputView.backgroundColor=[UIColor yellowColor];

    outputView.editable=NO;
    [self.view addSubview:outputView];
    
    buttonSubmit=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonSubmit.frame=CGRectMake(20, 350, 100, 50);
    [buttonSubmit setTitle:@"Submit" forState:UIControlStateNormal];
    [buttonSubmit addTarget:self action:@selector(submitClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonSubmit];
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)submitClick
{
    Interpreter *interpreter=[Interpreter new];
    outputView.text=[interpreter parseString:inputView.text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
