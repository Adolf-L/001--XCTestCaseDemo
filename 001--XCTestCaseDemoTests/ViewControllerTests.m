//
//  ViewControllerTests.m
//  001--XCTestCaseDemoTests
//
//  Created by Rnthking on 2018/1/18.
//  Copyright © 2018年 Adolf. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface ViewControllerTests : XCTestCase

@property (nonatomic, strong) ViewController *vc;

@end

@implementation ViewControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testViewController {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    self.vc = [ViewController new];
    
}

//测试策略
    //1.测试方法没有返回值 （最简单）
    //2.测试方法有返回值 （2.1 判断返回值是否为空， 2.2 判断返回值是否符合预期）
    //3.测试方法异步 (等待时间)

// 一、如果一个测试类里面有很多UI方法，应该使用UI测试。思考1：如果一个视图控制器里面有很多方法既有UI方面的，又有Unit测试方面的，该如何处理，（考虑App的架构，MVVM） 思考2：为什么要推行TDD，TDD是怎么做的，如何使用TDD来进行开发？


- (void)testIwanttoTextByUnitDemo {
    self.vc = [ViewController new];
    [self.vc IwantToTextByUnitDemo];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
