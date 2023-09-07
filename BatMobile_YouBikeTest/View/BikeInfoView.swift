//
//  BikeInfoView.swift
//  BatMobile_YouBikeTest
//
//  Created by 尹周舶 on 2023/8/30.
//

import UIKit

class BikeInfoView: UIView {

    // logo
    let LogoImageView: UIImageView = {
        let LogoImageView = UIImageView()
        return LogoImageView
    }()
    
    // 站點資訊Label
    let bikeInfoLabel: UILabel = {
        let bikeInfoLabel = UILabel()
        return bikeInfoLabel
    }()
    
    // 搜尋站點textField
    let searchTextField: UITextField = {
        let searchTextField = UITextField()
        return searchTextField
    }()
    
    // 按鈕
    let searchButton: UIButton = {
        let searchButton = UIButton()
        return searchButton
    }()
    
    // 底線
    let separatorView: UIView = {
        let separatorView = UIView()
        return separatorView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLogoImageViewUI()
        setupLabelUI()
        setupTextFieldUI()
        setupSearchButtonUI()
        setupSeparatorViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLogoImageViewUI() {
        LogoImageView.image = UIImage(named: "ubike_logo")
        LogoImageView.contentMode = .scaleAspectFit
        addSubview(LogoImageView)
        LogoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //LogoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 55),
            LogoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            //LogoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            LogoImageView.widthAnchor.constraint(equalToConstant: 55),
            LogoImageView.heightAnchor.constraint(equalToConstant: 45),
            LogoImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0)
        ])
        
    }
    
    func setupLabelUI() {
        //bikeInfoLabel.backgroundColor = .black
        bikeInfoLabel.text = "站點資訊"
        bikeInfoLabel.textColor = UIColor(red: 180/255, green: 204/255, blue: 34/255, alpha: 1)
        //bikeInfoLabel.font = UIFont.systemFont(ofSize: 26)
        bikeInfoLabel.font = UIFont(name: "PingFangTC-Semibold", size: 26)
        
        addSubview(bikeInfoLabel)
        bikeInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bikeInfoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            bikeInfoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            bikeInfoLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            // bikeInfoLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 10),
            bikeInfoLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupTextFieldUI() {
        searchTextField.placeholder = "搜尋站點"
        searchTextField.borderStyle = .roundedRect
        searchTextField.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        addSubview(searchTextField)
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: bikeInfoLabel.bottomAnchor, constant: 10),
            searchTextField.leadingAnchor.constraint(equalTo: bikeInfoLabel.leadingAnchor, constant: 0),
            searchTextField.trailingAnchor.constraint(equalTo: bikeInfoLabel.trailingAnchor, constant: 0),
            searchTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupSearchButtonUI() {
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .lightGray
        addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: searchTextField.topAnchor, constant: 0),
            searchButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: -50),
            searchButton.widthAnchor.constraint(equalToConstant: 50),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSeparatorViewUI() {
        separatorView.backgroundColor = UIColor(red: 235/255, green: 234/255, blue: 235/255, alpha: 1)
        addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            separatorView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            separatorView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            separatorView.heightAnchor.constraint(equalToConstant: 1),

        ])
    }
    
    
}
