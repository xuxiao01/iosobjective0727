//
//  SecondViewController.m
//  iosobjective-c0727
//
//  Created by bys on 27/07/2017.
//  Copyright © 2017 bys. All rights reserved.
//

#import "SecondViewController.h"
@import MobileCenterCrashes;
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MSCrashes generateTestCrash];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
