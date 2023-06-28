import UIKit
class MainViewController: UIViewController {
    // subscribe?
    private var getPremium = false
	private var searchText = ""
    // Labels
    @IBOutlet private var savedTabsLabel: UILabel!
    @IBOutlet private var offerNameLabel: UILabel!
    @IBOutlet private var getPremiumLabel: UILabel!
    @IBOutlet private var noSavedTabsLabel: UILabel!
    @IBOutlet private var noFavouritesLabel: UILabel!
    // Views
    @IBOutlet private var searchBackgrounView: UIView!
	@IBOutlet private var navigatePremiumButton: UIButton!
	@IBOutlet private var getPremiumButtonView: UIView!
    @IBOutlet private var premiumBackgroundView: UIView!
    // TField / PageControll / ScrollView
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var searchTextField: UITextField!
    @IBOutlet private var favouritesPageControl: UIPageControl!
    // Collections
    @IBOutlet private var savedTabsCollectionView: UICollectionView!
    @IBOutlet private var favouritesCollectionView: UICollectionView!
    // Constraints

    @IBOutlet private var mainCollectionTopConstraint: NSLayoutConstraint!
    
    private let favouritesCollectionModelArray: [FavouritesCollectionViewCellModel] = [
        FavouritesCollectionViewCellModel(
            favLinkName: "apple.com",
            favLinkImageName: "apple",
            favLink: ""
        ),
        FavouritesCollectionViewCellModel(
            favLinkName: "web.telegram.org",
            favLinkImageName: "telegram",
            favLink: ""
        ),
        FavouritesCollectionViewCellModel(
            favLinkName: "pinterest",
            favLinkImageName: "pinterest",
            favLink: ""
        ),
        FavouritesCollectionViewCellModel(
            favLinkName: "web.telegram.org",
            favLinkImageName: "telegram",
            favLink: ""
        ),

        FavouritesCollectionViewCellModel(
            favLinkName: "pinterest",
            favLinkImageName: "pinterest",
            favLink: ""
        )
    ]
    private let savedTabsCollectionModelArray: [SavedTabCollectionViewCellModel] = [
        SavedTabCollectionViewCellModel(
            tabLink: "",
            titleName: "MainViewController.titleName".localized(),
            tabLinkName: "MainMainViewController.tabLinkName".localized(),
            tabImageName: "savedTab",
            tabLogoImageName: "wiki",
            tabDescriptionName: "MainMainViewController.tabDescriptionName".localized()
        ),
        SavedTabCollectionViewCellModel(
            tabLink: "",
            titleName: "MainViewController.titleName".localized(),
            tabLinkName: "MainMainViewController.tabLinkName".localized(),
            tabImageName: "savedTab",
            tabLogoImageName: "wiki",
            tabDescriptionName: "MainMainViewController.tabDescriptionName".localized()
        ),
        SavedTabCollectionViewCellModel(
            tabLink: "",
            titleName: "MainViewController.titleName".localized(),
            tabLinkName: "MainMainViewController.tabLinkName".localized(),
            tabImageName: "savedTab",
            tabLogoImageName: "wiki",
            tabDescriptionName: "MainMainViewController.tabDescriptionName".localized()
        ),
        SavedTabCollectionViewCellModel(
            tabLink: "",
            titleName: "MainViewController.titleName".localized(),
            tabLinkName: "MainMainViewController.tabLinkName".localized(),
            tabImageName: "savedTab",
            tabLogoImageName: "wiki",
            tabDescriptionName: "MainMainViewController.tabDescriptionName".localized()
        )
    ]

	@IBAction func goToPremiumAction(_ sender: Any) {
		let premiumVC = PremiumViewController()
		navigationController?.pushViewController(premiumVC, animated: true)
	}

	override func viewDidLoad() {
        super.viewDidLoad()
		
        setupUI()
        setupFonts()
        setupContent()
        setupCollections()
        setupFavouritesPageControl()
        let onboardingShown = UserDefaults.standard.bool(forKey: "kOnboardingShownKey")
        if !onboardingShown {
            let onboardingViewController = OnboardingViewController()
            onboardingViewController.modalPresentationStyle = .fullScreen
            self.present(onboardingViewController, animated: true , completion: nil)
        }
    }

    @IBAction func pageControlSelected(_ sender: Any) {
        favouritesCollectionView.scrollToItem(
			at: IndexPath(item: favouritesPageControl.currentPage * 3, section: 0), at: UICollectionView.ScrollPosition.left, animated: true)
        
    }
    @IBAction func settingButton(_ sender : Any) {
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func searchButton(_ sender: Any) {
		goToSearch()
    }

	private func goToSearch() {
		var request: URLRequest?
		if let url = URL(string: searchText), UIApplication.shared.canOpenURL(url) {
			request = URLRequest(url: url)
		} else {
			let searchQuery = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			let searchURLString = "\(UserDefaults.currentServer)\(searchQuery ?? "")"
			if let searchURL = URL(string: searchURLString) {
				request = URLRequest(url: searchURL)
			}
		}

		let searchVC = SearchViewController()
		searchVC.request = request

		navigationController?.pushViewController(searchVC, animated: true)
	}
}

// MARK: SetupUI
extension MainViewController {
    private func setupFonts() {
        noFavouritesLabel.font = UIFont(name: "Onest-Light", size: 16)
        savedTabsLabel.font = UIFont(name: "Onest-Light", size: 16)
        getPremiumLabel.font = UIFont(name: "Onest-Regular", size: 16)
        offerNameLabel.font = UIFont(name: "Onest-Regular", size: 16)
    }
    
    private func setupFavouritesPageControl() {
        let numberOfPages: Double = Double(favouritesCollectionModelArray.count) / Double(3)
        favouritesPageControl.numberOfPages = Int(ceil(numberOfPages))
        favouritesPageControl.currentPage = 0
    }
    
    private func setupUI() {
        scrollView.contentSize = CGSize(width: view.frame.width, height:  500 + CGFloat(savedTabsCollectionModelArray.count * 125))
        self.navigationController?.navigationBar.isHidden = true
        noSavedTabsLabel.isHidden = true
        noFavouritesLabel.isHidden = true
        searchBackgrounView.backgroundColor = .black.withAlphaComponent(0.7)
        searchBackgrounView.layer.cornerRadius = searchBackgrounView.frame.height / 2
        searchBackgrounView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        searchBackgrounView.layer.borderWidth = 1
        getPremiumButtonView.layer.cornerRadius = getPremiumButtonView.frame.height / 2
        premiumBackgroundView.layer.cornerRadius = premiumBackgroundView.frame.height / 2
        getPremiumButtonView.layer.borderWidth = 1
        premiumBackgroundView.layer.borderWidth = 1
        getPremiumButtonView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        premiumBackgroundView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        premiumBackgroundView.backgroundColor = .black.withAlphaComponent(0.4)
		searchTextField.attributedPlaceholder = NSAttributedString(
            string: "MainMainViewController.search".localized(),
			attributes: [
				.font: UIFont(name: "Onest-Regular", size: 16),
				.foregroundColor: UIColor.white
			])

		searchTextField.delegate = self
    }
    
    private func setupContent() {
        // favourites.isEmpty?
        if favouritesCollectionModelArray.isEmpty {
            noFavouritesLabel.isHidden = false
            favouritesCollectionView.isHidden = true
        }
        // savedTab.isEmpty?
        if savedTabsCollectionModelArray.isEmpty {
            noSavedTabsLabel.isHidden = false
            savedTabsCollectionView.isHidden = true
        }
        // gotSubscription?
		if UserDefaults.isPremium {
            premiumBackgroundView.isHidden = true
            mainCollectionTopConstraint.constant = 10
        }
        else {
            premiumBackgroundView.isHidden = false
            mainCollectionTopConstraint.constant = 120
        }
    }
}

// MARK: Setup Collections

extension MainViewController {
    private func setupCollections() {
        savedTabsCollectionView.backgroundColor = .clear
        savedTabsCollectionView.dataSource = self
        savedTabsCollectionView.delegate = self
        savedTabsCollectionView.register(UINib(nibName: "SavedTabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SavedTabCollectionViewCell")
        savedTabsCollectionView.isScrollEnabled = false
        
        favouritesCollectionView.backgroundColor = .clear
        favouritesCollectionView.dataSource = self
        favouritesCollectionView.delegate = self
        favouritesCollectionView.register(UINib(nibName: "FavouritesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FavouritesCollectionViewCell")
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == favouritesCollectionView {
            return 0
        } else { return 12 }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		favouritesPageControl.currentPage = indexPath.item
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case favouritesCollectionView: return favouritesCollectionModelArray.count
        default: return savedTabsCollectionModelArray.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case favouritesCollectionView:
            switch indexPath.item {
            case 0..<favouritesCollectionModelArray.count: let cell = favouritesCollectionView.dequeueReusableCell(withReuseIdentifier: "FavouritesCollectionViewCell", for: indexPath) as! FavouritesCollectionViewCell
                cell.setupCell(model: favouritesCollectionModelArray[indexPath.item])
                return cell

            default:
                return UICollectionViewCell()
            }
        case savedTabsCollectionView:
            switch indexPath.item {
            case 0..<savedTabsCollectionModelArray.count: let cell = savedTabsCollectionView.dequeueReusableCell(withReuseIdentifier: "SavedTabCollectionViewCell", for: indexPath) as! SavedTabCollectionViewCell
                cell.setupCell(model: savedTabsCollectionModelArray[indexPath.item])
                return cell

            default:
                return UICollectionViewCell()
            }
        default: return UICollectionViewCell()
        }
        
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        switch collectionView {
        case favouritesCollectionView:
            switch indexPath.item {
            default:
                return CGSize(width: view.frame.width / 3.2, height: 109)
            }
        default:
            switch indexPath.item {
            default:
                return CGSize(width: view.frame.width, height: 114)
            }
        }
    }
}

extension MainViewController: UITextFieldDelegate {
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		if let text = textField.text as NSString? {
			let txtAfterUpdate = text.replacingCharacters(in: range, with: string)
			searchText = txtAfterUpdate
		}

		return true
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		goToSearch()
		return false
	}
}
