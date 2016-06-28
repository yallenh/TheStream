//
//  RTArticleModel.m
//  TheStream
//
//  Created by Yan-Hsiang Huang on 6/28/16.
//  Copyright © 2016 Yahoo. All rights reserved.
//

#import "RTArticleModel.h"
#import "RTCategoryModel.h"

@implementation RTArticleModel

+ (NSDictionary *)linkingObjectsProperties {
    return @{@"categories": [RLMPropertyDescriptor descriptorWithClass:RTCategoryModel.class propertyName:@"articles"]};
}

+ (NSString *)primaryKey
{
    return @"title";
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
