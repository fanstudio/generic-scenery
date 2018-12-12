//
//  Common.h
//  tuguan
//
//  Created by 张帆 on 2018/12/11.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#ifndef Common_h
#define Common_h

#ifdef __OBJC__ /* objc环境 */

#import "Color.h"
#import "Size.h"
/*****************日志宏**********************/
#ifdef DEBUG

#define LOG(...) NSLog(__VA_ARGS__);
#define Trace NSLog(@"enter %s", __func__)
#define DebugNSData LOG(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding])

#else

#define LOG(...)
#define Trace
#define DebugNSData

#endif

/***********************内存管理***************************/
#define WEAK_REF(obj_ref, obj) __weak typeof(obj) obj_ref = obj

#endif /* end of __OBJC__ */

#endif /* Common_h */
