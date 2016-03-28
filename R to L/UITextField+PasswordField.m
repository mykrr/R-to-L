//
//  UITextField+PasswordField.m
//  R to L
//
//  Created by Test on 26/08/15.
//  Copyright (c) 2015 Ktr. All rights reserved.
//

#import "UITextField+PasswordField.h"

@implementation UITextField (PasswordField)


-(void)addPasswordField{
    self.rightViewMode = UITextFieldViewModeWhileEditing;
    
    UIButton *showTextBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    showTextBtn.frame = CGRectMake(0, 0, 30, 30);
    [showTextBtn setImage:[UIImage imageNamed:@"hideshow"] forState:UIControlStateNormal];
    showTextBtn.titleLabel.textColor = [UIColor blackColor];
    showTextBtn.layer.borderColor = [UIColor grayColor].CGColor;
    showTextBtn.layer.borderWidth = 1;
    [showTextBtn addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [showTextBtn addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self setRightView:showTextBtn];
}
//Start Button clicked
- (IBAction)touchDown:(id)sender {
    self.secureTextEntry = FALSE;
    
}
//Button released
- (IBAction)touchUpInside:(id)sender {
    self.secureTextEntry = TRUE;
}

@end
