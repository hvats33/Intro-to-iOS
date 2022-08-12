//
//  HomeModel.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 02/08/22.
//

import Foundation

struct HomeModel: Decodable {
    let id: String?
    let title: String?
    let numberOfQuestions: String?
    let description: String?
    let duration: String?
    var questions: [QuestionsModel]
}
struct QuestionsModel: Decodable {
    let question: String?
    let questionNumber: String?
    let options: OptionsModel?
    let answer: Options?
    var isSelected: Bool?
    var selectedValue: Options?
    
}
struct OptionsModel: Decodable {
    let optionA: String?
    let optionB: String?
    let optionC: String?
    let optionD: String?
}


enum Options: String, Decodable {
    
    case optionA
    case optionB
    case optionC
    case optionD
}
