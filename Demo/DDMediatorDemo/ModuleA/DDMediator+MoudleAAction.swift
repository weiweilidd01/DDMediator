//
//  DDMediator+MoudleAAction.swift
//  DDMediatorDemo
//
//  Created by USER on 2018/12/5.
//  Copyright © 2018 dd01.leo. All rights reserved.
//

import UIKit
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
