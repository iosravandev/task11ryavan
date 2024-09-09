//
//  ViewController.swift
//  task11ryavan
//
//  Created by Ravan on 09.09.24.
//

import UIKit

class ViewController: UIViewController {
    
    private let firstTextField: UITextField = {
        var textField = UITextField()
        textField.keyboardType = .numberPad
        textField.placeholder = "Введите число 1"
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let secondTextField: UITextField = {
        var textField = UITextField()
        textField.keyboardType = .numberPad
        textField.placeholder = "Введите число 2"
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let sumButton: UIButton = {
        var button = UIButton()
        button.setTitle("Sum", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let sumLabel: UILabel = {
        var label = UILabel()
        label.text = "Sum will be here"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let saveButton: UIButton = {
        var button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let saveLabel: UILabel = {
        var label = UILabel()
        label.text = "Save will be here"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadSavedResult()
        sumButton.addTarget(self, action: #selector(calculateSum), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveResult), for: .touchUpInside)
    }
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(firstTextField)
        view.addSubview(secondTextField)
        view.addSubview(sumButton)
        view.addSubview(sumLabel)
        view.addSubview(saveButton)
        view.addSubview(saveLabel)
        
        NSLayoutConstraint.activate([
            firstTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            firstTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            firstTextField.widthAnchor.constraint(equalToConstant: 200),
            
            secondTextField.topAnchor.constraint(equalTo: firstTextField.bottomAnchor, constant: 36),
            secondTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            secondTextField.widthAnchor.constraint(equalToConstant: 200),
            
            sumButton.topAnchor.constraint(equalTo: secondTextField.bottomAnchor, constant: 36),
            sumButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            sumLabel.topAnchor.constraint(equalTo: sumButton.bottomAnchor, constant: 36),
            sumLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            saveButton.topAnchor.constraint(equalTo: sumLabel.bottomAnchor, constant: 36),
            saveButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            saveLabel.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 36),
            saveLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    @objc private func calculateSum() {
        guard let firstNumberText = firstTextField.text,
              let firstNumber = Double(firstNumberText),
              let secondNumberText = secondTextField.text,
              let secondNumber = Double(secondNumberText) else {
            
            sumLabel.text = "Invalid input"
            return
        }
        
        let sum = firstNumber + secondNumber
        sumLabel.text = "Sum: \(sum)"
        
    }
    
    @objc private func saveResult() {
        if let resultText = sumLabel.text {
            UserDefaults.standard.set(resultText, forKey: "savedResult")
            saveLabel.text = "Saved: \(resultText)"
        }
    }
    
    private func loadSavedResult() {
        if let savedResult = UserDefaults.standard.string(forKey: "savedResult") {
            saveLabel.text = "Saved: \(savedResult)"
        } else {
            saveLabel.text = "No saved result"
        }
    }
}

