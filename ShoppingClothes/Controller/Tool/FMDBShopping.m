//
//  FMDBShopping.m
//  ShoppingClothes
//
//  Created by student on 16/6/15.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "FMDBShopping.h"
#import "FMDB.h"

static FMDatabase *db=nil;

@implementation FMDBShopping


+ (void)createDatabase{
    if (db==nil) {
        db = [[FMDatabase alloc]initWithPath:[self getPathFrom]];
        [db open];
        NSString *createSQL = @"create table if not exists oneSection(id integer primary key autoincrement,urlStr text)";
        [db executeUpdate:createSQL];
        [db close];
    }
    NSLog(@"%@",[self getPathFrom]);
}

+ (NSString *)getPathFrom{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/oneSection.sqlite"];
    return path;
}

+ (void)insertIntoDataByID:(NSArray *)urlArr{
    if (urlArr.count==0) {
        return;
    }
    [db open];
    for (NSInteger i=0; i<urlArr.count; i++) {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into oneSection(urlStr)values('%@')",urlArr[i]];
        [db executeUpdate:insertSQL];
    }
    [db close];
}

+ (void)deleteTopScrollView{
    [db open];
    NSString *deleteSQL = @"delete from oneSection";
    [db executeUpdate:deleteSQL];
    [db close];
}

+(NSMutableArray *)selectDatabase{
    NSMutableArray *arr = [NSMutableArray array];
    [db open];
    NSString *selectSQL = @"select * from oneSection";
    FMResultSet *set = [db executeQuery:selectSQL];
    while ([set next]) {
        NSString *str = [set stringForColumn:@"urlStr"];
        [arr addObject:str];
    }
    [set close];
    [db close];
    return arr;
}

+(void)createOneBottomSectionDatabase{
    if (db==nil) {
        db = [[FMDatabase alloc]initWithPath:[self getPathFrom]];
    }
    [db open];
    NSString *createSQL = @"create table if not exists oneBottom(id integer primary key autoincrement,imageURL text)";
    [db executeUpdate:createSQL];
    [db close];
}

+ (void)insertIntoOneBottomByID:(NSArray *)urlArr{
    if (urlArr.count==0) {
        return;
    }
    [db open];
    for (NSInteger i=0; i<urlArr.count; i++) {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into oneBottom(imageURL)values('%@')",urlArr[i]];
        [db executeUpdate:insertSQL];
    }
    [db close];
}

+ (void)deleteOneBottomSection{
    [db open];
    NSString *deleteSQL = @"delete from oneBottom";
    [db executeUpdate:deleteSQL];
    [db close];
}

+ (NSMutableArray *)selectOneBottomDatabase{
    [db open];
    NSMutableArray *arr = [NSMutableArray array];
    NSString *selectSQL = [NSString stringWithFormat:@"select * from oneBottom"];
    FMResultSet *set = [db executeQuery:selectSQL];
    while ([set next]) {
        NSString *str = [set stringForColumn:@"imageURL"];
        [arr addObject:str];
    }
    return arr;
}

+ (void)createSexOneSectionDatabase{
    db = [[FMDatabase alloc]initWithPath:[self getPathFrom]];
    [db open];
    NSString *createSQL = @"create table if not exists sexOneSection(id integer primary key autoincrement,oneUrl text,indexID integer)";
    [db executeUpdate:createSQL];
    [db close];
}

+ (void)insertIntoSexOneSectionByURLStr:(NSArray *)urlArr WithIndex:(NSInteger)indexID{
    if (urlArr.count==0) {
        return;
    }
    [db open];
    for (NSInteger i=0; i<urlArr.count; i++) {
    NSString *insertSQL = [NSString stringWithFormat:@"insert into sexOneSection(oneUrl,indexID) values ('%@',%ld)",urlArr[i],indexID];
    [db executeUpdate:insertSQL];
    }
    [db close];
}

+ (void)deleteSexOneSection{
    [db open];
    NSString *delegeSQL = @"delete from sexOneSection";
    [db executeUpdate:delegeSQL];
    [db close];
}

+ (NSMutableArray *)selectSexOneSectionDatabase:(NSInteger)indexID{
    [db open];
    NSMutableArray *arr = [NSMutableArray array];
    NSString *select = [NSString stringWithFormat:@"select * from sexOneSection where indexID = %ld",indexID];
    FMResultSet *set = [db executeQuery:select];
    while ([set next]) {
        NSString *str = [set stringForColumn:@"oneUrl"];
        [arr addObject:str];
    }
    [set close];
    [db close];
    return arr;
}

+ (void)createSextwoSectionDatabase{
    db = [FMDatabase databaseWithPath:[self getPathFrom]];
    [db open];
    NSString *createSQL = @"create table if not exists sexTwoSection(id integer primary key autoincrement,twoUrl text,indexID integer)";
    [db executeUpdate:createSQL];
    [db close];
}

+ (void)insertIntoSexTwoSectionByURLStr:(NSArray *)urlArr WithIndex:(NSInteger)indexID{
    if (urlArr.count==0) {
        return;
    }
    [db open];
    for (NSInteger i=0; i<urlArr.count; i++) {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into sexTwoSection(twoUrl,indexID) values ('%@',%ld)",urlArr[i],indexID];
    [db executeUpdate:insertSQL];
    }
    [db close];
}

+ (void)deleteSexTwoSection{
    [db open];
    NSString *delegeSQL = @"delete from sexTwoSection";
    [db executeUpdate:delegeSQL];
    [db close];
}


+ (NSMutableArray *)selectSexTwoSectionData:(NSInteger)indexID{
    [db open];
    NSMutableArray *arr = [NSMutableArray array];
   NSString *select = [NSString stringWithFormat:@"select * from sexTwoSection where indexID = %ld",indexID];
    FMResultSet *set = [db executeQuery:select];
    while ([set next]) {
        NSString *str = [set stringForColumn:@"twoUrl"];
        [arr addObject:str];
    }
    [set close];
    [db close];
    return arr;
}



+ (void)createSexThirdSectionDatabase{
    db = [[FMDatabase alloc]initWithPath:[self getPathFrom]];
    [db open];
    NSString *createSQL = @"create table if not exists sexThirdSection(id integer primary key autoincrement,thirdUrl text,indexID integer)";
    [db executeUpdate:createSQL];
    [db close];
}

+ (void)insertIntoSexThirdSectionByURLStr:(NSArray *)urlArr WithIndex:(NSInteger)indexID{
    if (urlArr.count==0) {
        return;
    }
    [db open];
    for (NSInteger i=0; i<urlArr.count; i++) {
     NSString *insertSQL = [NSString stringWithFormat:@"insert into sexThirdSection(thirdUrl,indexID) values ('%@',%ld)",urlArr[i],indexID];
    [db executeUpdate:insertSQL];
    }
    [db close];
}

+ (void)deleteSexThirdSection{
    [db open];
    NSString *delegeSQL = @"delete from sexThirdSection";
    [db executeUpdate:delegeSQL];
    [db close];
}

+ (NSMutableArray *)selectSexThirdSectionData:(NSInteger)indexID{
    [db open];
    NSMutableArray *arr = [NSMutableArray array];
    NSString *select = [NSString stringWithFormat:@"select * from sexThirdSection where indexID = %ld",indexID];
    FMResultSet *set = [db executeQuery:select];
    while ([set next]) {
        NSString *str = [set stringForColumn:@"thirdUrl"];
        [arr addObject:str];
    }
    [set close];
    [db close];
    return arr;
}





+ (void)createSexFourSectionDatabase{
    db = [[FMDatabase alloc]initWithPath:[self getPathFrom]];
    [db open];
    NSString *createSQL = @"create table if not exists sexFourSection(id integer primary key autoincrement,fourUrl text,fourTitle text,fourOldPrice text,fourNewPrice text,indexID integer)";
    [db executeUpdate:createSQL];
    [db close];
}

+ (void)insertIntoSexFourSectionByURLStr:(NSArray *)urlArr WithIndex:(NSInteger)indexID{
    [db open];
    for (NSInteger i=0; i<urlArr.count; i++) {
        CommodityModel *model = urlArr[i];
        NSString *insertSQL = [NSString stringWithFormat:@"insert into sexFourSection(fourUrl,fourTitle,fourOldPrice,fourNewPrice,indexID)values('%@','%@','%@','%@',%ld)",model.picUrl,model.title,model.price,model.origin_price,indexID];
    [db executeUpdate:insertSQL];
    }
    [db close];
}

+ (void)deleteSexFourSection{
    [db open];
    NSString *delegeSQL = @"delete from sexFourSection";
    [db executeUpdate:delegeSQL];
    [db close];
}


+ (NSMutableArray *)selectSexFourSectionData:(NSInteger)indexID{
    [db open];
    NSMutableArray *arr = [NSMutableArray array];
    NSString *select = [NSString stringWithFormat:@"select * from sexFourSection where indexID = %ld",indexID];
    FMResultSet *set = [db executeQuery:select];
    while ([set next]) {
        CommodityModel *model = [CommodityModel new];
        model.picUrl = [set stringForColumn:@"fourUrl"];
        model.title = [set stringForColumn:@"fourTitle"];
        model.price = [set stringForColumn:@"fourOldPrice"];
        model.origin_price = [set stringForColumn:@"fourNewPrice"];
        [arr addObject:model];
    }
    [set close];
    [db close];
    return arr;
}


+ (void)createCollectionViewTable{
    if (db == nil) {
        db = [FMDatabase databaseWithPath:[self getPathFrom]];
    }
    [db open];
    NSString *createSQL = @"create table if not exists collectionView(id integer primary key autoincrement,picUrl text,countryUrl text,title text,price text,origPrice text,nationalFlag text,indexID integer)";
    [db executeUpdate:createSQL];
    [db close];
}

+ (void)insertIntoCollectionViewWithArray:(NSArray *)array  WithIndex:(NSInteger)index{
    [db open];
    for (NSInteger i=0; i<array.count; i++) {
        CommodityModel *model = array[i];
        NSString *insertSQL = [NSString stringWithFormat:@"insert into collectionView(picUrl,countryUrl,title,price,origPrice,nationalFlag,indexID) values ('%@','%@','%@','%@','%@','%@',%ld)",model.picUrl,model.country,model.title,model.price,model.origin_price,model.nationalFlag,index];
        [db executeUpdate:insertSQL];
    }
    [db close];
}

+ (void)deleteCollectionView{
    [db open];
    NSString *delete = @"delete from collectionView";
    [db executeUpdate:delete];
    [db close];
    
}

+ (NSMutableArray *)selectCollectionViewByIndex:(NSInteger)index{
    [db open];
    NSMutableArray *arr = [NSMutableArray array];
    NSString *selectSQL = [NSString stringWithFormat:@"select * from collectionView where indexID = %ld",index];
    FMResultSet *set = [db executeQuery:selectSQL];
    while ([set next]) {
        CommodityModel *model = [CommodityModel new];
        model.picUrl = [set stringForColumn:@"picUrl"];
        model.country = [set stringForColumn:@"countryUrl"];
        model.nationalFlag = [set stringForColumn:@"nationalFlag"];
        model.title = [set stringForColumn:@"title"];
        model.price = [set stringForColumn:@"price"];
        model.origin_price = [set stringForColumn:@"origPrice"];
        [arr addObject:model];
    }
    return arr;
}


- (void)createTable:(NSString *)table WithPar:(NSDictionary*)par{
    //1.首先判断 表名 和 par 是否为空 为空就返回
    //2.如果表存在返回
    //3.根据 par 中keys 创建表
    //4.创建成功之后返回
    
}

- (void)insertDtata:(NSDictionary *)data withTable:(NSString *)table{
    //1.首先判断 table和data 是否为空
    //2.解析 data
    //3.先判断table里面有没有相同的数据 如果没有继续
    //如果有 就调用 update
    //4.是需要对词表进行 Key关联就能实现 表关联
    //
}



@end

//delete from  sexOneSection;
