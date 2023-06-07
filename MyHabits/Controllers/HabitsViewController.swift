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
        barButtonItem()
    }
    
    private func barButtonItem() {
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapInfoViewController))
        navigationItem.rightBarButtonItem = myButton
        navigationItem.rightBarButtonItem?.tintColor = .purple
    }

        @objc private func tapInfoViewController() {
            let habitViewController = HabitViewController()
            present(habitViewController, animated: true)
        }
}
