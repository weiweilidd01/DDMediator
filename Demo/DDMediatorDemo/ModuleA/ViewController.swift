//
//  ViewController.swift
//  DDMediatorDemo
//
//  Created by USER on 2018/12/5.
//  Copyright © 2018 dd01.leo. All rights reserved.
//

import UIKit
import DDKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //模块A获取Member模块中的控制器
    @IBAction func getBVCAction(_ sender: Any) {
        DDMediator.shared.getBViewController {[weak self] (vc) in
            self?.present(vc ?? UIViewController(), animated: true, completion: nil)
        }
    }
    
    //模块A请求Member模块提供的数据
    @IBAction func requestAction(_ sender: Any) {
        
        DDMediator.shared.requestMemberModuleData { (res) in
//            print(res)
        }
    }
    
    //模块A获取TestSDK模块中的控制器
    @IBAction func getTestVCAction(_ sender: Any) {
        
        DDMediator.shared.presentTestSDK {[weak self] (vc) in
            self?.present(vc ?? UIViewController(), animated: true, completion: nil)
        }
    }
    
}

