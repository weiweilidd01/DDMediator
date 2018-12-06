//
//  DDMediator+MoudleAAction.swift
//  DDMediatorDemo
//
//  Created by USER on 2018/12/5.
//  Copyright © 2018 dd01.leo. All rights reserved.
//

import UIKit
import DDKit
//需要调整模块的名字 Target_Member, 请省略Target_
let kMediatorTarget = "Member"

//调用模块的方法名 getBViewController 若方法带一个字典参数，后面一定要加 ":",否则会崩溃
let kGetBViewControllerAction = "getBViewController:"

//请求会员模块的方法名
let kRequestMemberData  = "requestMemberData:"


// MARK: - 需要主动去调用其他的模块。请实现DDMeditor的extention，实现你想要操作的方法
extension DDMediator {
    //获取会员模块的B控制器
    public func getBViewController(_ complete: ((UIViewController?)->())? ) {
        
        perform(Target: kMediatorTarget, actionName: kGetBViewControllerAction, params: nil) { (res) in
            complete?(res as? UIViewController)
        }
    }
    
    //请求会员模块的数据
    public func requestMemberModuleData(_ complete: @escaping (Any?)->()) {
        perform(Target: kMediatorTarget, actionName: kRequestMemberData, params: ["id": 12, "page": 2]) { (res) in
            complete(res)
        }
    }
    
}






//TestSDK模块的请求方法
let kTestSDKTarget = "sdk"
let kGetTestViewControllerAction = "getTestViewController:"

extension DDMediator {
    
    public func presentTestSDK(_ complete: @escaping (UIViewController?)->()) {
        //切记：
        //调用SDK模块，获取pod管理的模块，params中必须要传命名空间的名字。
        //比如你的sdk叫做TestSDK，请传入"TestSDK"
        //比如你pod管理的模块叫做PayModule。请传入"PayModule"
        perform(Target: kTestSDKTarget, actionName: kGetTestViewControllerAction, params: [kMediatorTargetModuleName: "TestSDK"]) { (vc) in
            complete(vc as? UIViewController)
        }
    }
}
