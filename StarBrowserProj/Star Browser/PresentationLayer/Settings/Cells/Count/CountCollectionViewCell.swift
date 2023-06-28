import UIKit

protocol CountUpdateDelegate: AnyObject {
	func updateCountValues(model: Count)
}

class CountCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var uploadValueLabel: UILabel!
    @IBOutlet private var uploadLabel: UILabel!
    @IBOutlet private var downloadValueLabel: UILabel!
    @IBOutlet private var dowloadLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    private func setup() {
        setupUploadValueLabel()
		setupPingLabel()
        setupDownloadValueLabel()
        setupDownloadLabel()
        
    }
    func config(model: Count) {
        uploadValueLabel.text = String(model.pingValue)
        downloadValueLabel.text = String(model.downloadValue)
        dowloadLabel.text = model.download
        uploadLabel.text = model.ping
    }

    private func setupUploadValueLabel() {
        uploadValueLabel.font = UIFont(name: "Onest-Bold", size: 20)
		uploadValueLabel.textColor = UIColor.white
    }
    private func setupPingLabel() {
        uploadLabel.font = UIFont(name: "Onest-Regular", size: 14)
        uploadLabel.textColor = UIColor(named: "alpha0.5")
    }
    private func setupDownloadValueLabel() {
        downloadValueLabel.font = UIFont(name: "Onest-Bold", size: 20)
        downloadValueLabel.textColor = UIColor.white
    }
    private func setupDownloadLabel() {
        dowloadLabel.font = UIFont(name: "Onest-Regular", size: 14)
		dowloadLabel.textColor = UIColor(named: "alpha0.5")
    }
}

extension CountCollectionViewCell: CountUpdateDelegate {
	func updateCountValues(model: Count) {
		config(model: model)
	}
}
