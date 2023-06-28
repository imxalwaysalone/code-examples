//
//  SelectedCollectionViewCell.swift
//  Browzer
//
//  Created by Volodimir Drozdov on 05.04.2023.
//

import UIKit

class SelectedCollectionViewCell: UICollectionViewCell {
	var engineValue = ""
    @IBOutlet private var selectedLabel: UILabel!
	@IBOutlet private var selectedImage: UIImageView!
	override func awakeFromNib() {
		super.awakeFromNib()

		setup()
	}
	private func setup() {
		setupSelectedLabel()
	}

	func config(model: Selected) {
		selectedLabel.text = model.text
		engineValue = model.engineValue
		if UserDefaults.currentServer == model.engineValue {
			selectedImage.image = UIImage(named: "greenCircle")
		} else {
			selectedImage.image = UIImage(named: "Ellipse")
		}
	}

	func didTap (isSelectedCell:Bool) {
        if isSelectedCell {
			selectedImage.image = UIImage(named: "greenCircle")
			UserDefaults.currentServer = engineValue
        }
        else {
            selectedImage.image = UIImage(named: "Ellipse")
        }
    }
    private func setupSelectedLabel() {
        selectedLabel.font = UIFont(name: "Onest-Regular", size: 17)
        selectedLabel.textColor = .white
    }
}
