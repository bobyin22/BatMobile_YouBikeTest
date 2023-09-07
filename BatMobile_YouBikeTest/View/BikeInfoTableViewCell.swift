//
//  BikeInfoTableViewCell.swift
//  BatMobile_YouBikeTest
//
//  Created by 尹周舶 on 2023/8/30.
//

import UIKit

class BikeInfoTableViewCell: UITableViewCell {

    var cityLabel = UILabel()
    var distLabel = UILabel()
    var stationLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCityLabelUI()
        setupDistLabelUI()
        setupStationLabelUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        distLabel.text = nil
        stationLabel.text = nil
    }
    
    func setupCityLabelUI() {
        contentView.addSubview(cityLabel)
        //cityLabel.backgroundColor = .orange
        cityLabel.text = "台北市"
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),   //25
            //cityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cityLabel.widthAnchor.constraint(equalToConstant: 60),
            cityLabel.heightAnchor.constraint(equalToConstant: 50),
            cityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func setupDistLabelUI() {
        contentView.addSubview(distLabel)
        //distLabel.backgroundColor = .systemPink
        distLabel.text = "xx區"
        distLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            distLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            distLabel.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor, constant: 20),
            //distLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            distLabel.widthAnchor.constraint(equalToConstant: 60),
            distLabel.heightAnchor.constraint(equalToConstant: 50),
            distLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func setupStationLabelUI() {
        stationLabel.numberOfLines = 0
        contentView.addSubview(stationLabel)
        //stationLabel.backgroundColor = .green
        stationLabel.text = "xx市xx市xx市xx市xx市xx市xx站"
        stationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stationLabel.leadingAnchor.constraint(equalTo: distLabel.trailingAnchor, constant: 20),
            stationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            //stationLabel.widthAnchor.constraint(equalToConstant: 50),
            //stationLabel.heightAnchor.constraint(equalToConstant: 50),
            stationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    
    func updateLayoutCenterForHeadUI() {
        
        cityLabel.backgroundColor = .red
        distLabel.backgroundColor = .blue
        stationLabel.backgroundColor = .yellow
        
        cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = false
        cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 55).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
