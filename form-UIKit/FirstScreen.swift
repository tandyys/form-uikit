//
//  FirstScreen.swift
//  form-UIKit
//
//  Created by tandyys on 28/09/25.
//

import UIKit

class FirstScreen: UIViewController {
    let button: UIButton = UIButton()
    let button2: UIButton = UIButton()
    let input: UITextField = UITextField()
    let input2: UITextField = UITextField()
    let featureTitle: UILabel = UILabel()
    let featureTitle2: UILabel = UILabel()
    let resultHstackView: UIStackView = UIStackView()
    let resultHstackView2: UIStackView = UIStackView()
    let resultLabel: UILabel = UILabel()
    let resultLabel2: UILabel = UILabel()
    let resultValueLabel: UILabel = UILabel()
    let resultValueLabel2: UILabel = UILabel()
    let spacer: UIView = UIView()
    let spacer2: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLabel(featureTitle, "Palindrome Checker", view.layoutMarginsGuide.leadingAnchor, view.layoutMarginsGuide.trailingAnchor, view.layoutMarginsGuide.topAnchor, 0)
        setUpInputTextField(input, "Enter a word you want to check", view.layoutMarginsGuide.leadingAnchor, view.layoutMarginsGuide.trailingAnchor, featureTitle.bottomAnchor, 25, 50)
        setUpExecuteButton(button, .systemPink, #selector(didTapPalindromeButton), "Check", input.bottomAnchor)
        setUpResultLabel(resultLabel, resultValueLabel, resultHstackView, spacer, button.bottomAnchor)
        setUpLabel(featureTitle2, "Valid Parentheses", view.layoutMarginsGuide.leadingAnchor, view.layoutMarginsGuide.trailingAnchor, resultHstackView.bottomAnchor, 50)
        setUpInputTextField(input2, "Enter brackets pair here to check", view.layoutMarginsGuide.leadingAnchor, view.layoutMarginsGuide.trailingAnchor, featureTitle2.bottomAnchor, 25, 50)
        setUpExecuteButton(button2, .systemPurple, #selector(didTapValidParenthesesButton), "Check", input2.bottomAnchor)
        setUpResultLabel(resultLabel2, resultValueLabel2, resultHstackView2, spacer2, button2.bottomAnchor)

        view.backgroundColor = .systemBackground
    }
    
    func setUpLabel(_ l: UILabel, _ t: String, _ s: NSLayoutXAxisAnchor, _ e: NSLayoutXAxisAnchor, _ ta: NSLayoutYAxisAnchor, _ c: CGFloat) {
        view.addSubview(l)
        
        l.text = t
        l.font = .systemFont(ofSize: 30, weight: .bold)
        l.textAlignment = .left
        l.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            l.leadingAnchor.constraint(equalTo: s),
            l.trailingAnchor.constraint(equalTo: e),
            l.topAnchor.constraint(equalTo: ta, constant: c)
        ])
    }
    
    func setUpInputTextField(_ v: UITextField, _ p: String, _ l: NSLayoutXAxisAnchor, _ t: NSLayoutXAxisAnchor, _ ta: NSLayoutYAxisAnchor, _ ct: CGFloat, _ ch: CGFloat) {
        view.addSubview(v)
        
        v.placeholder = p
        v.borderStyle = .roundedRect
        v.clearButtonMode = .whileEditing
        v.returnKeyType = .done
        v.autocorrectionType = .no
        v.autocapitalizationType = .none
        v.textContentType = .none
        
        v.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            v.leadingAnchor.constraint(equalTo: l),
            v.trailingAnchor.constraint(equalTo: t),
            v.topAnchor.constraint(equalTo: ta, constant: ct),
            v.heightAnchor.constraint(equalToConstant: ch)
        ])
    }
    
    func setUpExecuteButton(_ b: UIButton, _ c: UIColor, _ sf: Selector, _ t: String, _ ta: NSLayoutYAxisAnchor) {
        view.addSubview(b)
        
        b.configuration = .filled()
        b.configuration?.baseBackgroundColor = c
        b.configuration?.title = t
        b.translatesAutoresizingMaskIntoConstraints = false
        
        b.addTarget(self, action: sf, for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            b.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            b.topAnchor.constraint(equalTo: ta, constant: 25),
            b.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            b.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setUpResultLabel(_ rl: UILabel, _ rvl: UILabel, _ sv: UIStackView, _ s: UIView, _ b: NSLayoutYAxisAnchor) {
        sv.addArrangedSubview(rl)
        sv.addArrangedSubview(rvl)
        sv.addArrangedSubview(s)
        view.addSubview(sv)
        
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .equalSpacing
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        rl.text = "Result: "
        rl.font = .systemFont(ofSize: 20, weight: .bold)
        rl.textAlignment = .left
        rl.translatesAutoresizingMaskIntoConstraints = false
        
        rvl.text = "-"
        rvl.font = .systemFont(ofSize: 20)
        rvl.textAlignment = .left
        rvl.translatesAutoresizingMaskIntoConstraints = false
        
        s.backgroundColor = .purple
        s.translatesAutoresizingMaskIntoConstraints = false
//        spacer.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        spacer.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        NSLayoutConstraint.activate([
            sv.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            sv.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            sv.topAnchor.constraint(equalTo: b, constant: 25),
            rl.widthAnchor.constraint(equalTo: sv.widthAnchor, multiplier: 0.25),
            rvl.widthAnchor.constraint(equalTo: sv.widthAnchor, multiplier: 0.25),
            s.widthAnchor.constraint(equalTo: sv.widthAnchor, multiplier: 0.5)
        ])
        
//        NSLayoutConstraint.activate([
//            // Place the title label below the button
//            resultLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
//            resultLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
//            resultLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 50),
//
//            // Place the value label below the title label
//            resultValueLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
//            resultValueLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
//            resultValueLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 10)
//        ])
    }
    
    @objc func didTapPalindromeButton() {
        let userInput: String = input.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        guard !userInput.isEmpty else {
            resultValueLabel.text = "-"
            return
        }
        let res: String = isPalindrome(userInput)
        resultValueLabel.text = res
        print(res)
    }
    
    @objc func didTapValidParenthesesButton() {
        let userInput: String = input2.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        guard !userInput.isEmpty else {
            resultValueLabel2.text = "-"
            return
        }
        let res: String = isValidParent(userInput)
        resultValueLabel2.text = res
        print(res)
    }
    
    private func isPalindrome(_ s: String) -> String {
        let tempS = s.reversed()
        if s == String(tempS) { return "True" } else { return "False" }
    }
    
    private func isValidParent(_ s: String) -> String {
        let map: [Character:Character] = [
            ")":"(",
            "]":"[",
            "}":"{"
        ]
        var tempStack: [Character] = []
        
        for c in s {
            if map.values.contains(c) {
                tempStack.append(c)
            } else if tempStack.last == map[c] && !tempStack.isEmpty {
                tempStack.removeLast()
            } else {
                return "False"
            }
        }
        return tempStack.isEmpty ? "True" : "False"
    }
}

