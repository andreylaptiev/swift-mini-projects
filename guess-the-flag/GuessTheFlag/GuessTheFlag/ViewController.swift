//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Andrii Laptiiev on 24.08.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var flag1: UIButton!
    @IBOutlet weak var flag2: UIButton!
    @IBOutlet weak var flag3: UIButton!

    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    static var numberOfQuestions = 10


    override func viewDidLoad() {
        super.viewDidLoad()

        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "spain", "uk", "us"]

        flag1.layer.borderWidth = 1
        flag2.layer.borderWidth = 1
        flag3.layer.borderWidth = 1

        flag1.layer.borderColor = UIColor.black.cgColor
        flag2.layer.borderColor = UIColor.black.cgColor
        flag3.layer.borderColor = UIColor.black.cgColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showScore))

        askQuestion()
    }


    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()), score: \(score)"

        flag1.setImage(UIImage(named: countries[0]), for: .normal)
        flag2.setImage(UIImage(named: countries[1]), for: .normal)
        flag3.setImage(UIImage(named: countries[2]), for: .normal)

        ViewController.numberOfQuestions -= 1
    }


    func restart(action: UIAlertAction! = nil) {
        score = 0
        ViewController.numberOfQuestions = 10
        askQuestion()
    }


    @objc func showScore() {
        let alert = UIAlertController(title: "Score", message: String(score), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }


    @IBAction func onFlagTap(_ sender: UIButton) {
        var alert: UIAlertController
        var title: String
        var message: String

        if sender.tag == correctAnswer {
            score += 1
            title = "Correct!"
            message = "Your score is \(score)"
        } else {
            score -= 1
            title = "Wrong!"
            message = """
                That's the flag of \(countries[sender.tag].uppercased())
                Your score is \(score)
                """
        }

        if (ViewController.numberOfQuestions == 0) {
            alert = UIAlertController(title: "Final score", message: "\(score)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: restart))
            present(alert, animated: true)
            return
        }

        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))

        present(alert, animated: true)
    }
}
