//
//  Target_Member.swift
//  DDMediatorDemo
//
//  Created by USER on 2018/12/5.
//  Copyright © 2018 dd01.leo. All rights reserved.
//

import UIKit

/// 提供服务的模块。创建一个Target对象,以Target开头加以区别，并继承NSObject，并实现需要提供的方法,
//每个方法前，必须要加@objc selector调用必须要
//定义的方法加以下相同的参数

public class Target_Member: NSObject {
    
   @objc public func getBViewController(_ model: MediatorParams) {
        print(model)
        let vc = BViewController()
        model.callBack?(vc)
    }
    
    //给其他模块调用提供请求网络数据接口
    @objc public func requestMemberData(_ model: MediatorParams) {
        //请求参数获取
        let reqId = model.params?["id"]
        let page = model.params?["page"]
        print(reqId)
        print(page)
        
        //模拟请求数据延时返回
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            model.callBack?("sdfsdf")
        }
    }
}
