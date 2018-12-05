//
//  ViewController.swift
//  DDMediatorDemo
//
//  Created by USER on 2018/12/5.
//  Copyright © 2018 dd01.leo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func getBVCAction(_ sender: Any) {
        
        DDMediator.shared.getBViewController {[weak self] (vc) in
            self?.present(vc ?? UIViewController(), animated: true, completion: nil)
        }
    }

    @IBAction func requestAction(_ sender: Any) {
        
        DDMediator.shared.requestMemberModuleData { (res) in
            print(res)
        }
    }
}

