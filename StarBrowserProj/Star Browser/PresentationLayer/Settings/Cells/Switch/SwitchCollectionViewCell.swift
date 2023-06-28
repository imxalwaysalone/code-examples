import UIKit

class SwitchCollectionViewCell: UICollectionViewCell {
	var state: SettingsState = .settings
	@IBOutlet private var speedButton: UIButton!
	@IBOutlet private var settingButton: UIButton!
	@IBOutlet private var switchView: UIView!
	override func awakeFromNib() {
		super.awakeFromNib()
		setup()
	}
	weak var delegate : ChangeStateDelegate?
	let image = UIImage(named: "greenSettings")
	let speedImage = UIImage(named: "speed")
	let settingImage = UIImage(named: "settings")
	let greenSpeedImage = UIImage(named: "greenSpeed")
	let borderColor = UIColor.white

	@IBAction func switchButtonType(_ sender: UIButton) {
		switch sender {
		case speedButton:
			if state != .speed {
				setSpeedSelected()
				state = .speed
				delegate?.changeState()
			}

		case settingButton:
			if state != .settings {
				setSettingsSelected()
				state = .settings
				delegate?.changeState()
			}

		default:
			return
		}
	}

	private func setup() {
		setupSwitchView()
		setSettingsSelected()
	}

	private func setSettingsSelected() {
		guard let image = image, let speedImage = speedImage else { return }
		setSelectedTitle(for: settingButton, title: "Settings", image: image)
		setDefaultTitle(for: speedButton, title: "Speed", image: speedImage)
	}

	private func setSpeedSelected() {
		guard let greenSpeedImage = greenSpeedImage, let settingImage = settingImage else { return }

		setSelectedTitle(for: speedButton, title: "Speed", image: greenSpeedImage)
		setDefaultTitle(for: settingButton, title: "Settings", image: settingImage)
	}

	private func setDefaultTitle(for button: UIButton, title: String, image: UIImage) {
		let attributedTitle = NSAttributedString(
			string: title,
			attributes: [
				NSAttributedString.Key.foregroundColor:UIColor(named: "border")!,
				NSAttributedString.Key.backgroundColor:UIColor.clear,
				NSAttributedString.Key.font: UIFont(name: "Onest-Regular", size: 16.0)!])
		button.setAttributedTitle(attributedTitle, for: .normal)
		button.layer.borderWidth = 0
		button.setImage(image, for: .normal)
	}

	private func setSelectedTitle(for button: UIButton, title: String, image: UIImage) {
		let speedColor = UIColor.white
		let attributedTitle = NSAttributedString(
			string: title,
			attributes: [
				NSAttributedString.Key.foregroundColor:UIColor.white,
				NSAttributedString.Key.backgroundColor:UIColor.clear,
				NSAttributedString.Key.font :UIFont(name: "Onest-Regular", size: 16.0)!])
		button.setAttributedTitle(attributedTitle, for: .normal)
		button.layer.borderWidth = 1.0
		button.layer.borderColor = speedColor.cgColor
		button.layer.cornerRadius = 27
		button.setImage(image, for: .normal)
	}

	private func setupSwitchView() {
		switchView.backgroundColor = UIColor(named: "settingColor")
		switchView.layer.cornerRadius = 27
	}
}

protocol ChangeStateDelegate: AnyObject {
	func changeState()
}
