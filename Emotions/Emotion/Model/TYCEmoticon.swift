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
    /// 表情所在的目录路径
    var directory: String?
    
    /// '图片'表情对于的图像
    var image: UIImage?{
        
        //判断表情类型
        if type {
            return nil
        }
        guard let path = Bundle.main.path(forResource: "HMEmoticon.bundle", ofType: nil),
        let bundle = Bundle(path: path),
            let image = UIImage(named: "lxh/lxh_toule.png", in: bundle, compatibleWith: nil) else {
                return nil
        }
        return UIImage(named: "\(directory)/\(png)", in: bundle, compatibleWith: nil)
    }
    
    override var description: String{
        return yy_modelDescription();
    }
    
    
    
}
