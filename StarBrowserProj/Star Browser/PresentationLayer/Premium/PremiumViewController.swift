import UIKit

final class PremiumViewController: UIViewController {
    @IBOutlet private weak var premiumCollectionView: UICollectionView!
    @IBOutlet var getPremiumView: UIView!
    @IBOutlet var getPremiumLabel: UILabel!
    let getPremiumCell = [
        Opp(oppLabel: "PremiumViewController.oppLabel".localized(), oppImage: "Search")
    ]
    private let rateCollectionModelArray: [RateCollectionViewCellModel] = [
        RateCollectionViewCellModel(
            rateTerm: "PremiumViewController.rateTerm.weak".localized(),
            ratePrice: "PremiumViewController.retePrice.weak".localized()
        ),
        RateCollectionViewCellModel(
            rateTerm: "PremiumViewController.reteTerm.month".localized(),
            ratePrice: "PremiumViewController.retePrice.month".localized()
        ),
        RateCollectionViewCellModel(
            rateTerm: "PremiumViewController.reteTerm.year".localized(),
            ratePrice: "PremiumViewController.retePrice.year".localized()
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        getPremiumView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        getPremiumView.layer.borderWidth = 1
        getPremiumView.layer.cornerRadius = getPremiumView.frame.height / 2
        getPremiumView.backgroundColor = .black.withAlphaComponent(0.8)
        getPremiumLabel.font = UIFont(name: "Onest-Medium", size: 16)
        premiumCollectionView.register(UINib(nibName: "GetPremiumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GetPremiumCollectionViewCell")
        premiumCollectionView.register(UINib(nibName: "StarPremiumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StarPremiumCollectionViewCell")
        premiumCollectionView.register(UINib(nibName: "RateCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RateCollectionViewCell")
        premiumCollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        premiumCollectionView.delegate = self
        premiumCollectionView.dataSource = self
    }
}

extension PremiumViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        getPremiumCell.count + 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 3...5:
            for index in 3...5 {
                let cell = collectionView.cellForItem(
                    at: IndexPath(row: index, section: 0)
                ) as! RateCollectionViewCell

                cell.handleTap(isChosen: false)
            }

            let cell = collectionView.cellForItem(
                at: indexPath
            ) as! RateCollectionViewCell

            cell.handleTap(isChosen: true)

        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        switch indexPath.row {
        case 0:
            let premiumCell = premiumCollectionView.dequeueReusableCell(withReuseIdentifier: "GetPremiumCollectionViewCell", for: indexPath) as? GetPremiumCollectionViewCell
            premiumCell?.configure(model: getPremiumCell[indexPath.row])
			premiumCell?.delegate = self
            cell = premiumCell ?? UICollectionViewCell()
        case 1:
            let premiumCell = premiumCollectionView.dequeueReusableCell(withReuseIdentifier: "StarPremiumCollectionViewCell", for: indexPath) as? StarPremiumCollectionViewCell
            cell = premiumCell ?? UICollectionViewCell()
        case 2:
            let premiumCell = premiumCollectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as? CustomCollectionViewCell
            cell = premiumCell ?? UICollectionViewCell()
        case 3...5:
            let cell = premiumCollectionView.dequeueReusableCell(
                withReuseIdentifier: "RateCollectionViewCell",
                for: indexPath
            ) as! RateCollectionViewCell

            cell.setupCell(
                model: rateCollectionModelArray[indexPath.row - 3],
                isChosen: indexPath.row == 4,
                cellHeight: cell.frame.height
            )

            return cell
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
            return CGSize(width: collectionView.bounds.width, height: 46)
        case 1:
            return CGSize(width: collectionView.bounds.width, height: 280)
        case 2:
            return CGSize(width: collectionView.bounds.width, height: 60)
        case 3...5:
            return CGSize(width: collectionView.bounds.width, height: 50)
        default:
            return CGSize(width: collectionView.bounds.width, height: 50)
        }
        
    }
}

extension PremiumViewController: GetPremiumProtocol {
	func back() {
		navigationController?.popViewController(animated: true)
	}
}

protocol GetPremiumProtocol: AnyObject {
	func back()
}
