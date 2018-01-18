//
//  Person.m
//  001--XCTestCaseDemoTests
//
//  Created by Rnthking on 2018/1/18.
//  Copyright © 2018年 Adolf. All rights reserved.
//

#import "Person.h"

@implementation Person



- (void)tellOthersName {
    NSLog(@"my name is Adolf");
}

- (UIImageView *)getMyPhotoView {
    UIImageView *photoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"001" inBundle:[NSBundle mainBundle] compatibleWithTraitCollection:nil]];
    return photoView;
}

- (void)doSomeTasksAsynchronous:(void (^)(NSString *))doneBlock {
    //主线程
    NSLog(@"the mian thread is :%@", [NSThread currentThread]);
    
    //Submits a block for asynchronous execution on a dispatch queue and returns immediately.
    //接受一个block在一个派发队列里面异步执行，执行完毕，立刻返回！注意，这里要填写main queue！，返回的时候才是在主队列
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQueue  , ^{
        
        NSLog(@"I am executing in main queue via Asynchronous : %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:3];
        NSString *tagString = @"finished task Asynchronous";
        
        //异步方式，回到主线程,进行回调 【这里的block为什么可以直接获取变量？】
        dispatch_async(dispatch_get_main_queue(), ^{
            doneBlock(tagString);
        });
    });
    
}

@end
