//
//  _01__XCTestCaseDemoUITests.m
//  001--XCTestCaseDemoUITests
//
//  Created by Rnthking on 2018/1/18.
//  Copyright © 2018年 Adolf. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface _01__XCTestCaseDemoUITests : XCTestCase

@end

@implementation _01__XCTestCaseDemoUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


//中文是有转码有问题
//@"\U8d26\U53f7\Uff1a"
//@"\U767b\U9646"
//如何进行转码？

- (void)testLoginProcess {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *accountElementsQuery = [app.otherElements containingType:XCUIElementTypeStaticText identifier:@"Account:"];
    XCUIElement *textField = [[accountElementsQuery childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0];
    [textField tap];
    [textField typeText:@"8888888"];
    
    XCUIElement *textField2 = [[accountElementsQuery childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1];
    [textField2 tap];
    [textField2 tap];
    [textField2 typeText:@"88888888"];
    [app.buttons[@"Login"] tap];
    
}



- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
