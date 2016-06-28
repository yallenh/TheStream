//
//  ViewController.m
//  TheStream
//
//  Created by Yan-Hsiang Huang on 6/27/16.
//  Copyright © 2016 Yahoo. All rights reserved.
//

#import "ViewController.h"

// utils
#import <Realm/Realm.h>

// models
#import "RTArticleModel.h"
#import "RTCategoryModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self setUpDataBase];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpDataBase
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteAllObjects];
    [realm commitWriteTransaction];

    [realm transactionWithBlock:^{
        [RTArticleModel createInRealm:realm withValue:@[@"This article contains both finance and political content."]];
        [RTArticleModel createInRealm:realm withValue:@[@"This article contains only finance content"]];

        RTCategoryModel *financeCategory = [[RTCategoryModel alloc] init];
        financeCategory.name = @"finance";
        [financeCategory.articles addObjects:[RTArticleModel objectsWhere:@"title contains 'finance'"]];

        RTCategoryModel *politicalCategory = [[RTCategoryModel alloc] init];
        politicalCategory.name = @"political";
        [politicalCategory.articles addObjects:[RTArticleModel objectsWhere:@"title contains 'political'"]];

        [RTCategoryModel createInRealm:realm withValue:financeCategory];
        [RTCategoryModel createInRealm:realm withValue:politicalCategory];
    }];

    // Log all articles and its categories using the "categories" inverse relationship
    RLMResults *allArticles = [RTArticleModel allObjects];
    for (RTArticleModel *article in allArticles) {
        NSArray *categoriesName = [article.categories valueForKeyPath:@"name"];
        NSLog(@"\n [Article] %@\n [Categories] %@\n", article.title, categoriesName);
    }
}

@end
