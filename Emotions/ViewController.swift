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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let m1 = TYCEmoticonManager.share
        print(m1.packages)
//        let path = Bundle.main.path(forResource: "HMEmoticon.bundle", ofType: nil)
//        let bundle = Bundle(path: path!)
//        let image = UIImage(named: "lxh/lxh_toule.png", in: bundle, compatibleWith: nil)
//        print(image)
        print(TYCEmoticonManager.share.packages.last?.emotions.first?.image)
        print(TYCEmoticonManager.share.packages.last?.emotions.first)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

