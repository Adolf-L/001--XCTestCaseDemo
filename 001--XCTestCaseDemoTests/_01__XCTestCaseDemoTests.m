//
//  _01__XCTestCaseDemoTests.m
//  001--XCTestCaseDemoTests
//
//  Created by Rnthking on 2018/1/18.
//  Copyright © 2018年 Adolf. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface _01__XCTestCaseDemoTests : XCTestCase

@end

@implementation _01__XCTestCaseDemoTests

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
    NSLog(@"hello world");
    NSLog(@"good morning");
}


- (void)testAnotherExample {
    NSLog(@"ahahaahh");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
