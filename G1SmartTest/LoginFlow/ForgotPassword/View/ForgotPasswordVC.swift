//
//  ForgotPassword.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 31/07/22.
//

import UIKit

class ForgotPasswordVC: UIViewController, CoordinatorBoard {

    @IBOutlet weak var stackEmail: UIStackView!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var signUp: UIButton!
    
    weak var coordinator: ForgotPasswordCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        //coordinator?.didFinishingForgotPassword()
    }

    private func setUI() {
        self.pAnimation(animationDirection: .left, animateTO: [stackEmail, signUp])
        self.pAnimation(animationDirection: .right, animateTO: [btnLogin])
        self.pAnimation(animationDirection: .up, animateTO: [btnReset])
    }
    
    @IBAction func resetAction(_ sender: UIButton) {
        guard Validate.isValidEmail(txtEmail.text ?? "") else {
            Alerts.alert(title: "Alert", message: "Please enter valid email address")
            return
        }
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        coordinator?.login()
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        coordinator?.signUp()
    }
}
