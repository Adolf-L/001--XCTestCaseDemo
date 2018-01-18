//
//  PersonTests.m
//  001--XCTestCaseDemoTests
//
//  Created by Rnthking on 2018/1/18.
//  Copyright © 2018年 Adolf. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"


@interface PersonTests : XCTestCase<PersonDelegate>

@end

@implementation PersonTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    //1. 简单测试
    Person *p = [Person new];
    [p tellOthersName];
    
    //2. 加载bundle资源时需要注意一个点，通过 bundleForClass 来进行加载！
    XCTAssertTrue([[p getMyPhotoView] isMemberOfClass:[UIImageView class]]);
    NSBundle *bundle = [NSBundle bundleForClass:[PersonTests class]];
    NSBundle *main = [NSBundle mainBundle];
    NSLog(@"%@ ============ %@", bundle, main);
}

    //3.异步测试里面可能会包含 通知、block、代理等 回调方式
- (void)testAsynchronousBlock {
    //测试异步加载步骤：
    //3.1创建一个异步测试异常
    XCTestExpectation * asyncTestExpec = [self expectationWithDescription:@"Asynchronous testing have done"];
    //3.2创建对象并且调用方法
    Person *p = [Person new];
    [p doSomeTasksAsynchronous:^(NSString *doneInfo) {
        //3.3 测试是否 "按时" 回调成功
        [asyncTestExpec fulfill];
        
        //3.4测试回调的结果是否正确
        XCTAssertEqualObjects(@"finished task Asynchronous", doneInfo);
    }];
    
    //3.5 设定时间
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        NSLog(@"successful");
    }];
}

    //3.6 代理
- (void)testAsynchronousWithDelegate {
    Person *p = [Person new];
    p.delegate = self;
//    if (p.delegate) { //测试里面尽量不要有判断
//    }
    XCTAssertNotNil([p.delegate becomeSuperMan]);
}

- (NSString *)becomeSuperMan {
    [NSThread sleepForTimeInterval:2];
    return @"I am a sleep super man";
}

- (void)testPerformanceExample {
    [self measureBlock:^{
        //性能测试
        [self testAsynchronousBlock];
    }];
}

@end
