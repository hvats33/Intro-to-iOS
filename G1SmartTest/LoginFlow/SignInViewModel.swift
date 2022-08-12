//
//  SignInViewModel.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 01/08/22.
//

import Foundation

protocol SignInViewModelDelegate: AnyObject {
    func fetchUserWithSucess(model: UserEntity?, isUserExist: Bool)
    func fetchUserWithError(message: String)
    func  authenticationErrorWith(message: String)
    func authenticationSuccess()
}
final class SignInViewModel {
    
    weak var delegate: SignInViewModelDelegate?
    
    func fetchUser(email: String) {
        do {
            guard let result = try PersistentStorage.shared.context.fetch(UserEntity.fetchRequest()) as? [UserEntity] else { return }
            let mapedUser = result.filter({ $0.email == email }).first
            let isUserExist = mapedUser != nil ? true : false
            delegate?.fetchUserWithSucess(model: mapedUser, isUserExist: isUserExist)
        } catch let error {
            delegate?.fetchUserWithError(message: error.localizedDescription)
        }
    }
    
    func authenticateUserWith(email: String, password: String, fetchedUser: UserEntity?) {
        guard email == fetchedUser?.email ?? "" && password == fetchedUser?.password ?? ""  else {
            delegate?.authenticationErrorWith(message: "Email and password not matched 🙁")
            return
        }
        UD.saveUser(email: email, name: fetchedUser?.name ?? "")
        delegate?.authenticationSuccess()
    }
    
}
