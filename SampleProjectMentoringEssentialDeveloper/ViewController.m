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
@property (weak, nonatomic) IBOutlet UIButton *goToScreen;

@end

@implementation ViewController
- (IBAction)goToScreen:(UIButton *)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle: self.screenName.text];
}

- (void)setGoToButtonTitleWithName: (NSString *) name
{
    NSMutableString *mutableButtonTitle = [[NSMutableString alloc] initWithString:@"goTo"];
    [mutableButtonTitle appendString:name];
    [self.goToScreen setTitle:mutableButtonTitle forState:UIControlStateNormal];
}


@end
