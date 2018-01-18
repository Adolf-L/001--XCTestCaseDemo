//
//  Person.h
//  001--XCTestCaseDemoTests
//
//  Created by Rnthking on 2018/1/18.
//  Copyright © 2018年 Adolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PersonDelegate <NSObject>

- (NSString *)becomeSuperMan;


@end


@interface Person : NSObject

@property (nonatomic, weak) id<PersonDelegate> delegate;


- (void)tellOthersName;

- (UIImageView *)getMyPhotoView;

- (void)doSomeTasksAsynchronous:(void(^)(NSString *doneInfo)) doneBlock;


@end
