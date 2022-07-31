//
//  ViewController.swift
//  TrafficLight
//
//  Created by roman Khilchenko on 31.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var counter = 0
    
    private let redView: UIView = {
        let viewFirst = UIView()
        viewFirst.translatesAutoresizingMaskIntoConstraints = false
        viewFirst.backgroundColor = .red
        viewFirst.alpha = 0.3
        return viewFirst
    }()
    
    private let yellowView: UIView = {
        let viewSecond = UIView()
        viewSecond.translatesAutoresizingMaskIntoConstraints = false
        viewSecond.backgroundColor = .yellow
        viewSecond.alpha = 0.3
        return viewSecond
    }()
    
    private let greenView: UIView = {
        let viewThird = UIView()
        viewThird.translatesAutoresizingMaskIntoConstraints = false
        viewThird.backgroundColor = .green
        viewThird.alpha = 0.3
        return viewThird
    }()
    
    private let startButton: UIButton = {
        let buttonStart = UIButton()
        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        buttonStart.setTitle("START", for: .normal)
        buttonStart.tintColor = .white
        buttonStart.backgroundColor = .blue
        buttonStart.layer.cornerRadius = 10
        //MARK: Женя просит чтобы использовал ViewController.self но если так пишу то падает в runtime!так все гуд
        buttonStart.addTarget(self,action: #selector(ButtonAction), for: .touchUpInside)
        return buttonStart
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .black
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    override func viewWillLayoutSubviews() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }
    
    //MARK: Реализовал логику переключения светофора немного по другому не как в сториборд!
    @objc private func ButtonAction() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        counter += 1
        switch counter {
        case 1:
            redView.alpha = 1
        case 2:
            redView.alpha = 0.3
            yellowView.alpha = 1
        case 3:
            yellowView.alpha = 0.3
            greenView.alpha = 1
        default:
            greenView.alpha = 0.3
            counter = 0
        }
    }
    
    private func setupLayout() {
        view.addSubview(stackView)
        view.addSubview(startButton)
        [redView, yellowView, greenView].forEach { stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 90),
            stackView.heightAnchor.constraint(equalToConstant: 300),
            
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            startButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -120),
        ])
    }
}

