//
//  TYCEmoticonManager.swift
//  Emotions
//
//  Created by tangyunchuan on 2018/7/25.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

import Foundation

class TYCEmoticonManager {
    //为了便于表情的复用，建立一个单例，之家在一次表情数据
    /// 表情管理器
    static let share = TYCEmoticonManager()
    /// 表情包的懒加载数组
    lazy var packages = [TYCEmoticonPackage]()
    /// 构造函数，如果在init 之前增加private修饰符，可以要求调用者必须通过shared访问对象
    //OC要重写allocWithZone方法
    private init() {
        loadPackage()
    }
}

extension TYCEmoticonManager {
    
    /// 根据string []在所有的表情符号中查找对应的表情模型对象
    ///
    /// - Parameter string:
    /// - Returns: 如果找到，返回表情模型;否则，返回nil
    func findEmoticon(string: String) -> TYCEmoticon? {
        
            //遍历表情包
        for p in packages {
            
            //在表情数组中过滤 string
            //方法一
//            let result = p.emotions.filter ({ (em) -> Bool in
//                return em.chs == string
//            })
            //方法二，尾随闭包
//            let result = p.emotions.filter() { (em) -> Bool in
//                return em.chs == string
//            }
            //方法三，如果闭包中只有一句，并且是返回‘闭包的格式定义可以省略，参数省略之后，使用 $0 $1... 一次替代原有的参数
//            let result = p.emotions.filter() {
//                return $0.chs == string
//            }
            //方法四，如果闭包中只有一句，并且是返回‘闭包的格式定义可以省略，参数省略之后，使用 $0 $1... 一次替代原有的参数,reture 也可以省略
                let result = p.emotions.filter() { $0.chs == string }
            //判断结果数组的数量
            if result.count == 1 {
                return result[0]
            }
        }
        return nil
    }
}

// MARK: - 表情包数据处理
private extension TYCEmoticonManager{
    
    func loadPackage() {
        
        /// 读取emoticons.plist
        // 只要按照Bundle默认的目录结构设定，就可以直接读取 Resource 目录下的文件
        guard let path = Bundle.main.path(forResource: "HMEmoticon.bundle", ofType: nil),
            let bundle = Bundle(path: path),
            let plistPath = bundle.path(forResource: "emoticons.plist", ofType: nil),
            let array = NSArray(contentsOfFile: plistPath) as? [[String: String]],
            let models = NSArray.yy_modelArray(with: TYCEmoticonPackage.self, json: array) as? [TYCEmoticonPackage]
                else {
                    return
        }
        //设置表情包数据
        //使用 += 不需要再次为packages 分配空间，直接添加数据
        packages += models
    }
}
