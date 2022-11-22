//
//  ViewController.swift
//  КНБ
//
//  Created by Babayev Kamran on 16.11.22.
//

import UIKit

class ViewController: UIViewController {
    
    let images = ["paper", "sc", "rock"]
    var firstPersonScore = 0
    var secondPersonScore = 0
    
    @IBOutlet weak var firstPersonScoreLabel: UILabel!
    @IBOutlet weak var secondPersonScoreLabel: UILabel!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rockButton.isEnabled = false
        scissorsButton.isEnabled = false
        paperButton.isEnabled = false
        
    }

    @IBAction func rockButton(_ sender: UIButton) {
        imageView1.image = UIImage(named: "rock")
        imageView2.image = UIImage(named: images.randomElement()!)
        checkAnswer()
    }
    
    @IBAction func scissorsButton(_ sender: UIButton) {
        imageView1.image = UIImage(named: "sc")
        imageView2.image = UIImage(named: images.randomElement()!)
        checkAnswer()
    }
    
    @IBAction func paperButton(_ sender: UIButton) {
        imageView1.image = UIImage(named: "paper")
        imageView2.image = UIImage(named: images.randomElement()!)
        checkAnswer()
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        
        imageView1.image = UIImage(named: "paper")
        imageView2.image = UIImage(named: "rock")
        
        rockButton.isEnabled = true
        scissorsButton.isEnabled = true
        paperButton.isEnabled = true
        startButton.isEnabled = false
    }
    
    func checkScore(title: String) {
        if firstPersonScore == 3 || secondPersonScore == 3 {
            let ac = UIAlertController(title: title, message: "\(title) won", preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
                self.restartGame()
            }))
            present(ac, animated: true)
        }
    }
    
    func checkAnswer() {
        
        if imageView1.image == imageView2.image {
            print("They are equals")
        } else if imageView1.image == UIImage(named:"paper") && imageView2.image == UIImage(named: "rock") {
            firstPersonScore += 1
            firstPersonScoreLabel.text = "Score = \(firstPersonScore)"
            checkScore(title: "You")
        } else if imageView1.image == UIImage(named:"rock") && imageView2.image == UIImage(named: "sc") {
            firstPersonScore += 1
            firstPersonScoreLabel.text = "Score = \(firstPersonScore)"
            checkScore(title: "You")
        } else if imageView1.image == UIImage(named:"sc") && imageView2.image == UIImage(named: "paper") {
            firstPersonScore += 1
            firstPersonScoreLabel.text = "Score = \(firstPersonScore)"
            checkScore(title: "You")
        } else if imageView1.image == UIImage(named:"rock") && imageView2.image == UIImage(named: "paper") {
            secondPersonScore += 1
            secondPersonScoreLabel.text = "Score = \(secondPersonScore)"
            checkScore(title: "Computer")
        } else if imageView1.image == UIImage(named:"sc") && imageView2.image == UIImage(named: "rock") {
            secondPersonScore += 1
            secondPersonScoreLabel.text = "Score = \(secondPersonScore)"
            checkScore(title: "Computer")
        } else if imageView1.image == UIImage(named:"paper") && imageView2.image == UIImage(named: "sc") {
            secondPersonScore += 1
            secondPersonScoreLabel.text = "Score = \(secondPersonScore)"
            checkScore(title: "Computer")
        }
    }
    
    func restartGame() {
        firstPersonScore = 0
        secondPersonScore = 0
        
        firstPersonScoreLabel.text = "Score = \(firstPersonScore)"
        secondPersonScoreLabel.text = "Score = \(secondPersonScore)"
    }
    
}

