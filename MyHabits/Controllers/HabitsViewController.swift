//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Мой Macbook on 16.05.2023.
//

import UIKit

class HabitsViewController: UIViewController {
    
    let store = HabitsStore.shared
    let progressCollectionViewCell = ProgressCollectionViewCell()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray6
        collectionView.register(
            HabitCollectionViewCell.self, forCellWithReuseIdentifier: HabitCollectionViewCell.identifier)
        collectionView.register(
            ProgressCollectionViewCell.self, forCellWithReuseIdentifier: ProgressCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "Привычки"
        prepareViewController()
        setupViews()
        setupConstrains()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
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
    
    @objc func reloadCollectionView() {
        collectionView.reloadData()
    }
    
    private func addTwoHabbit(){
        store.habits.removeAll()
        store.habits.append(Habit(name: "Погладь кота", date: Date(), color: .red))
        store.habits.append(Habit(name: "Сходить в магазин", date: Date(), color: .purple))
    }
    
    private func setupViews() {
        view.addSubview(collectionView)
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension HabitsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return store.habits.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if  indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgressCollectionViewCell.identifier, for: indexPath) as! ProgressCollectionViewCell
            cell.setProgress(with: store.todayProgress)
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitCollectionViewCell.identifier, for: indexPath) as! HabitCollectionViewCell
            
            cell.setupCell(habit: store.habits[indexPath.item]){
                self.collectionView.reloadData()
            }
            cell.onStateBtnClick = {
                self.collectionView.reloadData()
            }
            cell.editHabit = {
                let detailVC = HabitDetailsViewController()
                detailVC.habit = self.store.habits[indexPath.item]
                detailVC.numberOfHabit = indexPath.item
                self.navigationController?.pushViewController(detailVC, animated: true)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProgressCollectionViewCell.identifier, for: indexPath) as! ProgressCollectionViewCell
        
        header.setProgress(with: store.todayProgress)
        return header
    }
}

extension HabitsViewController: UICollectionViewDelegateFlowLayout {
    
    private var inset: CGFloat { return 1}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let width = (collectionView.bounds.width)
            return CGSize(width: width, height: 100)
        } else {
            let width = (collectionView.bounds.width)
            return CGSize(width: width, height: 160)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}
