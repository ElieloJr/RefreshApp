//
//  LoginViewController.swift
//  Refresh
//
//  Created by Usr_Prime on 24/11/22.
//

import UIKit

class LoginViewController: UIViewController {

    lazy var imageBackgound: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "womanBackgraund.png")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        setBackground(.lightGray)
        
        addSubview(imageBackgound)
        imageBackgound.top(view.topAnchor)
        imageBackgound.leading(view.leadingAnchor, spacing: -200)
        imageBackgound.bottom(view.bottomAnchor)
        
        
    }
    
}
