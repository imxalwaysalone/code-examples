import UIKit

struct FavouritesCollectionViewCellModel {
    var favLinkName: String
    var favLinkImageName: String
    var favLink: String
}

class FavouritesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var favouriteNameLabel: UILabel!
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var logoBackghoundView: UIView!
    @IBOutlet var cellBackgroundView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setupCell(model: FavouritesCollectionViewCellModel) {
        favouriteNameLabel.text = model.favLinkName
        logoImageView.image = UIImage(named: model.favLinkImageName)
        
        cellBackgroundView.backgroundColor = .clear
        favouriteNameLabel.font = UIFont(name: "Onest-Regular", size: 16)
        favouriteNameLabel.textColor = UIColor.white
        logoBackghoundView.layer.cornerRadius = logoBackghoundView.frame.height / 2
        logoBackghoundView.layer.borderWidth = 1
        logoBackghoundView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        logoBackghoundView.backgroundColor = .black.withAlphaComponent(0.4)
    }
}
