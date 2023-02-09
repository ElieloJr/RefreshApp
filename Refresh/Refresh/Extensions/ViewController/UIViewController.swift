//
//  UIViewController.swift
//  Refresh
//
//  Created by Usr_Prime on 25/11/22.
//

import UIKit

extension UIViewController {
    
    func setBackground(_ color: UIColor) {
        self.view.backgroundColor = color
    }
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func addSubview(_ newView: UIView) {
        self.view.addSubview(newView)
    }
}
