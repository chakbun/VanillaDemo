//
//  DBManager.m
//  SampleBroadcaster
//  Created by kerry on 16/3/21.
//  Copyright © 2016年 videocore. All rights reserved.
//  ios开发之数据存储
//  ios存储机制分类
//  1.XML属性列表（Property List 常简称为PList）
//  2.偏好设置---偏好设置和plist一般只适用于系统自带的数据类型，用来存储应用的设置信息
//  3.沙盒文件---每个ios应用都有自己的应用沙盒，应用沙盒就是文件系统目录
//  4.对象归档---归档解决了存储类型的问题，支持存储自定义对象。
//  5.CoreData----对象型数据库
//  6.KeyChain----提供一种安全的保存私密信息（密码、序列号、证书等）的方式
//  7.SQLite
//

#import "DBManager.h"

@interface DBManager()
{
    NSUserDefaults *userDefaultes;
}

@end

@implementation DBManager

static DBManager * ins;

+(DBManager *)getInstance
{
    @synchronized(self) {
        if(!ins)
        {
            ins = [[DBManager alloc] init];
            return ins;
        }
    }
    return ins;
}
+(id)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if(!ins)
        {
            ins = [super allocWithZone:zone];
            return ins;
        }
    }
    return nil;
}
-(id)copyWithZone:(NSZone *)zone
{
    return self;
}
-(id) init
{
    if (self = [super init]){
        //在此处进行初始化设置
        userDefaultes = [NSUserDefaults standardUserDefaults];
    }
    return self;
}
/**
 * 保存对象数据
 * @ key
 * @param value 数据
 */
-(void)saveObject:(NSString *)key obj:(NSObject *) value
{
    [userDefaultes setObject:value forKey:key];
    [userDefaultes synchronize];
}
/**
 * 读取对象数据
 * @ key
 */
-(NSObject *)readObject:(NSString *)key
{
    return [userDefaultes objectForKey:key];
}

/**
 * 保存INT数据
 * @ key
 * @param value 数据
 */
-(void)saveInteger:(NSString *)key obj:(int) value
{
    [userDefaultes setInteger:value forKey:key];
}
/**
 * 读取INT数据
 * @ key
 */
-(NSInteger)readInteger:(NSString *)key
{
    return [userDefaultes integerForKey:key];
}

/**
 * 保存Float数据
 * @ key
 * @param value 数据
 */
-(void)saveFloat:(NSString *)key obj:(float) value
{
    [userDefaultes setFloat:value forKey:key];
    [userDefaultes synchronize];
}
/**
 * 读取Float数据
 * @ key
 */
-(float)readFloat:(NSString *)key
{
    return [userDefaultes floatForKey:key];
}


- (void) saveBool:(BOOL) value forKey:(NSString *) key{
    [userDefaultes setBool:value forKey:key];
    [userDefaultes synchronize];
}


- (BOOL) readBool:(NSString *) key{
    return [userDefaultes boolForKey:key];
}


/**
 * 保存double数据
 * @ key
 * @param value 数据
 */
-(void)saveDouble:(NSString *)key obj:(double) value
{
    [userDefaultes setDouble:value forKey:key];
    [userDefaultes synchronize];
}
/**
 * 读取double数据
 * @ key
 */
-(double)readDouble:(NSString *)key
{
    return [userDefaultes doubleForKey:key];
}
/**
 * 保存String数据
 * @ key
 * @param value 数据
 */
-(void)saveString:(NSString *)key obj:(NSString *) value
{
    [userDefaultes setObject:value forKey:key];
    [userDefaultes synchronize];
}
/**
 * 读取String数据
 * @ key
 */
-(NSString *)readString:(NSString *)key
{
    return [userDefaultes stringForKey:key];
    
}
/**
 * 保存Date数据
 * @ key
 * @param value 数据
 */
-(void)saveDate:(NSString *)key obj:(NSDate *) value
{
    [userDefaultes setObject:value forKey:key];
    [userDefaultes synchronize];
}
/**
 * 读取Date数据
 * @ key
 */
-(NSDate *)readDate:(NSString *)key
{
    return [userDefaultes valueForKey:key];
}
/**
 * 保存Array数据
 * @ key
 * @param value 数据
 */
-(void)saveArray:(NSString *)key obj:(NSArray *) value
{
    [userDefaultes setObject:value forKey:key];
    [userDefaultes synchronize];
}
/**
 * 读取Array数据
 * @ key
 */
-(NSArray *)readArray:(NSString *)key
{
    return [userDefaultes arrayForKey:key];
}
/**
 * 保存Dictionary数据
 * @ key
 * @param value 数据
 */
-(void)saveDictionary:(NSString *)key obj:(NSDictionary *) value
{
    [userDefaultes setObject:value forKey:key];
    [userDefaultes synchronize];
}
/**
 * 读取Dictionary数据
 * @ key
 */
-(NSDictionary *)readDictionary:(NSString *)key
{
    return [userDefaultes dictionaryForKey:key];
}
-(void)clearUserDefaultes
{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}
- (void)resetUserDefaultes
{
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict)
    {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
}
/**
 * 获取Home目录路径
 */
+(NSString*) getHomeDirectory
{
    return NSHomeDirectory();
}
/**
 * 获取tmp目录路径
 */
+(NSString*) getTemporaryDirectory
{
    return NSTemporaryDirectory();
}
/**
 * 获取Document目录路径
 */
+(NSArray*) getDocumentDirectory
{
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
}
/**
 * 获取Document目录路径
 * @ index
 */
+(NSString*) getDocumentDirectory:(int)index
{
    return [[self getDocumentDirectory] objectAtIndex:index];
}
/**
 * 获取Cache目录路径
 */
+(NSArray*) getCachesDirectory
{
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
}
/**
 * 获取Cache目录路径
 * @ index
 */
+(NSString*) getCachesDirectory:(int)index
{
   return [[self getCachesDirectory] objectAtIndex:index];
    
}
/**
 * 获取Libaray目录路径
 */
+(NSArray*) getLibraryDirectory
{
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
}
/**
 * 获取Libaray目录路径
 * @ index
 */
+(NSString*) getLibraryDirectory:(int)index
{
    return [[self getLibraryDirectory] objectAtIndex:index];
}
/**
 * 获取plist路径
 * @param name 文件名称
 */
+(NSString*) getPathByPlist:(NSString *)name
{
    return [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
}
/**
 * 获取plist数据
 * @ name 文件名称
 */
+(NSMutableDictionary*) getDictionaryByPlist:(NSString *)name
{
    return  [[NSMutableDictionary alloc] initWithContentsOfFile:[self getPathByPlist:name]];
}
/**
 * 获取plist数据
 * @ key
 */
+(NSObject *) getDictionaryByPlist:(NSString *)name key:(NSString *)keys
{
    return [[self getDictionaryByPlist:name] objectForKey:keys];
}

/**
 * 保存plist数据
 * @ name 文件名称
 */
+(void) saveDictionaryByPlist:(NSMutableDictionary *)data name:(NSString *)nameFile
{
    //获取应用程序沙盒的Documents目录
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath = [paths objectAtIndex:0];
    
    //得到完整的文件名
    NSString *filename=[plistPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",nameFile]];
    //输入写入
    [data writeToFile:filename atomically:YES];
}
/**
 * 获取Config数据
 */
+(NSMutableDictionary*) getConfig
{
    return [self getDictionaryByPlist:[[self getInstance]configName]];
}
/**
 * 获取Config数据
 * @ key
 */
+(NSObject *) getConfig:(NSString *)key
{
    return [[self getConfig] objectForKey:key];
}

/**
 * 获取对象归档
 * @param name creatTableFile 目录文件下
 */
+(NSMutableDictionary*) getArchiver:(NSString *)name
{
    NSData *data = [[NSMutableData alloc] initWithContentsOfFile:name];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSMutableDictionary *dictionaryTest = [unarchiver decodeObjectForKey:@"TABLES"];
    [unarchiver finishDecoding];
    return dictionaryTest;
}
/**
 * 获取对象归档
 * @param name creatTableFile 目录文件下
 */
+(void) saveArchiver:(NSString *)name data:(NSMutableDictionary *)params
{
    NSMutableData *dataTest = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:dataTest];
    [archiver encodeObject:params forKey:@"TABLES"];//params为可变字典
    [archiver finishEncoding];
    [dataTest writeToFile:name atomically:YES];//写入creatTableFile 目录文件下
}

/**
 * 获取keyChain服务
 * @ service
 */
+(NSMutableDictionary *)getkeyChain:(NSString *)service
{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
            nil];
}
/**
 * 保存keyChain服务
 * @ service
 * @ data
 */
+(void)savekeyChain:(NSString *)service data:(id)data
{
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getkeyChain:service];
    //Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}
/**
 * 加载keyChain服务
 * @ service
 */
+(id)loadkeyChain:(NSString *)service
{
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getkeyChain:service];
    //Configure the search setting
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(NSData *)CFBridgingRelease(keyData)];
        } @catch (NSException *e) {
            DYLogInfo(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}
/**
 * 删除keyChain服务
 * @ service
 */
+(void)deletekeyChain:(NSString *)service
{
    NSMutableDictionary *keychainQuery = [self getkeyChain:service];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}

//保存分类图片
+ (void) saveClassifyImage:(NSDictionary *) dict{
    [[NSUserDefaults standardUserDefaults] setValue:dict forKey:@"classifyImage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
//    ClassifyTypeNew=-2,//最新
//    ClassifyTypeCare,//关注
//    ClassifyTypeHot,//热门
//    ClassifyTypeEat,//吃货
//    ClassifyTypeSingle,//单身狗
//    ClassifyTypeCreative,//创意
    
}

//获得分类缓存图片
+ (NSMutableDictionary *) getClassifyImage{
   NSDictionary *dict= [[NSUserDefaults standardUserDefaults] valueForKey:@"classifyImage"];
    
    NSMutableDictionary *mutDict=[NSMutableDictionary dictionaryWithDictionary:dict];
    
    return mutDict;
}

/**
 *图片保存
 */
+ (UIImage *)saveImage:(NSData *)data file:(NSString*)name
{
    //图片保存的路径
    //这里将图片放在沙盒的documents文件夹中
    NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    //文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
    [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
    //得到选择后沙盒中图片的完整路径
    NSString* filePath;
    if(name==nil)
    {
        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.jpg"] contents:data attributes:nil];
        filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.jpg"];
    }else{
        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:name] contents:data attributes:nil];
        filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  name];
    }
    return [[UIImage alloc]initWithContentsOfFile:filePath];
}

// 保存第一次登录
- (void) saveLoginList:(NSDictionary *) ids{
      [[NSUserDefaults standardUserDefaults] setValue:ids forKey:@"LoginedList"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

// 获取第一次登录
- (id) getLoginList{
    
  return [[NSUserDefaults standardUserDefaults] valueForKey:@"LoginedList"];
    
}




//保存镜向
- (void) saveMirrorOn:(BOOL) isOn{
    [[NSUserDefaults standardUserDefaults] setValue:@(isOn) forKey:@"mirrorOn"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


//获得镜向
- (id) getMirrorOn{
    
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"mirrorOn"];
}


//保存摄像头方向
- (void) saveCamarDirection:(BOOL) isBack{
    [[NSUserDefaults standardUserDefaults] setValue:@(isBack) forKey:@"camarDirection"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//获得摄像头方向
- (id) getCamarDirection{
    
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"camarDirection"];
}

//获取Documents目录
-(NSString *)dirDocuments{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    DYLogInfo(@"app_home_doc: %@",documentsDirectory);
    return documentsDirectory;
}
//获取Library目录
-(NSString *)dirLibrary{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    DYLogInfo(@"app_home_lib: %@",libraryDirectory);
    return libraryDirectory;
}
//获取Cache目录
-(NSString *)dirCache{
    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cacPath objectAtIndex:0];
    DYLogInfo(@"app_home_lib_cache: %@",cachePath);
    return cachePath;
}
//创建文件夹
-(BOOL)createDir:(NSString*)name path:(NSString*)dir{
    NSString *documentsPath = dir;
    if(dir==nil)
    {
        documentsPath =[self dirDocuments];
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:name];
    // 创建目录
    BOOL res=[fileManager createDirectoryAtPath:testDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    return res;
}
//创建文件
-(BOOL)createFile:(NSString*)name file:(NSString*)fileName path:(NSString*)dir{
    NSString *documentsPath = dir;
    if(dir==nil)
    {
        documentsPath =[self dirDocuments];
    }
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:name];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:fileName];
    BOOL res=[fileManager createFileAtPath:testPath contents:nil attributes:nil];
    return res;
}
//写文件
-(BOOL)writeFile:(NSString*)name file:(NSString*)fileName content:(NSString*)content path:(NSString*)dir{
    NSString *documentsPath = dir;
    if(dir==nil)
    {
        documentsPath =[self dirDocuments];
    }
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:name];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:fileName];
    BOOL res=[content writeToFile:testPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    return res;
}
//读文件
-(NSString*)readFile:(NSString*)name file:(NSString*)fileName path:(NSString*)dir{
    NSString *documentsPath = dir;
    if(dir==nil)
    {
        documentsPath =[self dirDocuments];
    }
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:name];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:fileName];
    //    NSData *data = [NSData dataWithContentsOfFile:testPath];
    //    DYLogInfo(@"文件读取成功: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    NSString *content=[NSString stringWithContentsOfFile:testPath encoding:NSUTF8StringEncoding error:nil];
    return content;
}
//文件属性
-(NSDictionary *)fileAttriutes:(NSString*)name file:(NSString*)fileName path:(NSString*)dir{
    NSString *documentsPath = dir;
    if(dir==nil)
    {
        documentsPath =[self dirDocuments];
    }
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:name];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:fileName];
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:testPath error:nil];
//    NSArray *keys;
//    id key, value;
//    keys = [fileAttributes allKeys];
//    int count = [keys count];
//    for (int i = 0; i < count; i++)
//    {
//        key = [keys objectAtIndex: i];
//        value = [fileAttributes objectForKey: key];
//        DYLogInfo (@"Key: %@ for value: %@", key, value);
//    }
    return fileAttributes;
}
//删除文件
-(BOOL)deleteFile:(NSString*)name file:(NSString*)fileName path:(NSString*)dir{
    NSString *documentsPath = dir;
    if(dir==nil)
    {
        documentsPath =[self dirDocuments];
    }
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:name];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:fileName];
    BOOL res=[fileManager removeItemAtPath:testPath error:nil];
    return res;
}






@end
