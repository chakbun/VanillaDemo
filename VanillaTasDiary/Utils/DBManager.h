//
//  DBManager.h
//  SampleBroadcaster
//
//  Created by kerry on 16/3/21.
//  Copyright © 2016年 videocore. All rights reserved.
//

#ifndef DBManager_h
#define DBManager_h

#import <Foundation/Foundation.h>

@interface DBManager : NSObject

+(DBManager *) getInstance;

@property (nonatomic, assign) NSString *configName;

//userDefaultes
-(void)saveObject:(NSString *)key obj:(NSObject *) value;
-(NSObject *)readObject:(NSString *)key;
-(void)saveInteger:(NSString *)key obj:(int) value;
-(NSInteger)readInteger:(NSString *)key;
-(void)saveFloat:(NSString *)key obj:(float) value;
-(float)readFloat:(NSString *)key;
-(void)saveDouble:(NSString *)key obj:(double) value;
-(double)readDouble:(NSString *)key;
-(void)saveString:(NSString *)key obj:(NSString *) value;
-(NSString *)readString:(NSString *)key;
-(void)saveDate:(NSString *)key obj:(NSDate *) value;
-(NSDate *)readDate:(NSString *)key;
-(void)saveArray:(NSString *)key obj:(NSArray *) value;
-(NSArray *)readArray:(NSString *)key;
-(void)saveDictionary:(NSString *)key obj:(NSDictionary *) value;
-(NSDictionary *)readDictionary:(NSString *)key;
-(void)clearUserDefaultes;
-(void)resetUserDefaultes;


//Directory
+(NSString*) getHomeDirectory;
+(NSString*) getTemporaryDirectory;
+(NSArray*) getDocumentDirectory;
+(NSString*) getDocumentDirectory:(int)index;
+(NSArray*) getCachesDirectory;
+(NSString*) getCachesDirectory:(int)index;
+(NSArray*) getLibraryDirectory;
+(NSString*) getLibraryDirectory:(int)index;
//plist
+(NSString*) getPathByPlist:(NSString *)name;
+(NSMutableDictionary*) getDictionaryByPlist:(NSString *)name;
+(NSObject *) getDictionaryByPlist:(NSString *)name key:(NSString *)keys;
+(void) saveDictionaryByPlist:(NSMutableDictionary *)data name:(NSString *)nameFile;
//默认plist配置
+(NSMutableDictionary*) getConfig;
+(NSObject *) getConfig:(NSString *)key;
//Archiver
+(NSMutableDictionary*) getArchiver:(NSString *)name;
+(void) saveArchiver:(NSString *)name data:(NSMutableDictionary *)params;
//keyChain
+(NSMutableDictionary *)getkeyChain:(NSString *)service;
+(void)savekeyChain:(NSString *)service data:(id)data;
+(id)loadkeyChain:(NSString *)service;
+(void)deletekeyChain:(NSString *)service;

//保存分类图片
+ (void) saveClassifyImage:(NSDictionary *) dict;

//获得分类缓存图片
+ (NSDictionary *) getClassifyImage;


/**
 *图片保存
 */
+ (UIImage *)saveImage:(NSData *)data file:(NSString*)name;


// 保存第一次安装
- (void) saveLoginList:(NSDictionary *) ids;

// 获取第一次安装
- (id) getLoginList;


//保存镜向
- (void) saveMirrorOn:(BOOL) isOn;

//获得镜向
- (id) getMirrorOn;

//保存摄像头方向
- (void) saveCamarDirection:(BOOL) isBack;

//获得摄像头方向
- (id) getCamarDirection;


//获取Documents目录
-(NSString *)dirDocuments;
//获取Library目录
-(NSString *)dirLibrary;
//获取Cache目录
-(NSString *)dirCache;
//创建文件夹
-(BOOL)createDir:(NSString*)name path:(NSString*)dir;
//创建文件
-(BOOL)createFile:(NSString*)name file:(NSString*)fileName path:(NSString*)dir;
//写文件
-(BOOL)writeFile:(NSString*)name file:(NSString*)fileName content:(NSString*)content path:(NSString*)dir;
//读文件
-(NSString*)readFile:(NSString*)name file:(NSString*)fileName path:(NSString*)dir;
//文件属性
-(NSDictionary *)fileAttriutes:(NSString*)name file:(NSString*)fileName path:(NSString*)dir;
//删除文件
-(BOOL)deleteFile:(NSString*)name file:(NSString*)fileName path:(NSString*)dir;


/**
 * 读取Float数据
 * @param key
 */
- (BOOL) readBool:(NSString *) key;


/**
 保存布尔值
 
 @param value value description
 @param key   key description
 */
- (void) saveBool:(BOOL) value forKey:(NSString *) key;




@end

#endif /* DBManager_h */
