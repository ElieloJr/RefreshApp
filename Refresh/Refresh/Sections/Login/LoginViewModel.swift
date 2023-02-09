//
//  LoginViewModel.swift
//  Refresh
//
//  Created by Usr_Prime on 29/11/22.
//

import Foundation
import GoogleSignIn
import CoreData

protocol LoginViewDelegate {
    func callNextSreen()
    func showMessageError()
    func authorizeLogin()
}

class LoginViewModel {
    var user: UserData?
    var delegate: LoginViewDelegate?
    let signInConfig = GIDConfiguration(
        clientID: "499258717184-4pji86q8osoeavg720drori6uajvajmd.apps.googleusercontent.com"
    )
    
    func fetchUserLogged() {
        PersistentData.fetchUser { result in
            switch result {
            case .success(let managedObjects):
                if managedObjects.count == 0 {
                    self.delegate?.authorizeLogin()
                } else {
                    self.user = managedObjects[0]
                }
                self.validateLogin()
                
            case .failure(let error):
                self.delegate?.authorizeLogin()
                print(error)
            }
        }
    }
    
    func validateLogin() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            guard let user = self.user else { return }
            if user.isLoggedIn {
                self.delegate?.callNextSreen()
            } else {
                self.delegate?.authorizeLogin()
            }
        }
    }
    
    func registerSignIn(with userData: GIDGoogleUser?) {
        guard let img = userData?.profile?.imageURL(withDimension: 200) else { return }
        let user = User(name: userData?.profile?.name,
                        familyName: userData?.profile?.familyName,
                        email: userData?.profile?.email,
                        hasImage: userData?.profile?.hasImage,
                        imageURL: img.absoluteString,
                        categories: [],
                        isLoggedIn: true)
        
        PersistentData.saveUser(with: user) { result in
            switch result {
            case .success(_):
                self.delegate?.callNextSreen()
            case .failure(_):
                self.delegate?.showMessageError()
            }
        }
    }
}
