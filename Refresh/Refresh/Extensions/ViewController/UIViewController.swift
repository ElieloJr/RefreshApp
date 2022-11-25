//
//  UIViewController.swift
//  Refresh
//
//  Created by Usr_Prime on 25/11/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setBackground(_ color: UIColor) {
        self.view.backgroundColor = color
    }
    
    func addSubview(_ newView: UIView) {
        self.view.addSubview(newView)
    }
}
