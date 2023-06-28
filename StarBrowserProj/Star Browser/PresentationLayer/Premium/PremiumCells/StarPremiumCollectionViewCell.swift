import UIKit

class StarPremiumCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var gradientView: UIView!
    @IBOutlet private var reliableProtectionLabel: UILabel!
    @IBOutlet private var starsImageView: UIImageView!
    @IBOutlet private var saveLabel: UILabel!
    @IBOutlet private var keepingSecretsLabel: UILabel!
    @IBOutlet private var lightAndFastLabel: UILabel!
    @IBOutlet private var starlightBrowserLabel: UILabel!
    @IBOutlet private var starlightButtonView: UIView!
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor(red: 9 / 255, green: 82 / 255, blue: 9 / 255, alpha: 1),
            UIColor(red: 6 / 255, green: 128 / 255, blue: 6 / 255, alpha: 1)
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        return gradient
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }
    
    private func setupCell() {
        starsImageView.image = UIImage(named: "stars")
        starlightButtonView.layer.cornerRadius = starlightButtonView.frame.height / 2
        starlightButtonView.layer.borderWidth = 1
        starlightButtonView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        reliableProtectionLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 30)
        saveLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 15)
        keepingSecretsLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 33)
        lightAndFastLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 15)
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 0, y: 1)
//        gradientView.layer.addSubview(gradient)
        reliableProtectionLabel.font = UIFont(name: "Onest-Light", size: 15)
        saveLabel.font = UIFont(name: "Onest-Light", size: 15)
        keepingSecretsLabel.font = UIFont(name: "Onest-Light", size: 15)
        lightAndFastLabel.font = UIFont(name: "Onest-Light", size: 15)
        starlightBrowserLabel.font = UIFont(name: "Onest-Light", size: 24)
        reliableProtectionLabel.textColor = .white
        saveLabel.textColor = .white
        keepingSecretsLabel.textColor = .white
        lightAndFastLabel.textColor = .white
    }
}
