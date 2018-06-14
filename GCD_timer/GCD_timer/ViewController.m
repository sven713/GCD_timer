//
//  ViewController.m
//  GCD_timer
//
//  Created by sve on 2018/6/14.
//  Copyright © 2018年 sve. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) dispatch_source_t timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{ // 设置回调
        NSLog(@"执行定时器方法-%@",[NSThread currentThread]);
    });
    dispatch_resume(timer); // 启动定时器
    self.timer = timer; // 必须用属性接住,否则被释放了无法执行
}


@end
