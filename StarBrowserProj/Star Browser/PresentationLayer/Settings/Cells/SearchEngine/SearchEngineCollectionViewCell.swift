//
//  SearchEngineCollectionViewCell.swift
//  Browzer
//
//  Created by Volodimir Drozdov on 04.04.2023.
//

import UIKit

class SearchEngineCollectionViewCell: UICollectionViewCell {

    @IBOutlet var settingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    private func setup() {
        setupSettingLabel()
    }
    func config(model:Search) {
        settingLabel.text = model.title
    }
    private func setupSettingLabel() {
        settingLabel.textColor = UIColor(named: "border")
        settingLabel.font = UIFont(name: "Onest-Regular", size: 14)
    }
}
