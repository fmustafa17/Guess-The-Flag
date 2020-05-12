//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Farhana Mustafa on 5/10/20.
//  Copyright © 2020 Farhana Mustafa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var score = 0
    var correctAnswer = 0
    var questionCount = 1
    
    var countries: [String] = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "russia", "spain", "uk", "us"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()) Score: \(score)"
    }
    
    func restartGame(action: UIAlertAction! = nil) {
        questionCount = 1
        score = 0
        askQuestion()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String = ""
        questionCount += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong, That's the flag of \(countries[sender.tag])"
            score -= 1
        }
        
        if questionCount == 10 {
            let ac = UIAlertController(title: title,
                                       message: "Final Score: \(score)",
                                       preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Restart game", style: .default, handler: restartGame))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }

    }
    
}

