//
//  GoalTableViewCell.swift
//  goal-app
//
// Created by Ihor Dolhalov on 31.03.2023.
//

import UIKit

class GoalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var goalNameLabel: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!
    @IBOutlet weak var goalCompleteView: UIView!

    func configureCell(goal: Goal){
        self.goalNameLabel.text = goal.goalName
        self.goalTypeLabel.text = goal.goalType
        self.goalProgressLabel.text = String(goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue {
            self.goalCompleteView.isHidden = false
        } else {
            self.goalCompleteView.isHidden = true
        }
    }
    
}
