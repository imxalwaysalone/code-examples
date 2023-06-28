//
//  ControlCollectionViewCell.swift
//  Browzer
//
//  Created by Volodimir Drozdov on 05.04.2023.
//

import UIKit

enum ControlType {
	case adBlock
	case blockScripts
	case blockCookies
}

class ControlCollectionViewCell: UICollectionViewCell {
	private var type: ControlType?
    @IBOutlet private var topConstraintView: NSLayoutConstraint!
    @IBOutlet private var placeholder: UIView!
    @IBOutlet private var controlLabel: UILabel!
    @IBOutlet private var conrolView: UIView!
	@IBOutlet private var switchControl: UISwitch!

	override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup()  {
        setupControlLabel()
        setupPlaceholder()
    }
	@IBAction func switchControlAction(_ sender: Any) {
	}

	func config(model:Control)  {
        controlLabel.text = model.text
		type = model.type
		switch UserDefaults.isPremium {
        case true:
			placeholder.isHidden = type != .blockCookies ? false : true

			if model.type == .adBlock {
                topConstraintView.constant = 50
            } else {
                topConstraintView.constant = 0
            }
			switchControl.isOn = true

        case false:
			switchControl.isOn = false
			switchControl.isUserInteractionEnabled = false
			if model.type == .adBlock {
				topConstraintView.constant = 50
			} else {
				topConstraintView.constant = 0
			}
			placeholder.isHidden = true
			controlLabel.textColor = UIColor(named: "border")

        }
        
    conrolView.updateConstraints()
}

private func setupControlLabel() {
    controlLabel.textColor = .white
    controlLabel.font = UIFont(name: "Onest-Regular", size: 17)
}
private func setupPlaceholder() {
    placeholder.backgroundColor = UIColor(named: "placeholder")
}
}
