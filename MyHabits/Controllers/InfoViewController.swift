//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Мой Macbook on 16.05.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = "Личностное развитие"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textInfo: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = """
        1. Общайтесь с позитивными людьми.
        2. Ежедневно записывайте три хорошие вещи, которые случились с вами за день.
        3. Смейтесь. Даже если иногда вы будете заставлять себя это делать. Гормоны радости вам пригодятся.
        4. Проводите больше времени на солнце. Или в хорошо освещённых помещениях, если на улице пасмурно.
        5. Двигайтесь (гуляйте или занимайтесь физкультурой) минимум 20 минут каждый день.
        6. Гуляйте с собакой или погладьте животное.
        7. Обнимайте хотя бы одного человека в день.
        8. Позвоните старому другу или близкому человеку.
        9. Посвятите 30 минут своего времени в день любимому занятию, которое приносит удовольствие и расслабляет вас.
        10. Купите что-то новое (даже что-нибудь незначительное, например новый сорт кофе).
        11. Не пейте на ночь алкоголь. Вместо этого приготовьте себе за час до сна травяной чай.
        12. Занимайтесь физическими упражнениями минимум за два часа до сна.
        13. Ложитесь спать в одно и то же время каждый день.
        14. Просыпайтесь в одно и то же время, включая выходные и праздники.
        """
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupViews()
        setConstrains()
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(textInfo)
        contentView.addSubview(headerText)
    }
}

extension InfoViewController {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            headerText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            headerText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            headerText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            textInfo.topAnchor.constraint(equalTo: headerText.bottomAnchor, constant: 20),
            textInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            textInfo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            textInfo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
}
