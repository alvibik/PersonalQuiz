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
            
            
            
        }
    }
    
// MARK: - 2. Public propirties

// MARK: - 3. Private propirties

    private let question = Question.getQuestions()
    
// MARK: - 4. Overridet getters


// MARK: - 5. Initializers
    
    
// MARK: - 6. Class ovveride metods
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
// MARK: - 7. IBActions
    
    
    @IBAction func singleAnswerButtonsPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        
    }
    
    
// MARK: - 8. Public methods
    

// MARK: - 9. Private methods
}
