//
//  SignUpViewModel.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 01/08/22.
//

import Foundation
protocol SignUpViewModelDelegate: AnyObject {
    func userCreatedSuccessfully()
    func errorWhenUserCreating(message: String)
    func isUserEmailAlreadyExist(name: String?, email: String?, password: String?, isEmailContain: Bool)
}
final class SignUpViewModel {
    
    weak var delegate: SignUpViewModelDelegate?
    
    func isUserEmailAlreadyExist(name: String?, email: String?, password: String?) {
      
            guard let result = try? PersistentStorage.shared.context.fetch(UserEntity.fetchRequest()) as? [UserEntity] else { return }
            let maped = result.filter({ $0.email == email }).first
            let isEmailContain = maped != nil ? true : false
        delegate?.isUserEmailAlreadyExist(name: name, email: email, password: password, isEmailContain: isEmailContain)
    }
    
    func createUser(name: String?, email: String?, password: String?)  {
       _ = UserEntity.create(_name: name, _email: email, _password: password)
        do {
            try PersistentStorage.shared.saveContext()
            UD.saveUser(email: email ?? "", name: name ?? "")
            delegate?.userCreatedSuccessfully()
        } catch let error {
            delegate?.errorWhenUserCreating(message: error.localizedDescription)
        }
        
    }
}
