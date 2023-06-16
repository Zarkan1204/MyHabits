//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Мой Macbook on 08.06.2023.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    
    private let store = HabitsStore.shared
    
    private let resultView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.backgroundColor = .red
        progressView.trackTintColor = .systemGray6
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private let resultNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next", size: 12)
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Все получится!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next", size: 12)
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        contentView.addSubview(resultView)
        resultView.addSubview(resultLabel)
        resultView.addSubview(resultNameLabel)
        resultView.addSubview(progressView)
    }
    
    func setProgress(with value: Float) {
        self.resultLabel.text = "\(Int(value * 100))%"
        self.progressView.setProgress(value, animated: true)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            resultView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            resultView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            resultView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            resultView.bottomAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 20),
            
            resultLabel.topAnchor.constraint(equalTo: resultView.topAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -10),
            resultLabel.heightAnchor.constraint(equalToConstant: 30),
            
            resultNameLabel.topAnchor.constraint(equalTo: resultView.topAnchor, constant: 10),
            resultNameLabel.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 10),
            resultNameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            progressView.topAnchor.constraint(equalTo: resultNameLabel.topAnchor, constant: 30),
            progressView.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 10),
            progressView.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -10),
        ])
    }
}
