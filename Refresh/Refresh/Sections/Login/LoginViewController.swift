//
//  LoginViewController.swift
//  Refresh
//
//  Created by Usr_Prime on 24/11/22.
//

import UIKit
import GoogleSignIn

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
        view.translatesAutoresizingMaskIntoConstraints = false
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
        text.isEditable = false
        text.isUserInteractionEnabled = false
        text.canConstraints()
        return text
    }()
    
    private lazy var loginGoogleButton: UIButton = {
        let buttonCollor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        let imageButton = UIImage(named: "iconGoogle.png")
        
        let button = UIButton()
        button.backgroundColor = buttonCollor
        button.setTitle("Entrar com Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setImage(imageButton, for: .normal)
        button.adjustsImageWhenHighlighted = false
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 40, bottom: 10, right: 220)
        button.titleEdgeInsets = UIEdgeInsets(top: 10, left: -10, bottom: 10, right: 30)
        button.addTarget(self, action: #selector(openLoginWithGoogle), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.isUserInteractionEnabled = false
        button.canConstraints()
        return button
    }()
    
    let viewModel = LoginViewModel()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        setBackground(.lightGray)
        viewModel.delegate = self
        viewModel.fetchUserLogged()
        
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
        
        addSubview(loginGoogleButton)
        loginGoogleButton.leading(view.leadingAnchor, spacing: 30)
        loginGoogleButton.trailing(view.trailingAnchor, spacing: -30)
        loginGoogleButton.height(of: 60)
        loginGoogleButton.bottom(view.bottomAnchor, spacing: -80)
    }
    
    @objc func openLoginWithGoogle() {
        GIDSignIn.sharedInstance.signIn(with: viewModel.signInConfig, presenting: self)
        { userResponse, error in
            guard error == nil else { return }
            self.viewModel.registerSignIn(with: userResponse)
        }
    }
}

extension LoginViewController: LoginViewDelegate {
    func callNextSreen() {
        let categoriesView = SelectCategoriesViewController()
        let rootController = UINavigationController(rootViewController: categoriesView)
        rootController.modalPresentationStyle = .fullScreen
        present(rootController, animated: true)
    }
    
    func showMessageError() {
        let msgError = "Infelizmente não foi possível logar no momento, tente novamente mais tarde"
        let alert = UIAlertController(title: "Ops...", message: msgError, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func authorizeLogin() {
        loginGoogleButton.isUserInteractionEnabled = true
    }
}
