//
//  ViewController.m
//  SimpleLogin
//
// The MIT License (MIT)
//
//  Created by Doreen Theverapperuma on 9/2/15.
//  Copyright (c) 2015 DCT. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


#import "ViewController.h"
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]


@interface ViewController ()


@property(nonatomic) UIView  *loginView;
@property(nonatomic) UIView  *firstView;

- (void)createLoginView;
- (void)createfirstView;

@end

@implementation ViewController{
    
    
    UITextField *userNameField;
    UITextField *userPasswordField;
  

    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createLoginView];
    //load loginView
    
}

- (void)createLoginView{
    
    
    /*Login View*/
    //Size is the same size as the self.view
    self.loginView = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x,self.view.bounds.origin.y, self.view.bounds.size.width,self.view.bounds.size.height)];
    //Change background color
    [self.loginView setBackgroundColor:Rgb2UIColor(0, 255, 213)];
    
    
    /*User Name text Field*/
    userNameField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-100, self.view.bounds.size.width/2+100, 200, 50)];
    userNameField.textColor =  Rgb2UIColor(0,0,0);
    userNameField.backgroundColor = [UIColor colorWithRed:96 green:96 blue:96 alpha:0.5];
    [userNameField setFont:[UIFont systemFontOfSize:16]];
    userNameField.placeholder=@"user name";
    userNameField.returnKeyType = UIReturnKeyNext;
    userNameField.keyboardType = UIKeyboardTypeDefault;
    
    //Padding
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    userNameField.leftView = paddingView;
    userNameField.leftViewMode = UITextFieldViewModeAlways;
    
    //Rounded corners
    userNameField.layer.cornerRadius = 20;
    
   //Annimation, Login appearence
    userNameField.alpha = 0.0;
    [UIView beginAnimations:@"Fade-in" context:NULL];
    [UIView setAnimationDuration:1.5];
    userNameField.alpha = 1.0;
    [UIView commitAnimations];
    
    
    /*User Password text Field*/
    userPasswordField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-100, self.view.bounds.size.width/2+160, 200, 50)];
    userPasswordField.textColor = Rgb2UIColor(0,0,0);
    userPasswordField.backgroundColor =[UIColor colorWithRed:96 green:96 blue:96 alpha:0.5];
    [userPasswordField setFont:[UIFont systemFontOfSize:16]];
    userPasswordField.placeholder=@"password";
    userPasswordField.returnKeyType = UIReturnKeyDone;
    userPasswordField.keyboardType = UIKeyboardTypeDefault;
    userPasswordField.secureTextEntry = YES;
    
    //Padding
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    userPasswordField.leftView = paddingView;
    userPasswordField.leftViewMode = UITextFieldViewModeAlways;
    
    //Rounded corners
    userPasswordField.layer.cornerRadius = 20;
    
    //Annimation, Login appearence
    userPasswordField.alpha = 0.0;
    [UIView beginAnimations:@"Fade-in" context:NULL];
    [UIView setAnimationDuration:2.5];
    userPasswordField.alpha = 1.0;
    [UIView commitAnimations];
  
    //add userNameField,userPasswordField loginView
    [self.loginView addSubview:userNameField];
    [self.loginView addSubview:userPasswordField];
    [self.view addSubview:self.loginView];
    
    
    //Delegate
    userNameField.delegate=self;
    userPasswordField.delegate=self;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if(textField == userNameField) {
        userNameField.backgroundColor =[UIColor colorWithRed:96 green:96 blue:96 alpha:0.8];
        userPasswordField.backgroundColor =[UIColor colorWithRed:96 green:96 blue:96 alpha:0.5];
    }
    
    if(textField == userPasswordField) {
        userPasswordField.backgroundColor =[UIColor colorWithRed:96 green:96 blue:96 alpha:0.8];
        userNameField.backgroundColor =[UIColor colorWithRed:96 green:96 blue:96 alpha:0.5];
    }
  
    
   return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if(textField == userNameField) {
        [userNameField resignFirstResponder];
        [userPasswordField becomeFirstResponder];
        userNameField.backgroundColor =[UIColor colorWithRed:96 green:96 blue:96 alpha:0.5];
       }
    
    if(textField == userPasswordField) {
        [userPasswordField resignFirstResponder];
        userPasswordField.backgroundColor =[UIColor colorWithRed:96 green:96 blue:96 alpha:0.5];
        
        //Remove the loginIn View
       [self.loginView removeFromSuperview];
       [self createfirstView];

        
        }
    
    
    return YES;
}


- (void)createfirstView{
    
    /*First View*/
    //Size is the same size as the self.view
    self.firstView = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x,self.view.bounds.origin.y, self.view.bounds.size.width,self.view.bounds.size.height)];
    //Change background color
    [self.firstView setBackgroundColor:Rgb2UIColor(255, 0, 128)];
    
    //Add to the view
    [self.view addSubview:self.firstView];

    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
