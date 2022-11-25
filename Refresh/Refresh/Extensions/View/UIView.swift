//
//  UIView.swift
//  Refresh
//
//  Created by Usr_Prime on 25/11/22.
//

import UIKit

extension UIView {
    func canConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: Constraints
    
    // topAnchor
    func top(_ position: NSLayoutAnchor<NSLayoutYAxisAnchor>, spacing: CGFloat = 0) {
        self.topAnchor.constraint(equalTo: position, constant: spacing).isActive()
    }
    // leadingAnchor
    func leading(_ position: NSLayoutAnchor<NSLayoutXAxisAnchor>, spacing: CGFloat = 0) {
        self.leadingAnchor.constraint(equalTo: position, constant: spacing).isActive()
    }
    // trailingAnchor
    func trailing(_ position: NSLayoutAnchor<NSLayoutXAxisAnchor>, spacing: CGFloat = 0) {
        self.trailingAnchor.constraint(equalTo: position, constant: spacing).isActive()
    }
    // bottomAnchor
    func bottom(_ position: NSLayoutAnchor<NSLayoutYAxisAnchor>, spacing: CGFloat = 0) {
        self.bottomAnchor.constraint(equalTo: position, constant: spacing).isActive()
    }
    // widthAnchor
    func width(of size: CGFloat) {
        self.widthAnchor.constraint(equalToConstant: size).isActive()
    }
    // heightAnchor
    func height(of size: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: size).isActive()
    }
}
