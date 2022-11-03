//
//  ViewController.m
//  SampleProjectMentoringEssentialDeveloper
//
//  Created by M on 03/11/22.
//

#import "ViewController.h"
#import "SampleProjectMentoringEssentialDeveloper-Swift.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *screenName;

@end

@implementation ViewController
- (IBAction)goToSecond:(UIBarButtonItem *)sender {
    SecondViewController *vc = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:TRUE];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableString *mutableTitle = [[NSMutableString alloc] initWithString:self.title];
    [mutableTitle appendString:@" - "];
    [mutableTitle appendString:self.screenName.text];
    [self setTitle: mutableTitle];
}


@end
