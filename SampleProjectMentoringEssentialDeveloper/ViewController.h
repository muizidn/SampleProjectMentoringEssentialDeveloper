//
//  ViewController.h
//  SampleProjectMentoringEssentialDeveloper
//
//  Created by M on 03/11/22.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ViewController : BaseViewController

- (IBAction)goToScreen:(UIButton *)sender;
- (void)setGoToButtonTitleWithName: (NSString *) name;

@end

