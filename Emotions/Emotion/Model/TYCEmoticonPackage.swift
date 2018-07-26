//
//  TYCEmoticonPackage.swift
//  Emotions
//
//  Created by tangyunchuan on 2018/7/26.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

import UIKit

/// 表情包模型
class TYCEmoticonPackage: NSObject {

    /// 表情包的分组名
    var groupName: String?
    /// 表情目录，从目录下加载 info.plist 可以创建表情模型数组
    var directory: String?
    
    /// 懒加载的表情模型数组
    ///使用懒加载可以避免后续的解包
    lazy var emotions = [TYCEmoticon]()
    override var description: String{
        return yy_modelDescription();
    }
}
