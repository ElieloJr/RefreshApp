//
//  PersistentData.swift
//  Refresh
//
//  Created by Usr_Prime on 29/11/22.
//

import UIKit
import CoreData
import GoogleSignIn

class PersistentData {
    
    // MARK: Fetch user in coreData
    static func fetchUser(completion: @escaping (Result<[UserData], Error>) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<UserData>(entityName: "UserData")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            completion(.success(result))
        } catch {
            completion(.failure(error))
        }
    }
    
    // MARK: Save data of user with coreData
    static func saveUser(with user: User, completion: @escaping (Result<Bool, Error>) -> ()) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "UserData", in: managedContext)!
        let userRegister = NSManagedObject(entity: entity, insertInto: managedContext)
        
        userRegister.setValue(UUID(), forKey: "identifier")
        userRegister.setValue(user.name, forKey: "name")
        userRegister.setValue(user.familyName, forKey: "familyName")
        userRegister.setValue(user.email, forKey: "email")
        userRegister.setValue(user.hasImage, forKey: "hasImage")
        userRegister.setValue(user.imageURL, forKey: "imageURL")
        userRegister.setValue(user.categories, forKey: "categories")
        userRegister.setValue(user.isLoggedIn, forKey: "isLoggedIn")
        
        do {
            try managedContext.save()
            completion(.success(true))
        } catch {
            completion(.failure(error))
        }
    }
    
}
