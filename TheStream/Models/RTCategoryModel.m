//
//  RTCategoryModel.m
//  TheStream
//
//  Created by Yan-Hsiang Huang on 6/28/16.
//  Copyright © 2016 Yahoo. All rights reserved.
//

#import "RTCategoryModel.h"

@implementation RTCategoryModel

+ (NSString *)primaryKey
{
    return @"name";
}

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
