//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var chocie1: UIButton!
    @IBOutlet weak var chocie2: UIButton!
    @IBOutlet weak var chocie3: UIButton!
    
    var quizBrain = QuizBrain()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            updateUI()
        }

        //New button needs to be linked to this IBAction too.
    @IBAction func answerButtonPressed(_ sender: UIButton) {
    
    
            
            let userAnswer = sender.currentTitle!
            
            let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
            
            if userGotItRight {
                sender.backgroundColor = UIColor.green
            } else {
                sender.backgroundColor = UIColor.red
            }
            
            quizBrain.nextQuestion()
            
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
        
        @objc func updateUI() {
            questionLabel.text = quizBrain.getQuestionText()
            
            //Need to fetch the answers and update the button titles using the setTitle method.
            let answerChoices = quizBrain.getAnswers()
            chocie1.setTitle(answerChoices[0], for: .normal)
            chocie2.setTitle(answerChoices[1], for: .normal)
            chocie3.setTitle(answerChoices[2], for: .normal)
            
            progressBar.progress = quizBrain.getProgress()
            scoreLabel.text = "Score: \(quizBrain.getScore())"
            
            chocie1.backgroundColor = UIColor.clear
            chocie2.backgroundColor = UIColor.clear
            
            //Third button needs to be reset too.
            chocie3.backgroundColor = UIColor.clear
            
        }

    }







    
    
    
    
    
    



