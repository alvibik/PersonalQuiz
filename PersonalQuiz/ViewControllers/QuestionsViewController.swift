//
//  QuestionsViewController.swift
//  PersonalQuiz
//
//  Created by albik on 31.10.2022.
//

import UIKit


final class QuestionsViewController: UIViewController {
    
    // MARK: - 1. IBOutlets
    
    @IBOutlet var questionProgressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider! {
        didSet{
            let answerCount = Float(currentAnswers.count - 1)
            
            rangedSlider.maximumValue = answerCount
            rangedSlider.value = answerCount / 2
        }
    }
    
    // MARK: - 2. Public propirties
    
    // MARK: - 3. Private propirties
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answerChosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    // MARK: - 4. Overridet getters
    
    
    // MARK: - 5. Initializers
    
    
    // MARK: - 6. Class ovveride metods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    // MARK: - 7. IBActions
        
    @IBAction func singleAnswerButtonsPressed(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[currentIndex]
        answerChosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers){
            if multipleSwitch.isOn {
                answerChosen.append(answer)
            }
        }
        
        nextQuestion()
        
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let index = lrintf(rangedSlider.value)
        answerChosen.append(currentAnswers[index])
        
        nextQuestion()
        
    }
    
    
    // MARK: - 8. Public methods
    
    
    // MARK: - 9. Private methods
    
}
// MARK: - 10. Extenssion User Interface

extension QuestionsViewController {
    
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.title
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        showCurrentAnswers(for: currentQuestion.type)
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(witch: currentAnswers)
        case .multiple:
            showMultipleStackView(witch: currentAnswers)
        case .ranged:
            showRangedStackView(witch: currentAnswers)
        }
    }
    
    private func showSingleStackView(witch answers: [Answer]) {
        singleStackView.isHidden.toggle()
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
    private func showMultipleStackView(witch answers: [Answer]) {
        multipleStackView.isHidden.toggle()
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    
    private func showRangedStackView(witch answers: [Answer]) {
        rangedStackView.isHidden.toggle()
        rangedLabels.first?.text = answers.first?.title
        rangedLabels.last?.text = answers.last?.title
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}
