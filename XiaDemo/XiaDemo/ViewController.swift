//
//  ViewController.swift
//  XiaDemo
//
//  Created by Leo on 27/02/2017.
//  Copyright © 2017 Leo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navBar = self.navigationController?.navigationBar
        navBar?.backgroundColor = UIColor.blue
    }

    func generateXia() -> Xia {
        return Xia()
    }
    
    @IBAction func onShowInfo() {
        UIApplication.shared.setStatusBarStyle(.default, animated: true)
        
        Xia.showInfo("每天最多给 10 个人点赞哦")
    }
    
    @IBAction func onShowSuccess() {
        UIApplication.shared.setStatusBarStyle(.default, animated: true)
        
        Xia.showSuccess("点赞成功")
    }
    
    @IBAction func onShowWarning() {
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
        
        let xia = Xia()
        xia.autoHide = false
        xia.textColor = UIColor.white
        xia.textFont = UIFont.boldSystemFont(ofSize: 14.0)
        xia.showWarning("点赞失败，请稍后重试", backgroundColor: UIColor.orange)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(5)) {
            UIApplication.shared.setStatusBarStyle(.default, animated: true)
            
            xia.hide()
        }
    }
}

