//
//  TYCEmoticon.swift
//  Emotions
//
//  Created by tangyunchuan on 2018/7/26.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

import UIKit
import YYModel
/// 表情模型
class TYCEmoticon: NSObject {

    /// 表情类型 false - 图片表情 / true
    var type = false
    /// 表情字符串，发送给新浪微博的服务器
    var chs: String?
    /// 表情图片名称，用于本地图文混排
    var png: String?
    /// emoji 的十六进制编码
    var code: String?
    override var description: String{
        return yy_modelDescription();
    }
    
    
    
}
