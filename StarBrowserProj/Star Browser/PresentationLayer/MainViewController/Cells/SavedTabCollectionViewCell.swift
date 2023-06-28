import UIKit

struct SavedTabCollectionViewCellModel {
    var tabLink: String
    var titleName: String
    var tabLinkName: String
    var tabImageName: String
    var tabLogoImageName: String
    var tabDescriptionName: String
}

class SavedTabCollectionViewCell: UICollectionViewCell {
    var commercialPopUp: PopUpView!
    
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet var tabDescriptionLabel: UILabel!
    @IBOutlet var titleNameLabel: UILabel!
    @IBOutlet var tabNameLabel: UILabel!
    @IBOutlet var tabLogoImageView: UIImageView!
    @IBOutlet var cellBackgroundView: UIView!
    @IBOutlet var tabImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func btnTapped(_ sender: Any) {
		self.commercialPopUp = PopUpView(frame: CGRect(x: 0, y: 0, width: 220, height: 80), state: .tab)
//        infoButton.addTarget(self, action: #selector(closeBtn), for: .touchUpInside)
        self.cellBackgroundView.addSubview(commercialPopUp)
    }

    @objc func closeBtn(){
        self.commercialPopUp.removeFromSuperview()
    }

    func setupCell(model: SavedTabCollectionViewCellModel) {
        cellBackgroundView.layer.cornerRadius = 16
        cellBackgroundView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        cellBackgroundView.layer.borderWidth = 1
        tabDescriptionLabel.text = model.tabDescriptionName
        titleNameLabel.text = model.titleName
        tabNameLabel.text = model.tabLinkName
        tabLogoImageView.image = UIImage(named: model.tabLogoImageName)
        tabImageView.image = UIImage(named: model.tabImageName)
    }
}
