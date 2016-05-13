//
//  ViewController.m
//  Demo
//
//  Created by admin on 16/5/13.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "ViewController.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width


@interface ViewController ()<UITextFieldDelegate,UITextViewDelegate>
@property(strong,nonatomic)UITextField *textField;
@property(strong,nonatomic)UIView *topView;

@property(strong,nonatomic)UIButton *saveBtn;//保存按钮


@property(strong,nonatomic)UITextView *textView;//文本

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUI];
}
#pragma mark - initUI
-(void)initUI
{
    
    //topView
    self.topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    self.topView.backgroundColor=[UIColor redColor];
    
    
    //保存
    self.saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.saveBtn.frame = CGRectMake(kScreenWidth-60 , 0, 60, 40);
    [self.saveBtn setTitle:@"确认" forState:UIControlStateNormal];
    [self.saveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.saveBtn setBackgroundColor:[UIColor whiteColor]];
    [self.saveBtn addTarget:self action:@selector(saveAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:self.saveBtn];

    //文本
    self.textView =[[UITextView alloc] initWithFrame:CGRectMake(10, 5, kScreenWidth-80, 30)];
    self.textView.delegate = self;
    [self.topView addSubview:self.textView];
    
    
    self.textField=[[UITextField alloc]initWithFrame:CGRectMake(35,84, kScreenWidth-70, 40)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"随便输入";
    self.textField.delegate = self;
    [self.textField setClearButtonMode:UITextFieldViewModeAlways];
//    [self.textField setKeyboardType:UIKeyboardTypeNumberPad];
    
    
    self.textField.inputAccessoryView = self.topView;
    [self.view addSubview:self.textField];
    
}

#pragma mark  - 保存
-(void)saveAction:(UIButton *)btn
{
    NSLog(@"保存");
    
    NSLog(@"=文本全部内容==%@",self.textView.text);

    
    
    [self.textField resignFirstResponder];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.textField resignFirstResponder];
}
#pragma mark  -textViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView
{
//    NSLog(@"textView开始编辑");
}
-(void)textViewDidChange:(UITextView *)textView
{
//    NSLog(@"textView已经改变编辑");
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
//    NSLog(@"textView结束编辑");
//    NSLog(@"=文本全部内容==%@",textView.text);
}
-(void)textViewDidChangeSelection:(UITextView *)textView
{
//    NSLog(@"textView DidChangeSelection");
}
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return YES;
}






#pragma mark - textFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
//    NSLog(@"textField开始编辑");
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
//    NSLog(@"textField结束编辑");
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
