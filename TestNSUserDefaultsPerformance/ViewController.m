//
//  ViewController.m
//  TestNSUserDefaultsPerformance
//
//  Created by tomfriwel on 08/05/2017.
//  Copyright © 2017 tomfriwel. All rights reserved.
//

#import "ViewController.h"

static NSString *key = @"TestUserDefautlsKey";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)storeAction:(id)sender {
    NSLog(@"store");
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSLog(@"data size:%@", [NSByteCountFormatter stringFromByteCount:data.length countStyle:NSByteCountFormatterCountStyleFile]);
    [userDefaults setObject:data forKey:key];
}

- (IBAction)readAction:(id)sender {
    NSLog(@"read");
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:key];
    NSLog(@"data size:%@", [NSByteCountFormatter stringFromByteCount:data.length countStyle:NSByteCountFormatterCountStyleFile]);
}

@end
