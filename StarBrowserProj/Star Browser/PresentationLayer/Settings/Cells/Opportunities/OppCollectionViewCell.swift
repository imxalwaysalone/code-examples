//
//  OppCollectionViewCell.swift
//  Browzer
//
//  Created by Volodimir Drozdov on 03.04.2023.
//

import UIKit

class OppCollectionViewCell: UICollectionViewCell {

    @IBAction func backButton(_ sender: Any) {
        delegate?.back()
    }
    @IBOutlet var oppButtonImage: UIButton!
	@IBOutlet private var oppLabel: UILabel!
    var delegate : BackStepDelegate?
	override func awakeFromNib() {
		super.awakeFromNib()
		setup()
	}

	private func setup() {
		setupOppLabel()
	}
	
	func config(model: Opp) {
		oppLabel.text = model.oppLabel

	}
	private func setupOppLabel() {
		oppLabel.font = UIFont(name: "Onest-Regular", size: 36)
		oppLabel.textColor = .white
	}
}

protocol BackStepDelegate: AnyObject {
    func back()
    
}
