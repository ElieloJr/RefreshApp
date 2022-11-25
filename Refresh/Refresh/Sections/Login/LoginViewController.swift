//
//  LoginViewController.swift
//  Refresh
//
//  Created by Usr_Prime on 24/11/22.
//

import UIKit

class LoginViewController: UIViewController {

    private lazy var imageBackgound: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "womanBackgraund.png")
        image.contentMode = .scaleAspectFill
        image.canConstraints()
        return image
    }()
    
    private lazy var filterView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.opacity = 0.4
        view.canConstraints()
        return view
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
        
        addSubview(filterView)
        filterView.frame = view.bounds
    }
    
}
