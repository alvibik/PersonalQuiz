//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by albik on 31.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - 1. IBOutlets
    
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var animalDefinitionLabel: UILabel!
    
    // MARK: - 3. Public propirties
    
    var answers: [Answer]!
    
    // MARK: - 6. Class ovveride metods

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calcResultAnswers()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
        //view .window?.rootViewController?.dismiss(animated: true)
    }
    
    // MARK: - 9. Private methods
    
    private func calcResultAnswers() {
        let answersWitchResult = answers.map { ($0.type, 0) }
        let calcAnswers = Dictionary(answersWitchResult, uniquingKeysWith: +)
        let sortedAnswers = calcAnswers.sorted(by: {$0.value > $1.value})

        guard let calclatedAnimalInAnswers = sortedAnswers.first?.key else { return }
        updateUI(witch: calclatedAnimalInAnswers)
    }
    
    private func updateUI(witch animal: AnimalType) {
        animalTypeLabel.text = "Вы - \(animal.rawValue)"
        animalDefinitionLabel.text = "\(animal.definition)"
    }

}
