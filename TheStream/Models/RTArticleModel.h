//
//  RTArticleModel.h
//  TheStream
//
//  Created by Yan-Hsiang Huang on 6/28/16.
//  Copyright © 2016 Yahoo. All rights reserved.
//

#import <Realm/Realm.h>

@interface RTArticleModel : RLMObject
@property NSString *title;
@property (readonly) RLMLinkingObjects *categories;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<RTArticleModel>
RLM_ARRAY_TYPE(RTArticleModel)
