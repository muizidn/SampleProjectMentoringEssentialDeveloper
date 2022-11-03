//
//  HomeViewController.m
//  SampleProjectMentoringEssentialDeveloper
//
//  Created by M on 03/11/22.
//

#import "HomeViewController.h"
#import "SampleProjectMentoringEssentialDeveloper-Swift.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (IBAction)goToScreen:(UIButton *)sender {
    SecondViewController *vc = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:vc animated:TRUE];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setGoToButtonTitleWithName:@" Second - Native - Swift"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
