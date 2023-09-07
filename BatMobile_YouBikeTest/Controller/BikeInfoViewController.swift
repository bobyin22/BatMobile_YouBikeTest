//
//  BikeInfoViewController.swift
//  BatMobile_YouBikeTest
//
//  Created by 尹周舶 on 2023/8/30.
//

import UIKit


class BikeInfoViewController: UIViewController {

    let apiManager = APIManager()
    let bikeInfoView = BikeInfoView()
    let menuView = MenuView()
    var menuButtonItem = UIBarButtonItem()
    var logoButtonItem = UIBarButtonItem()
    let bikeInfoTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBikeInfoView()
        setupNavigation()
        setupBikeTableView()
        
        bikeInfoTableView.register(BikeInfoTableViewCell.self, forCellReuseIdentifier: "BikeInfoTableViewCell")
        bikeInfoTableView.delegate = self
        bikeInfoTableView.dataSource = self
        
        bikeInfoTableView.rowHeight = UITableView.automaticDimension
        bikeInfoTableView.estimatedRowHeight = UITableView.automaticDimension
        
        apiManager.delegate = self
        apiManager.fetchAPI()
    }
    

    func setupBikeInfoView() {
        view.addSubview(bikeInfoView)
        bikeInfoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bikeInfoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            bikeInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bikeInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bikeInfoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
        bikeInfoView.searchButton.addTarget(self, action: #selector(clickSearchBtn), for: .touchUpInside)
    }
    
    @objc func clickSearchBtn() {
        guard let inputText = bikeInfoView.searchTextField.text else { return }
        apiManager.textFieldString = inputText
        apiManager.searchAPI()
    }
    
    
    // 建立上方NavBar的樣式
    func setupNavigation() {
        menuButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"),
                               style: .plain,
                               target: self,
                               action: #selector(navToMenuView))
        
        menuButtonItem.tintColor = UIColor(red: 181/255, green: 204/255, blue: 32/255, alpha: 1)
        
        navigationItem.rightBarButtonItems = [menuButtonItem]
    }
    
    
    // icon三條線實際點擊會改成叉叉並且滑出頁面
    @objc func navToMenuView() {
        menuView.backgroundColor = UIColor(red: 181/255, green: 204/255, blue: 34/255, alpha: 1)
        view.addSubview(menuView)
        menuView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),    //20
            menuView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            menuView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
        menuView.stationInfoButton.addTarget(self, action: #selector(clickStationBtnNavToMainVC), for: .touchUpInside)
        
        changeNavIconToDelete()
    }
    
    @objc func clickStationBtnNavToMainVC() {
        setupNavigation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.menuView.removeFromSuperview()
        }
    }

    
    // 點擊NavBar後，icon改叉叉
    func changeNavIconToDelete() {
        menuButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                               style: .plain,
                               target: self,
                               action: #selector(navToMainView))
        
        menuButtonItem.tintColor = UIColor(red: 181/255, green: 204/255, blue: 32/255, alpha: 1)
        
        navigationItem.rightBarButtonItems = [menuButtonItem]
    }
    
    // icon叉叉實際點擊會再轉回原本nav
    @objc func navToMainView() {
        setupNavigation()
        menuView.removeFromSuperview()
    }
    
    
    func setupBikeTableView() {
        view.addSubview(bikeInfoTableView)
        bikeInfoTableView.layer.borderWidth = 1.0
        bikeInfoTableView.layer.cornerRadius = 10
        bikeInfoTableView.layer.borderColor = UIColor(red: 225/255, green: 224/255, blue: 224/255, alpha: 1).cgColor
        bikeInfoTableView.separatorStyle = .none
        
        bikeInfoTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bikeInfoTableView.topAnchor.constraint(equalTo: bikeInfoView.searchTextField.bottomAnchor, constant: 20),
            bikeInfoTableView.leadingAnchor.constraint(equalTo: bikeInfoView.searchTextField.leadingAnchor, constant: 0),
            bikeInfoTableView.trailingAnchor.constraint(equalTo: bikeInfoView.searchTextField.trailingAnchor, constant: 0),
            bikeInfoTableView.bottomAnchor.constraint(equalTo: bikeInfoView.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
}

//MARK: TableView的DataSource
extension BikeInfoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiManager.items.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        
        headerView.backgroundColor = UIColor(red: 181/255, green: 204/255, blue: 32/255, alpha: 1)
        headerView.frame = CGRect(x: 0, y: 0, width: 353, height: 40) // 设置视图的大小

        let titleLabel = UILabel()
        titleLabel.text = "縣市         區域              站點名稱"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])

        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BikeInfoTableViewCell", for: indexPath) as? BikeInfoTableViewCell
                
        else { return UITableViewCell() }
        
        cell.distLabel.text = nil
        cell.stationLabel.text = nil
        cell.cityLabel.text = "台北市"
        cell.distLabel.text = apiManager.items[indexPath.row].sarea
        cell.stationLabel.text = apiManager.items[indexPath.row].sna

        if indexPath.row % 2 != 0 {
            cell.contentView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 245/255, alpha: 1)
        } else {
            cell.contentView.backgroundColor = .clear
        }

        return cell
    }
}

//MARK: TableView的Delegate
extension BikeInfoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        bikeInfoTableView.deselectRow(at: indexPath, animated: true)
    }
}


//MARK: 遵從自定義的Protocol
extension BikeInfoViewController: APIManagerDelegate {
    func reloadData() {
        self.bikeInfoTableView.reloadData()
    }
}
