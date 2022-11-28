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
        view.layer.opacity = 0.6
        view.canConstraints()
        return view
    }()
    
    private lazy var logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Refresh.png")
        image.canConstraints()
        return image
    }()
    
    private lazy var inviteText: UITextView = {
        let text = UITextView()
        text.contentInsetAdjustmentBehavior = .automatic
        text.font = UIFont(name: "Papyrus", size: 22)
        text.center = self.view.center
        text.textAlignment = .left
        text.textColor = .white
        text.backgroundColor = .clear
        text.text = "O seu jornal diário! \n" +
                    "Noticias fresquinhas \n" +
                    "Aqueles assuntos que você tem curiosidade \n" +
                    "E muito mais..."
        text.canConstraints()
        return text
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
        
        addSubview(logo)
        logo.centerY(view.centerYAnchor)
        logo.leading(view.leadingAnchor, spacing: 20)
        
        addSubview(inviteText)
        inviteText.top(logo.bottomAnchor)
        inviteText.leading(logo.leadingAnchor, spacing: 14)
        inviteText.trailing(view.trailingAnchor, spacing: 20)
        inviteText.height(of: 500)
    }
    
}
