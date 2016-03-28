//
//  ViewController.m
//  R to L
//
//  Created by Test on 22/08/15.
//  Copyright (c) 2015 Ktr. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+PasswordField.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *yesButton;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)yesBtnAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.passwordField addPasswordField];
    
//    CALayer *bottomBorder = [CALayer layer];
//    bottomBorder.frame = CGRectMake(0.0f, self.passwordField.frame.size.height - 1, self.passwordField.frame.size.width, 1.0f);
//    bottomBorder.backgroundColor = [UIColor blackColor].CGColor;
//    [self.passwordField.layer addSublayer:bottomBorder];
//    
//    CALayer *leftBorder = [CALayer layer];
//    leftBorder.frame = CGRectMake(0.0f, 20.0f, 1.0f, self.passwordField.frame.size.height-20);
//    leftBorder.backgroundColor = [UIColor blackColor].CGColor;
//    [self.passwordField.layer addSublayer:leftBorder];
//    
//    CALayer *rightBorder = [CALayer layer];
//    rightBorder.frame = CGRectMake(self.passwordField.frame.size.width-1, 20.0f, 1.0f, self.passwordField.frame.size.height-20);
//    rightBorder.backgroundColor = [UIColor blackColor].CGColor;
//    [self.passwordField.layer addSublayer:rightBorder];
//    
    
   [ [NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateUIForRTLSupportConfirmedScreen:) name:@"AppLayoutDirectionTrigger" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///Yes button Action
- (IBAction)yesBtnAction:(id)sender {
    
    if ([UIApplication sharedApplication].userInterfaceLayoutDirection == UIUserInterfaceLayoutDirectionLeftToRight) {
        NSLog(@"L to R");
        NSArray* languages = [NSArray arrayWithObjects:@"ar", nil];
        [[NSUserDefaults standardUserDefaults] setObject:languages forKey:@"AppleLanguages"];
        [[NSUserDefaults standardUserDefaults]synchronize];
       
        [self.yesButton setSemanticContentAttribute:UISemanticContentAttributeForceLeftToRight];
        
        if([[[UIDevice currentDevice]systemVersion]floatValue]>=9.0) {
            [[UINavigationBar appearance] setSemanticContentAttribute:UISemanticContentAttributeForceLeftToRight];
            [[UITabBar appearance] setSemanticContentAttribute:UISemanticContentAttributeForceLeftToRight];
        }
    }
    
    if ([UIApplication sharedApplication].userInterfaceLayoutDirection == UIUserInterfaceLayoutDirectionRightToLeft){
        NSLog(@"R to L");
        NSArray* languages = [NSArray arrayWithObjects:@"en", nil];
        [[NSUserDefaults standardUserDefaults] setObject:languages forKey:@"AppleLanguages"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
            [self.yesButton setSemanticContentAttribute:UISemanticContentAttributeForceRightToLeft];
        
        if([[[UIDevice currentDevice]systemVersion]floatValue]>=9.0) {
            [[UINavigationBar appearance] setSemanticContentAttribute:UISemanticContentAttributeForceRightToLeft];
            [[UITabBar appearance] setSemanticContentAttribute:UISemanticContentAttributeForceRightToLeft];
        }
    }
    
    [self.view updateConstraints];
    [self.view updateConstraintsIfNeeded];
    [self.view updateFocusIfNeeded];
    
    [self.view setNeedsLayout];
    [self.view setNeedsDisplay];

    
    
    
    
//     [[NSNotificationCenter defaultCenter]postNotificationName:@"AppLayoutDirectionTrigger" object:nil];
    
  

    
//    [self.view layoutIfNeeded];
//    [self.view setNeedsDisplay];
//
//    [super updateFocusIfNeeded];
//    [super updateViewConstraints];
//    [super setNeedsFocusUpdate];
    
//    [UIView animateWithDuration:1.0f delay:0.0f usingSpringWithDamping:0.5f initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        [self.view setNeedsUpdateConstraints];
//        [self.view layoutIfNeeded];
//    } completion:NULL];
    
}

-(void)updateUIForRTLSupportConfirmedScreen:(NSNotification *)notification
{
    for (UIView *view in self.view.subviews)
    {
        [view setNeedsDisplay];
        
        [self.view semanticContentAttribute];
        
           }
}


@end
