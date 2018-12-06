//
//  Target_sdk.swift
//  TestSDK
//
//  Created by USER on 2018/12/6.
//  Copyright © 2018 dd01.leo. All rights reserved.
//

import UIKit
import DDKit
/// 提供服务的模块。创建一个Target对象,以Target开头加以区别，并继承NSObject，并实现需要提供的方法,
//每个方法前，必须要加@objc selector调用必须要
//定义的方法加以下相同的参数
class Target_sdk: NSObject {
    // 获取TestSDK中的控制器
    @objc public func getTestViewController(_ model: MediatorParams) {
        let vc = TestViewController()
        vc.view.backgroundColor = UIColor.red
        model.callBack?(vc)
    }

}
