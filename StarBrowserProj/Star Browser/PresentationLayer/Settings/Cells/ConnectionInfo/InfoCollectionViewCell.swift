//
//  InfoCollectionViewCell.swift
//  Browzer
//
//  Created by Volodimir Drozdov on 10.04.2023.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var placeholderView: UIView!
    @IBOutlet private var infoLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

		setup()
    }
    private func setup() {
        setupInfoLabel()
        setupNameLabel()
        setupPlaceholderView()
    }
    func config(model:Info, isLastCell:Bool) {
        infoLabel.text = model.info
        nameLabel.text = model.name
        if isLastCell{
            placeholderView.isHidden = true
        }
    }
    private func setupInfoLabel() {
        infoLabel.textColor = .white
        infoLabel.font = UIFont(name: "Onest-Regular", size: 17)
    }
    private func setupNameLabel() {
        nameLabel.textColor = UIColor(named: "alpha0.5")
        nameLabel.font = UIFont(name: "Onest-Regular", size: 14)
    }
    private func setupPlaceholderView() {
        placeholderView.backgroundColor = UIColor(named: "alpha0.1")
    }
}
