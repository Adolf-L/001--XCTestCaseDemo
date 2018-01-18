//
//  ViewController.m
//  001--XCTestCaseDemo
//
//  Created by Rnthking on 2018/1/18.
//  Copyright © 2018年 Adolf. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "LoginSuccessfulViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 添加一张图片
//    UIImageView *someImageView = [[Person alloc] getMyPhotoView];
//    [self.view addSubview:someImageView];
    
    // 最后一个知识点，自动化测试
    
}

- (IBAction)LoginTextField:(UITextField *)sender {
    switch (sender.tag) {
        case 0:
            self.accountTextField.text = sender.text;
            break;
        case 1:
            self.passwordTextField.text = sender.text;
            break;
        default:
            break;
    }
}

- (IBAction)Login:(UIButton *)sender {
    if ([self isVerifySuccess]) {
        LoginSuccessfulViewController *loginSsVc = [LoginSuccessfulViewController new];
        [self presentViewController:loginSsVc animated:YES completion:^{
            UILabel *successLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 200, 80)];
            successLabel.text = @"登录成功,2秒后返回!";
            successLabel.textAlignment = NSTextAlignmentJustified;
            [loginSsVc.view addSubview:successLabel];
            loginSsVc.view.backgroundColor = [UIColor greenColor];
            dispatch_async(dispatch_get_main_queue(), ^{
                [NSThread sleepForTimeInterval:2];
                [loginSsVc dismissViewControllerAnimated:YES completion:nil];
            });
        }];
    } else {
        self.passwordTextField.backgroundColor = [UIColor redColor];
    }
}

- (BOOL)isVerifySuccess {
    if ([self.accountTextField.text isEqualToString:@"88888888"] && [self.passwordTextField.text isEqualToString: @"88888888"]) {
        return YES;
    }
    return NO;
}

- (void)IwantToTextByUnitDemo {
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
