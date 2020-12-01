//
//  UIApplication+Extension.swift
//  StreachyHeader
//
//  Created by Rishu Gupta on 01/12/20.
//

import UIKit

extension UIApplication {
    var statusBarView : UIView? {
        if #available(iOS 13.0, *) {
            let tag = 987654321
            if let statusBar = UIApplication.shared.keyWindow?.viewWithTag(tag) {
                return statusBar
            } else {
                let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
                statusBarView.tag = tag
                UIApplication.shared.keyWindow?.addSubview(statusBarView)
                return statusBarView
            }
        } else {
            return value(forKey: "statusBar") as? UIView
        }
    }
    
    func resetStatusBar() {
        if #available(iOS 13.0, *) {
            let tag = 987654321
            UIApplication.shared.keyWindow?.viewWithTag(tag)?.removeFromSuperview()
        }
    }
}
