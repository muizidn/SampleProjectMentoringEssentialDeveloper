//
//  ViewController.m
//  SampleProjectMentoringEssentialDeveloper
//
//  Created by M on 03/11/22.
//

#import "ViewController.h"
#import "SampleProjectMentoringEssentialDeveloper-Swift.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)goToSecond:(UIBarButtonItem *)sender {
    SecondViewController *vc = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:TRUE];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColor.greenColor];
}


@end
