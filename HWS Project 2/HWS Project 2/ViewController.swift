//
//  ViewController.swift
//  HWS Project 2
//
//  Created by Bartu Gençcan on 20.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!){
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()

    }

    @IBAction func buttonTapped(_ sender: UIButton) {
                
        if sender.tag == correctAnswer {
            
            score += 1
            scoreLabel.text = "Score: \(score)"
            askQuestion(action: nil)
            
        }else{
            
            score -= 1
            
            let ac = UIAlertController(title: "Wrong", message: "This is the flag of \(countries[sender.tag].uppercased())", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            
            scoreLabel.text =  "Score: \(score)"
            
        }
        
        if score == 10 {
            
            let ac = UIAlertController(title: "Congratulations", message: "Please press start over to play again!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Start Over", style: .default, handler: nil))
            present(ac, animated: true)
            
            score = 0
            scoreLabel.text = "Score: \(score) "
            
        }
        
       
    }
    
}

