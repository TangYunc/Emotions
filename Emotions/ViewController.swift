//
//  ViewController.swift
//  Emotions
//
//  Created by tangyunchuan on 2018/7/25.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

import UIKit

/**
 1.黄色的文件夹，打包的时候，不会建立目录，主要保存程序文件
    -素材不允许重名
 2.蓝色的文件夹，打包的时候，会建立目录，可以坟墓里的存储素材文件
    -素材可以重名
    -游戏的场景，background.png(草地/雪地/高山/坟墓)
    -手机应用的皮肤：白天/夜间模式
    -切忌：不要把程序文件放在蓝色的文件夹中！
 3.Boundle
    -通常用在第三方框架的素材
    -可以按照黄色文件夹的方式拖拽，同时会保留住目录结构
    -可以避免文件重名 　logo.png
 */

class ViewController: UIViewController {

    @IBOutlet weak var demoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //目标：我[爱你]啊[笑哈哈]
        /**
         注意点：应该倒序遍历
         我[爱你]啊[笑哈哈]
         r1 = {1, 4}
         r2 = {6, 5}
         
         - 顺序替换，替换了前面的之后，后面的范围会失效
         我[爱你的图片]啊[笑哈哈]
         - 倒序替换，一次循环可以把所有的图片全部替换完成
         我[爱你的图片]啊[笑哈哈的图片]
         */
        let sting = "我[爱你]啊[笑哈哈]"
        demoLabel.attributedText = emoticonString(string: sting)
    }
    /// 将给定的字符串转换成属性文本
    ///
    /// - Parameter string: 完整的字符串
    /// - Returns: 属性文本
    func emoticonString(string: String) -> NSAttributedString {
        
        /// AttributedString 是不可变的
        let attrSting = NSMutableAttributedString(string: string)
        //1.建立正则表达式，过滤所有的表情文字
        //[] () 都是正则表达式的关键字，如果要参与匹配，需要转义
        let pattern = "\\[.*?\\]"
        
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []) else {
            return attrSting
        }
        //匹配所有项
        let matches = regx.matches(in: string, options: [], range: NSRange(location: 0, length: attrSting.length))
        //遍历所有匹配结果
        for m in matches.reversed() {
            let r = m.range(at: 0)
            let subStr = (attrSting.string as NSString).substring(with: r)
            print(subStr)
            //使用subStr查找对应的表情符号
            if  let em = TYCEmoticonManager.share.findEmoticon(string: subStr) {
                
                print(em)
                //使用表情符号中的属性文本，替换原有的属性文本的内容
                attrSting.replaceCharacters(in: r, with: em.imageText(font: demoLabel.font))
            }
            
        }
        return attrSting
        
    }

    func demo() {
        //------测试单例----
        let m1 = TYCEmoticonManager.share
        print(m1.packages)
        //        let path = Bundle.main.path(forResource: "HMEmoticon.bundle", ofType: nil)
        //        let bundle = Bundle(path: path!)
        //        let image = UIImage(named: "lxh/lxh_toule.png", in: bundle, compatibleWith: nil)
        //        print(image)
        print(TYCEmoticonManager.share.packages.last?.emotions.first?.image as Any)
        print(TYCEmoticonManager.share.packages.last?.emotions.first as Any)
        //-----测试查找表情-----
        print(TYCEmoticonManager.share.findEmoticon(string: "[爱你]") as Any)
        //------测试直接生成表情属性文本
        let em = TYCEmoticonManager.share.findEmoticon(string: "[马上有对象]")
        demoLabel.attributedText = em?.imageText(font: demoLabel.font)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

