//
//  RTCategoryModel.h
//  TheStream
//
//  Created by Yan-Hsiang Huang on 6/28/16.
//  Copyright © 2016 Yahoo. All rights reserved.
//

#import <Realm/Realm.h>
#import "RTArticleModel.h"

@class RTArticleModel;

@interface RTCategoryModel : RLMObject
@property NSString *name;
@property RLMArray<RTArticleModel *><RTArticleModel> *articles;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<RTCategoryModel>
RLM_ARRAY_TYPE(RTCategoryModel)
