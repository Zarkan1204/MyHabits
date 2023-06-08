//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Мой Macbook on 16.05.2023.
//

import UIKit

class HabitsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "Привычки"
        prepareViewController()
        setupViews()
        setupConstrains()
    }
    
    private func prepareViewController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Сегодня"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPlusButton))
        navigationItem.rightBarButtonItem?.tintColor = .purple
    }
    
    @objc private func addPlusButton() {
        let habitViewController = HabitViewController()
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Назад", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .purple
        navigationController?.pushViewController(habitViewController, animated: true)
    }
    
    private func setupViews() {
        
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
           
        ])
    }
}


