//
//  FMDBShopping.h
//  ShoppingClothes
//
//  Created by student on 16/6/15.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommodityModel.h"

@interface FMDBShopping : NSObject
//创建数据库
+ (void)createDatabase;

+ (void)insertIntoDataByID:(NSArray *)urlArr;

+ (void)deleteTopScrollView;

+(NSMutableArray *)selectDatabase;

+(void)createOneBottomSectionDatabase;

+ (void)insertIntoOneBottomByID:(NSArray *)urlArr;

+ (void)deleteOneBottomSection;

+ (NSMutableArray *)selectOneBottomDatabase;

+ (void)createSexOneSectionDatabase;

+ (void)insertIntoSexOneSectionByURLStr:(NSArray *)urlArr WithIndex:(NSInteger)indexID;

+ (void)deleteSexOneSection;

+ (NSMutableArray *)selectSexOneSectionDatabase:(NSInteger)indexID;

+ (void)createSextwoSectionDatabase;

+ (void)insertIntoSexTwoSectionByURLStr:(NSArray *)urlArr WithIndex:(NSInteger)indexID;

+ (void)deleteSexTwoSection;

+ (NSMutableArray *)selectSexTwoSectionData:(NSInteger)indexID;

+ (void)createSexThirdSectionDatabase;

+ (void)insertIntoSexThirdSectionByURLStr:(NSArray *)urlArr WithIndex:(NSInteger)indexID;

+ (void)deleteSexThirdSection;

+ (NSMutableArray *)selectSexThirdSectionData:(NSInteger)indexID;


+ (void)createSexFourSectionDatabase;

+ (void)insertIntoSexFourSectionByURLStr:(NSArray *)urlArr WithIndex:(NSInteger)indexID;

+ (void)deleteSexFourSection;

+ (NSMutableArray *)selectSexFourSectionData:(NSInteger)indexID;

+ (void)createCollectionViewTable;

+ (void)insertIntoCollectionViewWithArray:(NSArray *)array  WithIndex:(NSInteger)index;

+ (void)deleteCollectionView;

+ (NSMutableArray *)selectCollectionViewByIndex:(NSInteger)index;


//创建表
//
//- (void)createTable:(NSString *)table WithPar:(NSDictionary*)par;
//插入数据  分一条和N条
//- (void)insertDtata:(NSDictionary *)data withTable:(NSString *)table;




@end
