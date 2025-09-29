//
//  FirstScreen.swift
//  form-UIKit
//
//  Created by tandyys on 28/09/25.
//

import UIKit

class FirstScreen: UIViewController {
    let button: UIButton = UIButton()
    let input: UITextField = UITextField()
    let featureTitle: UILabel = UILabel()
    let resultLabel: UILabel = UILabel()
    let resultValueLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLabel()
        setUpInputTextField()
        setUpExecuteButton()
        setUpResultLabel()
        view.backgroundColor = .systemBackground
    }
    
    func setUpLabel() {
        view.addSubview(featureTitle)
        
        featureTitle.text = "Palindrome Checker"
        featureTitle.font = .systemFont(ofSize: 30, weight: .bold)
        featureTitle.textAlignment = .left
        featureTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            featureTitle.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            featureTitle.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            featureTitle.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor)
        ])
    }
    
    func setUpInputTextField() {
        view.addSubview(input)
        
        input.placeholder = "Enter word you want to check"
        input.borderStyle = .roundedRect
        input.clearButtonMode = .whileEditing
        input.returnKeyType = .done
        input.autocorrectionType = .no
        input.autocapitalizationType = .none
        input.textContentType = .none
        
        input.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            input.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            input.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            input.topAnchor.constraint(equalTo: featureTitle.bottomAnchor, constant: 25),
            input.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setUpExecuteButton() {
        view.addSubview(button)
        
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .systemPink
        button.configuration?.title = "Execute"
        button.translatesAutoresizingMaskIntoConstraints = false
        
        //what will button do when tapped
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: input.bottomAnchor, constant: 50),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setUpResultLabel() {
        view.addSubview(resultLabel)
        view.addSubview(resultValueLabel)
        
        resultLabel.text = "Result: "
        resultLabel.font = .systemFont(ofSize: 20, weight: .bold)
        resultLabel.textAlignment = .left
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        resultValueLabel.text = "-"
        resultValueLabel.font = .systemFont(ofSize: 20)
        resultValueLabel.textAlignment = .left
        resultValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Place the title label below the button
            resultLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            resultLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 50),

            // Place the value label below the title label
            resultValueLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            resultValueLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            resultValueLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 10)
        ])
    }
    
    @objc func didTapButton() {
        let userInput: String = input.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        guard !userInput.isEmpty else {
            resultValueLabel.text = "-"
            return
        }
        let res: String = isPalindrome(userInput)
        resultValueLabel.text = res
        print(res)
    }
    
    private func isPalindrome(_ s: String) -> String {
        let tempS = s.reversed()
        if s == String(tempS) { return "True" } else { return "False" }
    }
}

