//
//  RELViewController.m
//  SquashTest
//
//  Created by Sohaney,Arjun on 5/15/13.
//  Copyright (c) 2013 Sohaney,Arjun. All rights reserved.
//

#import "RELViewController.h"

@interface RELViewController ()

@end

@implementation RELViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) exception:(id)sender {
    NSDictionary *userInfo = @{
                               @"StringKey": @"Hello, world!",
                               @"ArrayKey": @[[NSNumber numberWithInt:1], [NSNull null]],
                               @"sender": sender
                               };
    [[NSException exceptionWithName:@"STBoomException" reason:@"Boom!" userInfo:userInfo] raise];
}

- (IBAction) signal:(id)sender {
    raise(SIGABRT);
}

@end
