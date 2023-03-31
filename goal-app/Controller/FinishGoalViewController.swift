//
//  FinishGoalViewController.swift
//  goal-app
//
// Created by Ihor Dolhalov on 31.03.2023.
//

import UIKit
import CoreData

class FinishGoalViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var createGoalButton: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalName: String!
    var goalType: GoalType!
    
    func initData(name: String, type: GoalType) {
        self.goalName = name
        self.goalType = type
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalButton.bindToKeyboard()
        pointsTextField.delegate = self
    }

    @IBAction func createGoalBtnPressed(_ sender: Any) {
        if (pointsTextField.text != "") && (pointsTextField.text != "0"){
            self.saveToCoreData {(complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func saveToCoreData(completion: (_ finished: Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managedContext)
        
        goal.goalName = goalName
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            print("Successfully saved Data!")
            completion(true)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
        
    }
}
