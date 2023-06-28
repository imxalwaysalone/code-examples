import UIKit

enum SettingsState {
	case settings
	case speed

}
enum TestState {
    case defolt
    case processing
}

class SettingsViewController: UIViewController {
	weak var speedometrUpdateDelegate: SpeedometrDelegate?
	weak var countUpdateDelegate: CountUpdateDelegate?

	var state: SettingsState = .settings {
		didSet {
			speedometrUpdateDelegate?.removeSpeedometr()
			settingCollectionView.reloadData()
		}
	}

	let oppCellData = [
        Opp(oppLabel:"SettinggsViewController.oppCellData".localized(), oppImage: "Search")
	]
	let premiumCellData = [
        Premium(label: "SettinggsViewController.premiumCellData".localized())
	]
	let searchCellData = [
        Search(title: "SettinggsViewController.searchCellData".localized())
	]
	let selectedCellData = [
        Selected(text: "SettinggsViewController.selectedCellData.google".localized(), engineValue: "https://www.google.ru/search?q="),
        Selected(text: "SettinggsViewController.selecredCellData.bing".localized() , engineValue: "https://www.bing.com/search?q="),
        Selected(text: "SettinggsViewController.selectedCellData.duck".localized(), engineValue: "https://duckduckgo.com/?q=")
	]
	let  controlCellData = [
        Control(text: "SettinggsViewController.controlCellData.adBlock".localized(), type: .adBlock),
        Control(text: "SettinggsViewController.controlCellData.scripts".localized(), type: .blockScripts),
        Control(text:"SettinggsViewController.controlCellData.cookies".localized() , type: .blockCookies)
	]
    var speedometrData = SpeedometrModel(title: "SettinggsViewController.speedometrData".localized(), titleValue: 0)
    var countCellData = Count(download: "SettinggsViewController.countCellData".localized(), ping: "SettinggsViewController.infoCellData.ping".localized(), downloadValue: 0, pingValue: 0)

	var infoCellData = [
        Info(name: "SettinggsViewController.infoCellData.connection".localized(), info: "SettinggsViewController.infoCellData.info".localized()),
        Info(name: "SettinggsViewController.infoCellData.ip".localized(), info: "SettinggsViewController.infoCellData.info".localized()),
        Info(name: "SettinggsViewController.infoCellData.provider".localized(), info: "SettinggsViewController.infoCellData.info".localized()),
        Info(name: "SettinggsViewController.infoCellData.location".localized(), info: "SettinggsViewController.infoCellData.info".localized())
	]
   

	@IBOutlet var settingCollectionView: UICollectionView!

	override func viewDidLoad() {
		super.viewDidLoad()
		settingCollectionView.register(UINib(nibName: "OppCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OppCollectionViewCell")
		settingCollectionView.register(UINib(nibName: "PremiumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PremiumCollectionViewCell")
		settingCollectionView.register(UINib(nibName: "SwitchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SwitchCollectionViewCell")
		settingCollectionView.register(UINib(nibName: "SearchEngineCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchEngineCollectionViewCell")
		settingCollectionView.register(UINib(nibName: "SelectedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectedCollectionViewCell")
		settingCollectionView.register(UINib(nibName: "ControlCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ControlCollectionViewCell")
		settingCollectionView.register(UINib(nibName: "CountCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CountCollectionViewCell")
		settingCollectionView.register(UINib(nibName: "InfoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InfoCollectionViewCell")
		settingCollectionView.register(UINib(nibName: "SpeedometrCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SpeedometrCollectionViewCell")
		settingCollectionView.register(UINib(nibName: "StartCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StartCollectionViewCell")
		settingCollectionView.delegate = self
		settingCollectionView.dataSource = self
        
        NetworkInfoService.shared.getInfo()
        infoCellData[0].info = NetworkInfoService.shared.connectionType
        infoCellData[1].info = NetworkInfoService.shared.currentIP
        infoCellData[2].info = NetworkInfoService.shared.providerName
        infoCellData[3].info = NetworkInfoService.shared.location
	}
}

extension SettingsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		switch state {
		case .settings:
			return oppCellData.count + 1 + premiumCellData.count + searchCellData.count + selectedCellData.count + controlCellData.count
		case .speed:
			return oppCellData.count + 4 + infoCellData.count
		}
	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		switch indexPath.row {
		case 4,5,6:
			let cell = collectionView.cellForItem(at: indexPath) as? SelectedCollectionViewCell
			for index in 4...6 {
				let cell = collectionView.cellForItem(at: IndexPath(row: index, section: 0 )) as? SelectedCollectionViewCell
				cell?.didTap(isSelectedCell: false)
			}
			cell?.didTap(isSelectedCell: true)
		default:
			break

		}
	}
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		switch state {
		case .speed:
			switch indexPath.row {
			case 0:
				return CGSize(width: collectionView.bounds.width, height: 46)
			case 1:
				return CGSize(width: collectionView.bounds.width, height: 90)
			case 2:
				return CGSize(width: collectionView.bounds.width, height: 290)
			case 3:
				return CGSize(width: collectionView.bounds.width, height: 62)
			case 4...7:
				return CGSize(width: collectionView.bounds.width, height: 30)
			case 8:
				return CGSize(width: collectionView.bounds.width, height: 76)
			default:
				return CGSize(width: collectionView.bounds.width, height: 60)
			}
		case .settings:
			switch indexPath.row {
			case 0:
				return CGSize(width: collectionView.bounds.width, height: 46)
			case 1:
				return CGSize(width: collectionView.bounds.width, height: 90)
			case 2:
				return CGSize(width: collectionView.bounds.width, height: 106)
			case 3:
				return CGSize(width: collectionView.bounds.width, height: 62)
			case 4...6:
				return CGSize(width: collectionView.bounds.width, height: 31)
			case 7:
				return CGSize(width: collectionView.bounds.width, height: 100)
			case 8...9:
				return CGSize(width: collectionView.bounds.width, height: 50)
			default:
				return CGSize(width: collectionView.bounds.width, height: 60)
			}
		}
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		switch state {
		case .settings:
			var cell = UICollectionViewCell()
			switch indexPath.row {
			case 0:
				let oppCell = settingCollectionView.dequeueReusableCell(withReuseIdentifier: "OppCollectionViewCell", for: indexPath) as? OppCollectionViewCell
				oppCell?.config(model: oppCellData[indexPath.row])
				oppCell?.delegate = self
				cell = oppCell ?? UICollectionViewCell()
			case 1:
				let switchCell = settingCollectionView.dequeueReusableCell(withReuseIdentifier: "SwitchCollectionViewCell", for: indexPath) as? SwitchCollectionViewCell
				switchCell?.delegate = self
				cell = switchCell ?? UICollectionViewCell()
			case 2:
				let premiumCell = settingCollectionView.dequeueReusableCell(withReuseIdentifier: "PremiumCollectionViewCell", for: indexPath) as? PremiumCollectionViewCell
				premiumCell?.config()
				premiumCell?.delegate = self
				cell = premiumCell ?? UICollectionViewCell()
			case 3:
				let searchCell = settingCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchEngineCollectionViewCell", for: indexPath) as? SearchEngineCollectionViewCell
				searchCell?.config(model: searchCellData[indexPath.row - 3])
				cell = searchCell ?? UICollectionViewCell()
			case 4...6:
				let selectedCell = settingCollectionView.dequeueReusableCell(withReuseIdentifier: "SelectedCollectionViewCell", for: indexPath)
				as? SelectedCollectionViewCell
				selectedCell?.config(model: selectedCellData[indexPath.row - 4])
				cell = selectedCell ?? UICollectionViewCell()
			case 7...9:
				let controlCell = settingCollectionView.dequeueReusableCell(withReuseIdentifier: "ControlCollectionViewCell", for: indexPath) as? ControlCollectionViewCell
				controlCell?.config(model: controlCellData[indexPath.row - 7])
				cell = controlCell ?? UICollectionViewCell()
			default:
				break
			}

			return cell

		case .speed:
			var cell = UICollectionViewCell()
			switch indexPath.row {
			case 0:
				let oppCell = settingCollectionView.dequeueReusableCell(withReuseIdentifier: "OppCollectionViewCell", for: indexPath) as? OppCollectionViewCell
				oppCell?.config(model: oppCellData[indexPath.row])
				oppCell?.delegate = self
				cell = oppCell ?? UICollectionViewCell()
			case 1:
				let switchCell = settingCollectionView.dequeueReusableCell(withReuseIdentifier: "SwitchCollectionViewCell", for: indexPath) as? SwitchCollectionViewCell
				switchCell?.delegate = self
				cell = switchCell ?? UICollectionViewCell()
			case 2:
				let speedometrCell = settingCollectionView.dequeueReusableCell(withReuseIdentifier: "SpeedometrCollectionViewCell", for: indexPath) as? SpeedometrCollectionViewCell
				speedometrCell?.config(model: speedometrData)
				speedometrUpdateDelegate = speedometrCell
				cell = speedometrCell ?? UICollectionViewCell()
			case 3:
				let countCell = settingCollectionView.dequeueReusableCell(withReuseIdentifier: "CountCollectionViewCell", for: indexPath) as? CountCollectionViewCell
				countCell?.config(model: countCellData)
				countUpdateDelegate = countCell
				cell = countCell ?? UICollectionViewCell()
			case 4...7:
				let infoCell = settingCollectionView.dequeueReusableCell(withReuseIdentifier: "InfoCollectionViewCell", for: indexPath) as? InfoCollectionViewCell
				infoCell?.config(model: infoCellData[indexPath.row - 4], isLastCell: indexPath.row == 7)
				cell = infoCell ?? UICollectionViewCell()
			case 8:
				let startCell = settingCollectionView.dequeueReusableCell(withReuseIdentifier: "StartCollectionViewCell", for: indexPath) as? StartCollectionViewCell
				startCell?.delegate = self
				cell = startCell ?? UICollectionViewCell()
			default:
				break
			}

			return cell
		}
	}
}

extension SettingsViewController: BackStepDelegate {
	func back() {
		navigationController?.popViewController(animated: true)
	}
}

extension SettingsViewController: ChangeStateDelegate {
	func changeState() {
		if state == .settings {
			state = .speed
		}
		else {
			state = .settings
		}
	}
}

extension SettingsViewController: GoToPremiumFromSettingsProtocol {
	func goToPremium() {
		let premiumVC = PremiumViewController()
		navigationController?.pushViewController(premiumVC, animated: true)
	}
}

extension SettingsViewController: StartTestDelegate {
    func startTest(completion: @escaping () -> ()) {
		let speedTestGroup = DispatchGroup()
		speedTestGroup.enter()
			MySpeedTest.startFullTest {
				print("TestFinished")
				speedTestGroup.leave()
			}
		speedTestGroup.notify(queue: DispatchQueue.main) { [weak self] in
			guard let self = self else { return }

			self.speedometrData = SpeedometrModel(title: "Download", titleValue: Double(UserDefaults.downloadSpeed))
			self.countCellData = Count(
                download: "SettinggsViewController.countCellData".localized(),
                ping: "SettinggsViewController.infoCellData.ping".localized(),
				downloadValue: Double(UserDefaults.downloadSpeed),
				pingValue: Double(UserDefaults.ping)
			)
			self.speedometrUpdateDelegate?.startTest(model: self.speedometrData)
			self.countUpdateDelegate?.updateCountValues(model: self.countCellData)
            MySpeedTest.resetData()
            completion()
		}
	}
}
