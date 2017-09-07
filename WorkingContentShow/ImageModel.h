//
//  ImageModel.h
//  WorkingContentShow
//
//  Created by Jacob_Liang on 2017/9/7.
//  Copyright © 2017年 Jacob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject

@property (nonatomic, copy, readonly) NSString *url;
@property (nonatomic, copy, readonly) NSString *sectionName;

//- (instancetype)init NS_UNAVAILABLE;
//
//- (instancetype)initWithImageUrl:(NSString *)url belongSectionName:(NSString *)sectionName NS_DESIGNATED_INITIALIZER;

@end
