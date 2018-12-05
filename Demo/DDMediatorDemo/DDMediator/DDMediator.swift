
//
//  DDMediator.swift
//  DDMediatorDemo
//
//  Created by USER on 2018/12/5.
//  Copyright © 2018 dd01.leo. All rights reserved.
//

import UIKit

/// 若调用sdk中的模块，或者pod管理的模块，需要传入模块名，swift中存在命名空间
public let kMediatorTargetModuleName = "kMediatorTargetModuleName"

//定义两个类型
public typealias MediatorParamDic = [String: Any]
public typealias MediatorCallBack = (Any?) -> ()

public class DDMediator: NSObject {
    /// 单列
    public static let shared = DDMediator()
    
    /// 服务模块对象的开头字符串命名，默认 "Target"开头
    public var moduleName: String = "Target"
}

extension DDMediator {
    public func perform(Target targetName: String, actionName: String, params: MediatorParamDic?, complete: MediatorCallBack?) {
        /// 获取targetClass字符串
        let swiftModuleName = params?[kMediatorTargetModuleName] as? String
        var targetClassString: String?
        if (swiftModuleName?.count ?? 0) > 0 {
            targetClassString = (swiftModuleName ?? "") + "." + "Target_\(targetName)"
        } else {
            let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
            targetClassString = namespace + "." + "\(moduleName)_\(targetName)"
        }
        
        guard let classString = targetClassString  else {
            return
        }
        
        //获取Target对象
        let targetClass = NSClassFromString(classString) as! NSObject.Type
        let target = targetClass.init()
        
        //获取Target对象中的方法Selector
        let sel = Selector(actionName)
        
        //定义回调block
        let result: MediatorCallBack = { res in
            complete?(res)
        }
        
        //创建参数model
        let model = MediatorParams()
        model.callBack = result
        model.params = params
        if target.responds(to: sel) == true {
            target.perform(sel, with: model)
        }
        
        return
    }
}
