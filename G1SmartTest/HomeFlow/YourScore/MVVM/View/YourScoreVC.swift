//
//  YourScoreVC.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 06/08/22.
//

import UIKit

class YourScoreVC: UIViewController, CoordinatorBoard {

    @IBOutlet weak var lblScore: UILabel!
    
    weak var coordinator: YourScoreCoordinator?
    private lazy var manager: YourScoreViewModel = {
       let vm = YourScoreViewModel()
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    override func viewDidDisappear(_ animated: Bool) {
        coordinator?.didFinishingYourScore()
    }
    func getScore(score: String) {
        manager.score = score
    }
    private func setUI() {
        lblScore.text = manager.score
    }
    @IBAction func checkIncorrectAnswerAction(_ sender: UIButton) {
        coordinator?.back()
    }
    
    @IBAction func homeAction(_ sender: UIButton) {
        coordinator?.home()
    }
}
