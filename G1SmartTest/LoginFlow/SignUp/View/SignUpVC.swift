//
//  SignUpVC.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 31/07/22.
//

import UIKit

class SignUpVC: UIViewController, CoordinatorBoard {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var stackName: UIStackView!
    @IBOutlet weak var stackEmail: UIStackView!
    @IBOutlet weak var stackPassword: UIStackView!
    @IBOutlet weak var stackSignUp: UIStackView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    weak var coordinator: SignUpCoordinator?
    private lazy var manager: SignUpViewModel = {
        let vm = SignUpViewModel()
        vm.delegate = self
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    override func viewDidDisappear(_ animated: Bool) {
        coordinator?.didFinishingSignUp()
    }
    private func setUI() {
        self.pAnimation(animationDirection: .left, animateTO: [logo, stackName, stackEmail, stackPassword, stackSignUp])
    }
    // Button Action
    @IBAction func signUpAction(_ sender: UIButton) {
        // Validate user input
        let result = SignUpValidator.validateSignUp(name: txtName.text, email: txtEmail.text, password: txtPassword.text)
        
        guard result.isValid else {
            Alerts.alert(title: "Alert", message: result.message)
            return }
        // check email is already exist or not
        manager.isUserEmailAlreadyExist(name: txtName.text, email: txtEmail.text, password: txtPassword.text)
        
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        coordinator?.login()
    }
    
}
// MARK: SignUp ViewModel Delegate
extension SignUpVC: SignUpViewModelDelegate {
    
    func isUserEmailAlreadyExist(name: String?, email: String?, password: String?, isEmailContain: Bool) {
        if isEmailContain {
            Alerts.alert(title: "Alert", message: "Please use another email address \(email ?? "") have already account with us. ")
        } else {
            manager.createUser(name: name, email: email, password: password)
        }
    }
    
    func userCreatedSuccessfully() {
        debugPrint("User Account created Sucessfully")
        coordinator?.signUp()
    }
    
    func errorWhenUserCreating(message: String) {
        Alerts.alert(title: "Error", message: message)
    }
}
