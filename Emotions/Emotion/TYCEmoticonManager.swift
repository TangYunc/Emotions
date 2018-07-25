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
    /// 构造函数，如果在init 之前增加private修饰符，可以要求调用者必须通过shared访问对象
    //OC要重写allocWithZone方法
    private init() {
        
    }
}
