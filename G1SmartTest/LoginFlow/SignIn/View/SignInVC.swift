//
//  SignInVC.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 31/07/22.
//

import UIKit

class SignInVC: UIViewController, CoordinatorBoard {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var stackEmail: UIStackView!
    @IBOutlet weak var stackPassword: UIStackView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var stackSignUp: UIStackView!
    
     var coordinator: MainCoordinator?
    private lazy var manager: SignInViewModel = {
       let vm = SignInViewModel()
        vm.delegate = self
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    private func setUI() {
        if let nav = navigationController, coordinator == nil {
            coordinator = MainCoordinator(_navigationControlller: nav)
        }
        self.pAnimation(animationDirection: .up, animateTO: [logo, stackEmail, stackPassword, btnForgotPassword])
        self.pAnimation(animationDirection: .down, animateTO: [btnSignIn, stackSignUp])
    }
    // Button Action
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
        coordinator?.forgotPassword()
    }
    @IBAction func signInAction(_ sender: UIButton) {
        let data = SignInModel(email: txtEmail.text ?? "", password: txtPassword.text ?? "")
        let result = SignInValidator.validateSignIn(model: data)
        guard result.isValid else {
            Alerts.alert(title: "Alert", message: result.message)
            return }
        manager.fetchUser(email: txtEmail.text ?? "")
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        coordinator?.signUp()
    }
}
extension SignInVC: SignInViewModelDelegate {
    func authenticationErrorWith(message: String) {
        Alerts.alert(title: "Error", message: message)
    }
    
    func authenticationSuccess() {
        debugPrint("Login Success")
        coordinator?.signIn()
    }
    
    func fetchUserWithSucess(model: UserEntity?, isUserExist: Bool) {
        if isUserExist {
            manager.authenticateUserWith(email: txtEmail.text ?? "", password: txtPassword.text ?? "", fetchedUser: model)
        } else {
            Alerts.alert(title: "Error", message: "User not found!")
        }
    }
    
    func fetchUserWithError(message: String) {
        Alerts.alert(title: "Error", message: message)
    }
}
