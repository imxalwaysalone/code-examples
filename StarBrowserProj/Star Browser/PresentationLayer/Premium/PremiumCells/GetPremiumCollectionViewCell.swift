import UIKit

final class GetPremiumCollectionViewCell: UICollectionViewCell {
	weak var delegate: GetPremiumProtocol?
    @IBOutlet weak var premiumButton: UIButton!
    @IBOutlet weak var getPremiumLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
	@IBAction func backAction(_ sender: Any) {
		delegate?.back()
	}

	private func setup() {
        setupPremiumLabel()
    }
    
    func configure(model: Opp) {
        getPremiumLabel.text = model.oppLabel
    }

    private func setupPremiumLabel() {
        getPremiumLabel.font = UIFont(name: "Onest-Regular", size: 36)
        getPremiumLabel.textColor = .white
    }
}

