//
//  Color.h
//  tuguan
//
//  Created by 张帆 on 2018/12/11.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#ifndef Color_h
#define Color_h

#ifdef __OBJC__ /* objc环境 */

/******************颜色宏*******************/
#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0] // RGB颜色
#define ARGB(a, r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a / 255.0] // RGB颜色
#define RandomColor Color(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256)) // 随机色
#define BASE_COLOR Color(0, 150, 136)           // 基准色
#define LIGHT_GREEN_COLOR Color(134, 212, 204)   // 浅绿色
#define VIEW_BASE_COLOR Color(246, 246, 246)     // view默认底色
#define VIEW_BLANCK_COLOR Color(239, 239, 239)   // view空白颜色
#define SEPARATOR_COLOR Color(235, 235, 235)     // 分割线的颜色

#define BASE_COLOR_DISABLE Color(200, 200, 200)  // 基准色-灰色
#define BASE_COLOR_BAR_BG ARGB(125, 246, 246, 246)  // 工具条背景色
#define BASE_COLOR_BLACK Color(50, 50, 50)           // 基准色-黑色
#define BASE_COLOR_GRAY Color(150, 150, 150)         // 基准色-灰色文字
#define BORDER_COLOR_GRAY Color(226, 226, 226)       // 适用于控件边框的灰色
#define CELL_COLOR_HIGHLIGHT Color (208, 208, 208)   // CELL高亮颜色
#define COVER_COLOR ARGB(88, 0, 0, 0)               // 遮盖的颜色
#define ORAGE_RED_COLOR Color (184, 40, 4)         // 橙红色
#define BASE_COLOR_ORAGE ORAGE_RED_COLOR     // 基准色-橙色


#endif


#endif /* Color_h */
