import UIKit

struct RateCollectionViewCellModel {
	var rateTerm: String
	var ratePrice: String
}

class RateCollectionViewCell: UICollectionViewCell {
	@IBOutlet var backgroundImageView: UIImageView!
	@IBOutlet private var rateTermLabel: UILabel!
	@IBOutlet private var priceLabel: UILabel!
    @IBOutlet private var choiseImageView: UIImageView!

    override func awakeFromNib() {
		super.awakeFromNib()

	}
	func setupCell(
		model: RateCollectionViewCellModel,
		isChosen: Bool,
		cellHeight: CGFloat
	) {
        choiseImageView.image = UIImage(named: "whiteOuterCircle")
		rateTermLabel.text = model.rateTerm
		priceLabel.text = "$" + model.ratePrice
		backgroundImageView.layer.cornerRadius = cellHeight / 2
		handleTap(isChosen: isChosen)
	}

	func handleTap(isChosen: Bool) {
		if isChosen {
            choiseImageView.image = UIImage(named: "greenCircle")
            backgroundImageView.backgroundColor = UIColor.black
            backgroundImageView.alpha = 0.7
		} else {
            choiseImageView.image = UIImage(named: "whiteOuterCircle")
			backgroundImageView.backgroundColor = UIColor.black
			backgroundImageView.alpha = 0.5
		}
	}
}
