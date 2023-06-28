//
//  PopUPCollectionViewCell.swift
//  StarBrowserProj
//
//  Created by Volodimir Drozdov on 22.04.2023.
//

import UIKit

enum PopUpCellState {
	case addToFav
	case addToSavedTabs
	case savePDF
	case share
	case removeFromFav
	case delete
}

class PopUPCollectionViewCell: UICollectionViewCell {
	var state: PopUpCellState?

	@IBOutlet var placeholderView: UIView!
	@IBOutlet var titleImage: UIImageView!
	@IBOutlet var titleLabel: UILabel!
	override func awakeFromNib() {
		super.awakeFromNib()
		setup()
	}
	func config(model: Value) {
		titleLabel.text = model.label
		titleImage.image = UIImage(named: model.image)
		switch model.label {
		case "Add to favorites " :
			state = .addToFav
		case "Add to saved tabs" :
			state = .addToSavedTabs
		case "Save PDF" :
			state = .savePDF
		case "Share":
			state = .share
		case "Remove from favorites":
			state = .removeFromFav
		case "Delete":
			state = .delete
		default:
			return
		}
	}
	private func setup() {
		setupTitleLabel()
		setupPlaceholderView()
	}
	private func setupTitleLabel() {
		titleLabel.font = UIFont(name: "Onest-Regular", size: 14)
		titleLabel.textColor = .white
	}
	private func setupPlaceholderView() {
		placeholderView.backgroundColor = UIColor(named: "border")
	}
}
