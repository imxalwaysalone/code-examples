//
//  StartCollectionViewCell.swift
//  Star Browser
//
//  Created by Volodimir Drozdov on 14.04.2023.
//

import UIKit

class StartCollectionViewCell: UICollectionViewCell {
	var delegate: StartTestDelegate?
    var state : TestState = .defolt
    @IBOutlet var startButton: UIButton!
    @IBOutlet var startView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
	@IBAction func startTestAction(_ sender: Any) {
        setTestState()
        delegate?.startTest(completion: {
            self.setDefaultState()
        })
	}
    
    func setDefaultState() {
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.white.cgColor
        startButton.layer.cornerRadius = 25
        startButton.backgroundColor = UIColor(named: "blackAlpha0.8")
        let attributtedText = NSAttributedString(
            string: "StartCollectionViewCell.startTest".localized(),
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont(name: "Onest-Regular", size: 16)
            ]
        )
        startButton.setAttributedTitle(attributtedText, for: .normal)
    }
    
    func setTestState() {
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor(named: "border")?.cgColor
        startButton.layer.cornerRadius = 25
        startButton.backgroundColor = UIColor(named: "blackAlpha0.8")
        let attributtedText = NSAttributedString(
            string: "StartCollectionViewCell.processingTest".localized(),
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor(named: "border"),
                NSAttributedString.Key.font: UIFont(name: "Onest-Regular", size: 16)
            ]
        )
        startButton.setAttributedTitle(attributtedText, for: .normal)
    }
    

	private func setup() {
        setupStartButton()
    }
    
    private func setupStartButton() {
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.white.cgColor
        startButton.layer.cornerRadius = 25
        startButton.backgroundColor = UIColor(named: "blackAlpha0.8")
        let attributtedText = NSAttributedString(
            string: "StartCollectionViewCell.startTest".localized(),
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont(name: "Onest-Regular", size: 16)
            ]
        )
        startButton.setAttributedTitle(attributtedText, for: .normal)
    }
}

protocol StartTestDelegate {
    func startTest(completion: @escaping () -> ())
}
