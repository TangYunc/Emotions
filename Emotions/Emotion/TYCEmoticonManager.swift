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
