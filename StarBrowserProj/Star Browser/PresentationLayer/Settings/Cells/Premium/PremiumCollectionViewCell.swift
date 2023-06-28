//
//  PremiumCollectionViewCell.swift
//  Browzer
//
//  Created by Volodimir Drozdov on 04.04.2023.
//

import UIKit

protocol GoToPremiumFromSettingsProtocol: AnyObject {
	func goToPremium()
}

class PremiumCollectionViewCell: UICollectionViewCell {
	weak var delegate: GoToPremiumFromSettingsProtocol?
    @IBOutlet private var stackView: UIStackView!
    @IBOutlet private var containerView: UIView!
	@IBOutlet private var getPremiumButton: UIButton!
	@IBOutlet private var titleLabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()

        setup()
    }

	@IBAction func goToPremiumAction(_ sender: Any) {
		delegate?.goToPremium()
	}

	private func setup() {
//        setupPremiumView()
        setupContainerView()
        setupStackView()
        setupGetPremiumButton()
    }

    func config() {
		if UserDefaults.isPremium {
			getPremiumButton.isHidden = true
            setupPremiumLabel(text: "PremiumCollectionViewCell.config.premium".localized(), color: UIColor(named: "border") ?? UIColor.white)
		} else {
			getPremiumButton.isHidden = false
            setupPremiumLabel(text: "PremiumCollectionViewCell.config.premium.second".localized(), color: UIColor.white)
		}
    }

	private func setupPremiumLabel(text: String, color: UIColor) {
		titleLabel.text = text
		titleLabel.textColor = color
		titleLabel.font = UIFont(name: "Onest-Regular", size: 16.0)
	}
    private func setupContainerView() {
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.white.cgColor
    }
    private func setupStackView() {
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.white.cgColor
        stackView.layer.cornerRadius = 27
    }
    private func setupGetPremiumButton() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        let attributedTitle = NSAttributedString(
            string: "PremiumCollectionViewCell.premiumButton.getPremium".localized() ,
            attributes: [
                .paragraphStyle: paragraphStyle,
                .font: UIFont(name: "Onest-Regular", size: 16.0),
                .foregroundColor : UIColor.white.cgColor
            ]
        )
        getPremiumButton.setAttributedTitle(attributedTitle, for: .normal)
        getPremiumButton.layer.borderWidth = 1
        getPremiumButton.layer.borderColor = UIColor.white.cgColor
        getPremiumButton.layer.cornerRadius = 27
    }

//    private func setupPremiumView() {
//        let borderColor = UIColor(named: "border")
//		containerView.backgroundColor = .clear
//		containerView.layer.borderWidth = 1.0
//		containerView.layer.cornerRadius = 27
//		containerView.layer.borderColor = borderColor?.cgColor
//    }
}
