//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Bryant Irawan on 10/19/22.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    //recall outlet in storyboard code
    let cardImageView = UIImageView()
    let stopButton = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let resetButton = CWButton(backgroundColor: .systemGreen, title: "Reset")
    let rulesButton = CWButton(backgroundColor: .systemBlue, title: "Rules")
    
    var cards: [UIImage] = Deck.allValues
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomCard(){
        cardImageView.image = cards.randomElement()
    }
    
    @objc func stopTimer(){
        timer.invalidate()
    }
    
    @objc func resetTimer(){
        stopTimer()
        startTimer()
    }
    
    //code below is to layout buttons, image, entire UI
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }
    
    //setting up source and constraints of playing card
    func configureCardImageView(){
        //first thing you need to do is add subview to view. People often forget this step
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false //use autolayout
        cardImageView.image = UIImage(named: "AS")
        
        //programatic constraints
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    //setting up source and constraints of stop Button
    func configureStopButton(){
        view.addSubview(stopButton)
        //stopButton.translatesAutoresizingMaskIntoConstraints = false **we already did this for all buttons in CWButton
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
    
        //programatic constraints
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30 )
        ])
    }
    
    func configureResetButton(){
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRulesButton(){
        view.addSubview(rulesButton)
        
        //add action
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func presentRulesVC(){
        //recall we are not passing in data into RulesVC
        present(RulesVC(), animated: true)
        
        //if we were using a navigation controller, we would not be using present we would be using navigationController?.pushViewController(rule, animated: Bool) 
        
        //if we were, similar to colors app we would do: look at prepare function
//        let rulesVC = RulesVC()
//        rulesVC.color = .blue
//        present(rulesVC, animated: true)
    }
    
}
