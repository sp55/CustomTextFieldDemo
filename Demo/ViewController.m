//
//  ViewController.m
//  Demo
//
//  Created by admin on 16/5/13.
//  Copyright © 2016年 AlezJi. All rights reserved.
//http://blog.csdn.net/liuyang11908/article/details/50814865
// IOS TextField 输入银行卡号格式化（每四位中间空一格）

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
    self.textField.placeholder = @"银行卡输入";
    self.textField.delegate = self;
    [self.textField setClearButtonMode:UITextFieldViewModeAlways];
//    [self.textField setKeyboardType:UIKeyboardTypeNumberPad];
    
    
    self.textField.inputAccessoryView = self.topView;
    [self.view addSubview:self.textField];
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (textField == self.textField) {
        NSString *text = [self.textField text];
        
        NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
        string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
            return NO;
        }
        
        text = [text stringByReplacingCharactersInRange:range withString:string];
        text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        NSString *newString = @"";
        while (text.length > 0) {
            NSString *subString = [text substringToIndex:MIN(text.length, 4)];
            newString = [newString stringByAppendingString:subString];
            if (subString.length == 4) {
                newString = [newString stringByAppendingString:@" "];
            }
            text = [text substringFromIndex:MIN(text.length, 4)];
        }
        
        newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
        
        // 限制长度
        if (newString.length >= 24) {
            return NO;
        }
        
        [self.textField setText:newString];
        
        return NO;
        
    }
    return YES;
}


// 银行卡号转正常号 － 去除4位间的空格
-(NSString *)bankNumToNormalNum
{
    return [self.textField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
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
