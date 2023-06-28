import UIKit

enum PopUpState {
	case search
	case tab
	case favorite
}

class PopUpView: UIView {
	var popUpState: PopUpState = .search
	var request: URLRequest?

	let searchCellData = [
        Value(label: "PopUpView.searchCellData.favourites".localized(), image: "hearts"),
        Value(label:"PopUpView.searchCellData.saved".localized() , image: "savePopUp"),
        Value(label: "PopUpView.searchCellData.pdf".localized(), image: "download"),
        Value(label: "PopUpView.searchCellData.share".localized(), image: "share")
	]

	let tabCellData = [
        Value(label: "PopUpView.searchCellData.favourites".localized(), image: "hearts"),
        Value(label: "PopUpView.searchCellData.delete".localized(), image: "trashIcon")
	]

	let favCellData = [
        Value(label: "PopUpView.searchCellData.removeFromFav".localized(), image: "removeFromFav"),
        Value(label: "PopUpView.searchCellData.delete".localized(), image: "trashIcon")
	]

	@IBOutlet var popUpCollectionView: UICollectionView!

	required init?(coder:NSCoder) {
		super.init(coder: coder)
	}

	override init(frame:CGRect) {
		super.init(frame: frame)

		xibSetup(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
	}

	init(frame: CGRect, state: PopUpState) {
		super.init(frame: frame)

		xibSetup(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
		popUpState = state
	}

	func xibSetup(frame:CGRect) {
		let view = loadXib()
		view.frame = frame
		addSubview(view)
	}

	func loadXib() -> UIView {
		let bundle = Bundle(for: type(of: self))
		let nib = UINib(nibName: "PopUpView", bundle: bundle)
		let view = nib.instantiate(withOwner: self , options: nil).first as? UIView
		return view!
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		popUpCollectionView.register(UINib(nibName: "PopUPCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopUPCollectionViewCell")
		popUpCollectionView.dataSource = self
		popUpCollectionView.delegate = self
		setupCollectionView()
	}

	private func setupCollectionView() {
		popUpCollectionView.layer.cornerRadius = 16
		popUpCollectionView.layer.borderWidth = 1
		popUpCollectionView.layer.borderColor = UIColor.white.cgColor
		popUpCollectionView.backgroundColor = UIColor(named: "popUp")
	}
}

extension PopUpView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		var popUpCellData: [Value] = []
		switch popUpState {
		case .search:
			popUpCellData = searchCellData
		case .tab:
			popUpCellData = tabCellData
		case .favorite:
			popUpCellData = favCellData
		}

		return popUpCellData.count
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		CGSize(width: collectionView.bounds.width, height: 40)
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		var popUpCellData: [Value] = []
		switch popUpState {
		case .search:
			popUpCellData = searchCellData
		case .tab:
			popUpCellData = tabCellData
		case .favorite:
			popUpCellData = favCellData
		}

		let popUpCell = popUpCollectionView.dequeueReusableCell(withReuseIdentifier: "PopUPCollectionViewCell", for: indexPath) as? PopUPCollectionViewCell
		popUpCell?.config(model: popUpCellData[indexPath.row])

		return popUpCell ?? UICollectionViewCell()
	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath)
		guard let optionCell = cell as? PopUPCollectionViewCell, let request = request else { return }

		switch optionCell.state {
		case .addToFav:
			print("addToFav")

		case .addToSavedTabs:
			print("addToFav")

		case .savePDF:
			print("savePDF")

		case .share:
			print("share")

		case .removeFromFav:
			print("removeFromFav")

		case .delete:
			print("delete")

		case .none:
			print("none")
		}
	}
}
