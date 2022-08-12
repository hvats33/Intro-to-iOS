//
//  HomeDetailsVC.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 04/08/22.
//

import UIKit

class HomeDetailsVC: UIViewController, CoordinatorBoard {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var questionsCollectionView: HomeDetailsQuestionsCollectionView!
    @IBOutlet weak var numberOfQuestionsCollectionView: HomeDetailsQuestionsCountCollectionView!
    
     var coordinator: HomeDetailsCoordinator?
    
    private lazy var manager: HomeDetailsViewModel = {
       let vm = HomeDetailsViewModel()
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        coordinator?.didFinishingHomeDetails()
    }

    func getDetails(model: HomeModel?) {
        self.manager.details = model
    }

    private func setUI() {
        lblTitle.text = manager.details?.description ?? ""
        registerCell()
        let numberOfQuestions = Int(manager.details?.numberOfQuestions ?? "") ?? 0
        var arr: [QuestionCountModel] = []
       
        for index in 0...numberOfQuestions - 1 {
            let count = index + 1
            let data = QuestionCountModel(title: "\(count)", isSelected: false)
            arr.append(data)
        }
        arr[0].isSelected = true
        numberOfQuestionsCollectionView.setCollectionView(arr: arr)
        
        if let questions = manager.details?.questions {
            questionsCollectionView.setCollectionView(arr: questions, delegates: self)
        }
    }
    private func registerCell() {
        let nib: UINib = UINib(nibName: "QuestionsCountCVC", bundle: nil)
        numberOfQuestionsCollectionView.register(nib, forCellWithReuseIdentifier: "QuestionsCountCVC")
        
        let nib1: UINib = UINib(nibName: "QuestionsListCVC", bundle: nil)
        questionsCollectionView.register(nib1, forCellWithReuseIdentifier: "QuestionsListCVC")
        
        
    }
    @IBAction func backAction(_ sender: UIButton) {
        coordinator?.back()
    }
    
    @IBAction func leftAction(_ sender: UIButton) {
        if manager.currentPage > 0 {
            manager.currentPage -= 1
            let indexPath = IndexPath(item: manager.currentPage, section: 0)
            questionsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            numberOfQuestionsCollectionView.selectedIndex(index: manager.currentPage)
        }
    }
    @IBAction func rightAction(_ sender: UIButton) {
        let totalQuestions = Int(manager.details?.numberOfQuestions ?? "") ?? 0
        if manager.currentPage < totalQuestions - 1 {
            manager.currentPage += 1
            let indexPath = IndexPath(item: manager.currentPage, section: 0)
            questionsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            numberOfQuestionsCollectionView.selectedIndex(index: manager.currentPage)
        }
    }
    @IBAction func submitAction(_ sender: UIButton) {
        let totalQuestions = Int(manager.details?.numberOfQuestions ?? "") ?? 0
        let totalScore = totalQuestions * 10
        let correctAnswers = manager.details?.questions.filter( { $0.isSelected == true }).filter({ $0.selectedValue == $0.answer }).count ?? 0
        let userScore = correctAnswers * 10
        coordinator?.yourScore(score: "\(userScore)/\(totalScore)")
    }
}
extension HomeDetailsVC: HomeDetailsQuestionsCollectionViewDelegate {
    func didSelectOptionA(index: Int) {
        manager.details?.questions[index].isSelected = true
        manager.details?.questions[index].selectedValue = .optionA
        questionsCollectionView.updateValues(arr: manager.details?.questions ?? [])
        
    }
    
    func didSelectOptionB(index: Int) {
        manager.details?.questions[index].isSelected = true
        manager.details?.questions[index].selectedValue = .optionB
        questionsCollectionView.updateValues(arr: manager.details?.questions ?? [])
    }
    
    func didSelectOptionC(index: Int) {
        manager.details?.questions[index].isSelected = true
        manager.details?.questions[index].selectedValue = .optionC
        questionsCollectionView.updateValues(arr: manager.details?.questions ?? [])
    }
    
    func didSelectOptionD(index: Int) {
        manager.details?.questions[index].isSelected = true
        manager.details?.questions[index].selectedValue = .optionD
        questionsCollectionView.updateValues(arr: manager.details?.questions ?? [])
    }
}
