//
//  MenuView.swift
//  BatMobile_YouBikeTest
//
//  Created by 尹周舶 on 2023/8/30.
//

import UIKit

class MenuView: UIView {

    let useInfoButton: UIButton = {
        let useInfoButton = UIButton()
        return useInfoButton
    }()
    
    let payInfoButton: UIButton = {
        let payInfoButton = UIButton()
        return payInfoButton
    }()

    let stationInfoButton: UIButton = {
        let stationInfoButton = UIButton()
        return stationInfoButton
    }()
    
    let newsInfoButton: UIButton = {
        let newsInfoButton = UIButton()
        return newsInfoButton
    }()
    
    let activityInfoButton: UIButton = {
        let activityInfoButton = UIButton()
        return activityInfoButton
    }()
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        return loginButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUseInfoButtonUI()
        setupPayInfoButtonUI()
        setupStationInfoButtonUI()
        setupNewsInfoLabelUI()
        setupActivityInfoButtonUI()
        setupLoginButtonUI()
    }
    
    func setupUseInfoButtonUI() {
        useInfoButton.setTitle("使用說明", for: .normal)
        useInfoButton.setTitleColor(.white, for: .normal)
        useInfoButton.titleLabel?.font = UIFont(name: "PingFangTC-Semibold", size: 20)
        addSubview(useInfoButton)
        useInfoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            useInfoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            useInfoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            //useInfoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            useInfoButton.widthAnchor.constraint(equalToConstant: 80),
            useInfoButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupPayInfoButtonUI() {
        payInfoButton.setTitle("收費方式", for: .normal)
        payInfoButton.setTitleColor(.white, for: .normal)
        payInfoButton.titleLabel?.font = UIFont(name: "PingFangTC-Semibold", size: 20)
        addSubview(payInfoButton)
        payInfoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            payInfoButton.topAnchor.constraint(equalTo: useInfoButton.bottomAnchor, constant: 20),
            payInfoButton.leadingAnchor.constraint(equalTo: useInfoButton.leadingAnchor, constant: 0),
            payInfoButton.widthAnchor.constraint(equalToConstant: 80),
            payInfoButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupStationInfoButtonUI() {
        stationInfoButton.setTitle("站點資訊", for: .normal)
        stationInfoButton.setTitleColor(.white, for: .normal)
        stationInfoButton.titleLabel?.font = UIFont(name: "PingFangTC-Semibold", size: 20)
        addSubview(stationInfoButton)
        stationInfoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stationInfoButton.topAnchor.constraint(equalTo: payInfoButton.bottomAnchor, constant: 20),
            stationInfoButton.leadingAnchor.constraint(equalTo: useInfoButton.leadingAnchor, constant: 0),
            stationInfoButton.widthAnchor.constraint(equalToConstant: 80),
            stationInfoButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        stationInfoButton.isEnabled = true
        stationInfoButton.addTarget(self, action: #selector(stationBtnTouchDown), for: .touchDown)
        stationInfoButton.addTarget(self, action: #selector(stationBtnTouchUp), for: .touchUpInside)
    }
    
    @objc func stationBtnTouchDown() {
        stationInfoButton.setTitleColor(UIColor(red: 103/255, green: 117/255, blue: 16/255, alpha: 1), for: .normal)
    }
    
    @objc func stationBtnTouchUp() {
        stationInfoButton.setTitleColor(.white, for: .normal)
    }
    
    func setupNewsInfoLabelUI() {
        newsInfoButton.setTitle("最新消息", for: .normal)
        newsInfoButton.setTitleColor(.white, for: .normal)
        newsInfoButton.titleLabel?.font = UIFont(name: "PingFangTC-Semibold", size: 20)
        addSubview(newsInfoButton)
        newsInfoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsInfoButton.topAnchor.constraint(equalTo: stationInfoButton.bottomAnchor, constant: 20),
            newsInfoButton.leadingAnchor.constraint(equalTo: useInfoButton.leadingAnchor, constant: 0),
            newsInfoButton.widthAnchor.constraint(equalToConstant: 80),
            newsInfoButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupActivityInfoButtonUI() {
        activityInfoButton.setTitle("活動專區", for: .normal)
        activityInfoButton.setTitleColor(.white, for: .normal)
        activityInfoButton.titleLabel?.font = UIFont(name: "PingFangTC-Semibold", size: 20)
        addSubview(activityInfoButton)
        activityInfoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityInfoButton.topAnchor.constraint(equalTo: newsInfoButton.bottomAnchor, constant: 20),
            activityInfoButton.leadingAnchor.constraint(equalTo: useInfoButton.leadingAnchor, constant: 0),
            activityInfoButton.widthAnchor.constraint(equalToConstant: 80),
            activityInfoButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupLoginButtonUI() {
        loginButton.setTitle("登入", for: .normal)
        loginButton.backgroundColor = .white
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 25
        loginButton.setTitleColor(UIColor(red: 181/255, green: 204/255, blue: 34/255, alpha: 1), for: .normal)
        //loginButton.font = UIFont(name: "PingFangTC-Semibold", size: 20)
        addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: self.bottomAnchor, constant: -130),
            loginButton.leadingAnchor.constraint(equalTo: useInfoButton.leadingAnchor, constant: 0),
            loginButton.widthAnchor.constraint(equalToConstant: 90),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
