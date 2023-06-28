//
//  File.swift
//  Star Browser
//
//  Created by Arseni Khatsuk on 13.04.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let firstScreen = UIView()
    let secondScreen = UIView()
    let thirdScreen = UIView()
    let nextButton = UIButton()
    let startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImage(named: "background")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        
        let privacy = createLabel(text: "OnboardingViewController.policy".localized(), fontSize: 16, fontWeight: .medium, textColor: .white, textAlignment: .center)
        view.addSubview(privacy)
        
        setUpFirstScreen()
        setUpSecondScreen()
        setUpThirdScreen()
       
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            nextButton.widthAnchor.constraint(equalToConstant: 236),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.bounds.height * -0.093),
            
            privacy.widthAnchor.constraint(equalToConstant: 227),
            privacy.heightAnchor.constraint(equalToConstant: 22),
            privacy.topAnchor.constraint(equalTo: nextButton.bottomAnchor,constant: view.bounds.height * 0.024),
            privacy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setUpFirstScreen() {
        // First screen
        firstScreen.frame = view.bounds
        
        let firstFullStar = createImageView(imageName: "starFull")
        let firstFullStar2 = createImageView(imageName: "starFull")
        
        let firstFullStarGreen3 = createImageView(imageName: "starFull")
        firstFullStarGreen3.layer.opacity = 0.08
        
        let firstFullStar4 = createImageView(imageName: "starFull")
        
        let firstFullStarGreen5 = createImageView(imageName: "starFull")
        firstFullStarGreen5.layer.opacity = 0.08
        
        let firstFullStarGreen6 = createImageView(imageName: "starFull")
        firstFullStarGreen6.layer.opacity = 0.08
       
        let firstStarEmpty = createImageView(imageName: "starEmpty")
        
        let firstStarFullEmpty = createImageView(imageName: "starFullEmpty")
        
        firstScreen.addSubview(firstFullStar)
        firstScreen.addSubview(firstFullStar2)
        firstScreen.addSubview(firstFullStarGreen3)
        firstScreen.addSubview(firstFullStar4)
        firstScreen.addSubview(firstFullStarGreen5)
        firstScreen.addSubview(firstFullStarGreen6)
        firstScreen.addSubview(firstStarEmpty)
        firstScreen.addSubview(firstStarFullEmpty)
        
        let firstLabel1 = createLabel(text: "OnboardingViewController.firstLabel1".localized(), fontSize: 48, fontWeight: .bold, textColor: .white , textAlignment: .left)
        firstScreen.addSubview(firstLabel1)
        
        let firstLabel2 = createLabel(text: "OnboardingViewController.firstLabel2".localized(), fontSize: 20, fontWeight: .light, textColor: .white , textAlignment: .left)
        firstScreen.addSubview(firstLabel2)
        
        let firstLabel3 = createLabel(text: "OnboardingViewController.firstLabel3".localized(), fontSize: 40, fontWeight: .bold, textColor: .white , textAlignment: .center)
        firstScreen.addSubview(firstLabel3)
        
        let firstLabel4 = createLabel(text: "OnboardingViewController.firstLabel4".localized(), fontSize: 20, fontWeight: .light, textColor: .white , textAlignment: .right)
        firstLabel4.numberOfLines = 0
        firstLabel4.lineBreakMode = .byWordWrapping
        firstScreen.addSubview(firstLabel4)
        
        let firstLabel5 = createLabel(text: "OnboardingViewController.firstLabel5".localized(), fontSize: 48, fontWeight: .bold, textColor: .white , textAlignment: .right)
        firstScreen.addSubview(firstLabel5)
    
        let imageView = createImageView(imageName: "title")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.shadowColor = UIColor(red: 0.008, green: 0.579, blue: 0.02, alpha: 0.90).cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset = CGSize(width: 8, height: 5)
        imageView.layer.shadowRadius = 30
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        configureNextButton()
        view.addSubview(firstScreen)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 400),
            imageView.heightAnchor.constraint(equalToConstant: 170),
            imageView.bottomAnchor.constraint(equalTo: firstLabel1.topAnchor, constant: view.bounds.height * -0.016),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            firstFullStar.widthAnchor.constraint(equalToConstant: 37),
            firstFullStar.heightAnchor.constraint(equalToConstant: 37),
            firstFullStar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -38),
            firstFullStar.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: view.bounds.height * 0.030),
            
            firstFullStar2.widthAnchor.constraint(equalToConstant: 27),
            firstFullStar2.heightAnchor.constraint(equalToConstant: 27),
            firstFullStar2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            firstFullStar2.topAnchor.constraint(equalTo: firstFullStar4.bottomAnchor, constant: view.bounds.height * 0.085),
            
            firstFullStarGreen3.widthAnchor.constraint(equalToConstant: 27),
            firstFullStarGreen3.heightAnchor.constraint(equalToConstant: 27),
            firstFullStarGreen3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            firstFullStarGreen3.topAnchor.constraint(equalTo: firstFullStar4.bottomAnchor, constant: view.bounds.height * 0.066),
            
            firstFullStar4.widthAnchor.constraint(equalToConstant: 12),
            firstFullStar4.heightAnchor.constraint(equalToConstant: 12),
            firstFullStar4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 217),
            firstFullStar4.topAnchor.constraint(equalTo: firstFullStar.bottomAnchor, constant: view.bounds.height * 0.059),
            
            firstFullStarGreen5.widthAnchor.constraint(equalToConstant: 19),
            firstFullStarGreen5.heightAnchor.constraint(equalToConstant: 19),
            firstFullStarGreen5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            firstFullStarGreen5.topAnchor.constraint(equalTo: firstLabel4.bottomAnchor, constant: view.bounds.height * 0.041),
            
            firstFullStarGreen6.widthAnchor.constraint(equalToConstant: 19),
            firstFullStarGreen6.heightAnchor.constraint(equalToConstant: 19),
            firstFullStarGreen6.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 198),
            firstFullStarGreen6.topAnchor.constraint(equalTo: firstLabel4.bottomAnchor, constant: view.bounds.height * 0.072),
            
            firstStarEmpty.widthAnchor.constraint(equalToConstant: 22),
            firstStarEmpty.heightAnchor.constraint(equalToConstant: 22),
            firstStarEmpty.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 229),
            firstStarEmpty.topAnchor.constraint(equalTo: firstFullStar.bottomAnchor, constant: view.bounds.height * 0.043),
            
            firstStarFullEmpty.widthAnchor.constraint(equalToConstant: 51),
            firstStarFullEmpty.heightAnchor.constraint(equalToConstant: 51),
            firstStarFullEmpty.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 69),
            firstStarFullEmpty.topAnchor.constraint(equalTo: firstLabel4.bottomAnchor, constant: view.bounds.height * 0.009),
            
            firstLabel1.widthAnchor.constraint(equalToConstant: 123),
            firstLabel1.heightAnchor.constraint(equalToConstant: 61),
            firstLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstLabel1.bottomAnchor.constraint(equalTo: firstLabel2.topAnchor, constant: view.bounds.height * -0.021),
            
            firstLabel2.widthAnchor.constraint(equalToConstant: 288),
            firstLabel2.heightAnchor.constraint(equalToConstant: 26),
            firstLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstLabel2.bottomAnchor.constraint(equalTo: firstLabel3.topAnchor, constant: view.bounds.height * -0.047),
            
            firstLabel3.widthAnchor.constraint(equalToConstant: 88),
            firstLabel3.heightAnchor.constraint(equalToConstant: 61),
            firstLabel3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstLabel3.bottomAnchor.constraint(equalTo: firstLabel4.topAnchor, constant: view.bounds.height * -0.021),
            
            firstLabel4.widthAnchor.constraint(equalToConstant: 288),
            firstLabel4.heightAnchor.constraint(equalToConstant: 52),
            firstLabel4.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            firstLabel4.bottomAnchor.constraint(equalTo: firstLabel5.topAnchor, constant: view.bounds.height * -0.021),
            
            firstLabel5.widthAnchor.constraint(equalToConstant: 91),
            firstLabel5.heightAnchor.constraint(equalToConstant: 61),
            firstLabel5.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            firstLabel5.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: view.bounds.height * -0.100),
        ])
    }
    
    func setUpSecondScreen() {
        secondScreen.frame = view.bounds
        
        let secondFullStar = createImageView(imageName: "starFull")
        let secondFullStar2 = createImageView(imageName: "starFull")
        
        let secondFullStarGreen3 = createImageView(imageName: "starFull")
        secondFullStarGreen3.layer.opacity = 0.5
        let secondFullStar4 = createImageView(imageName: "starFull")
        
        let secondFullStarGreen5 = createImageView(imageName: "starFull")
        secondFullStarGreen5.layer.opacity = 0.8
        
        let secondStarEmpty = createImageView(imageName: "starEmpty")
        let secondStarEmpty2 = createImageView(imageName: "starEmpty")
        let secondStarFullEmpty = createImageView(imageName: "starFullEmpty")
        
        secondScreen.addSubview(secondFullStar)
        secondScreen.addSubview(secondFullStar2)
        secondScreen.addSubview(secondFullStarGreen3)
        secondScreen.addSubview(secondFullStar4)
        secondScreen.addSubview(secondFullStarGreen5)
        secondScreen.addSubview(secondStarEmpty)
        secondScreen.addSubview(secondStarEmpty2)
        secondScreen.addSubview(secondStarFullEmpty)
    
        let secondLabel1 = createLabel(text: "OnboardingViewController.secondLabel1".localized(), fontSize: 48, fontWeight: .bold, textColor: .white , textAlignment: .center)
        secondScreen.addSubview(secondLabel1)
        
        let secondLabel2 = createLabel(text: "OnboardingViewController.secondLabel2".localized(), fontSize: 20, fontWeight: .light, textColor: .white , textAlignment: .center)
        secondLabel2.numberOfLines = 0
        secondLabel2.lineBreakMode = .byWordWrapping
        secondScreen.addSubview(secondLabel2)
        
        let secondLabel3 = createLabel(text: "OnboardingViewController.secondLabel3".localized(), fontSize: 48, fontWeight: .bold, textColor: .white , textAlignment: .center)
        secondScreen.addSubview(secondLabel3)
        
        secondScreen.isHidden = true
        configureNextButton()
        view.addSubview(secondScreen)

        NSLayoutConstraint.activate([
            secondFullStar.widthAnchor.constraint(equalToConstant: 27),
            secondFullStar.heightAnchor.constraint(equalToConstant: 27),
            secondFullStar.trailingAnchor.constraint(equalTo: secondLabel3.leadingAnchor, constant: -28),
            secondFullStar.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: view.bounds.height * -0.067),
            
            secondFullStar2.widthAnchor.constraint(equalToConstant: 37),
            secondFullStar2.heightAnchor.constraint(equalToConstant: 37),
            secondFullStar2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            secondFullStar2.bottomAnchor.constraint(equalTo: secondLabel2.topAnchor, constant: view.bounds.height * -0.081),
            
            secondFullStarGreen3.widthAnchor.constraint(equalToConstant: 27),
            secondFullStarGreen3.heightAnchor.constraint(equalToConstant: 27),
            secondFullStarGreen3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            secondFullStarGreen3.bottomAnchor.constraint(equalTo: secondLabel2.topAnchor, constant: view.bounds.height * -0.046),
            
            secondFullStar4.widthAnchor.constraint(equalToConstant: 12),
            secondFullStar4.heightAnchor.constraint(equalToConstant: 12),
            secondFullStar4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -95),
            secondFullStar4.bottomAnchor.constraint(equalTo: secondLabel2.topAnchor, constant: view.bounds.height * -0.135),
            
            
            secondFullStarGreen5.widthAnchor.constraint(equalToConstant: 19),
            secondFullStarGreen5.heightAnchor.constraint(equalToConstant: 19),
            secondFullStarGreen5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65),
            secondFullStarGreen5.bottomAnchor.constraint(equalTo: secondLabel3.topAnchor, constant: view.bounds.height * -0.030),
            
            secondStarEmpty.widthAnchor.constraint(equalToConstant: 22),
            secondStarEmpty.heightAnchor.constraint(equalToConstant: 22),
            secondStarEmpty.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            secondStarEmpty.bottomAnchor.constraint(equalTo: secondLabel2.topAnchor, constant: view.bounds.height * -0.039),
            
            secondStarEmpty2.widthAnchor.constraint(equalToConstant: 22),
            secondStarEmpty2.heightAnchor.constraint(equalToConstant: 22),
            secondStarEmpty2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -73),
            secondStarEmpty2.bottomAnchor.constraint(equalTo: secondLabel2.topAnchor, constant: view.bounds.height * -0.141),
            
            secondStarFullEmpty.widthAnchor.constraint(equalToConstant: 51),
            secondStarFullEmpty.heightAnchor.constraint(equalToConstant: 51),
            secondStarFullEmpty.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            secondStarFullEmpty.bottomAnchor.constraint(equalTo: secondLabel3.topAnchor, constant: view.bounds.height * -0.030),
            
            secondLabel1.widthAnchor.constraint(equalToConstant: 183),
            secondLabel1.heightAnchor.constraint(equalToConstant: 61),
            secondLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            secondLabel1.bottomAnchor.constraint(equalTo: secondLabel2.topAnchor, constant: view.bounds.height * -0.099),
            
            secondLabel2.widthAnchor.constraint(equalToConstant: 345),
            secondLabel2.heightAnchor.constraint(equalToConstant: 52),
            secondLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondLabel2.bottomAnchor.constraint(equalTo: secondLabel3.topAnchor, constant: view.bounds.height * -0.099),
            
            secondLabel3.widthAnchor.constraint(equalToConstant: 245),
            secondLabel3.heightAnchor.constraint(equalToConstant: 61),
            secondLabel3.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            secondLabel3.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: view.bounds.height * -0.100),
        ])
    }
    
    func setUpThirdScreen() {
        thirdScreen.frame = view.bounds
        
        let thirdFullStar = createImageView(imageName: "starFull")
        let thirdFullStar2 = createImageView(imageName: "starFull")
        let thirdFullStar4 = createImageView(imageName: "starFull")
        
        let thirdFullStarGreen3 = createImageView(imageName: "starFull")
        thirdFullStarGreen3.layer.opacity = 0.8
        
        let thirdFullStarGreen5 = createImageView(imageName: "starFull")
        thirdFullStarGreen5.layer.opacity = 0.8
        
        let thirdFullStarGreen6 = createImageView(imageName: "starFull")
        thirdFullStarGreen6.layer.opacity = 0.8
        
        let thirdFullStarGreen7 = createImageView(imageName: "starFull")
        thirdFullStarGreen7.layer.opacity = 0.8
        
        let thirdStarEmpty = createImageView(imageName: "starEmpty")
        let thirdStarEmpty2 = createImageView(imageName: "starEmpty")
        let thirdStarFullEmpty = createImageView(imageName: "starFullEmpty")
        
        thirdScreen.addSubview(thirdFullStar)
        thirdScreen.addSubview(thirdFullStar2)
        thirdScreen.addSubview(thirdFullStarGreen3)
        thirdScreen.addSubview(thirdFullStar4)
        thirdScreen.addSubview(thirdFullStarGreen5)
        thirdScreen.addSubview(thirdFullStarGreen6)
        thirdScreen.addSubview(thirdFullStarGreen7)
        thirdScreen.addSubview(thirdStarEmpty)
        thirdScreen.addSubview(thirdStarEmpty2)
        thirdScreen.addSubview(thirdStarFullEmpty)
        
        let thirdLabel1 = createLabel(text: "OnboardingViewController.thirdLabel1".localized() , fontSize: 48, fontWeight: .bold, textColor: .white , textAlignment: .center)
        thirdScreen.addSubview(thirdLabel1)
        
        let thirdLabel2 = createLabel(text: "OnboardingViewController.thirdLabel2".localized(), fontSize: 20, fontWeight: .light, textColor: .white , textAlignment: .center)
        thirdLabel2.numberOfLines = 0
        thirdScreen.addSubview(thirdLabel2)
        
        let thirdLabel3 = createLabel(text: "OnboardingViewController.thirdLabel3".localized(), fontSize: 48, fontWeight: .bold, textColor: .white , textAlignment: .center)
        thirdScreen.addSubview(thirdLabel3)
        
        thirdScreen.isHidden = true
        configureNextButton()
        configureStartButton()
        view.addSubview(thirdScreen)
    
        NSLayoutConstraint.activate([
            startButton.widthAnchor.constraint(equalToConstant: 236),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.bounds.height * -0.093),

            thirdFullStar.widthAnchor.constraint(equalToConstant: 37),
            thirdFullStar.heightAnchor.constraint(equalToConstant: 37),
            thirdFullStar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 137),
            thirdFullStar.bottomAnchor.constraint(equalTo: thirdLabel2.topAnchor, constant: view.bounds.height * -0.032),
            
            thirdFullStar2.widthAnchor.constraint(equalToConstant: 27),
            thirdFullStar2.heightAnchor.constraint(equalToConstant: 27),
            thirdFullStar2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 112),
            thirdFullStar2.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: view.bounds.height * -0.061),
            
            thirdFullStarGreen3.widthAnchor.constraint(equalToConstant: 19),
            thirdFullStarGreen3.heightAnchor.constraint(equalToConstant: 19),
            thirdFullStarGreen3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34),
            thirdFullStarGreen3.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: view.bounds.height * -0.115),
            
            thirdFullStar4.widthAnchor.constraint(equalToConstant: 12),
            thirdFullStar4.heightAnchor.constraint(equalToConstant: 12),
            thirdFullStar4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -62),
            thirdFullStar4.bottomAnchor.constraint(equalTo: thirdLabel3.topAnchor, constant: view.bounds.height * -0.034),
            
            thirdFullStarGreen5.widthAnchor.constraint(equalToConstant: 19),
            thirdFullStarGreen5.heightAnchor.constraint(equalToConstant: 19),
            thirdFullStarGreen5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            thirdFullStarGreen5.bottomAnchor.constraint(equalTo: thirdLabel2.topAnchor, constant: view.bounds.height * -0.080),
            
            thirdFullStarGreen6.widthAnchor.constraint(equalToConstant: 27),
            thirdFullStarGreen6.heightAnchor.constraint(equalToConstant: 27),
            thirdFullStarGreen6.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -51),
            thirdFullStarGreen6.bottomAnchor.constraint(equalTo: thirdLabel2.topAnchor, constant: view.bounds.height * -0.145),
            
            thirdFullStarGreen7.widthAnchor.constraint(equalToConstant: 38),
            thirdFullStarGreen7.heightAnchor.constraint(equalToConstant: 38),
            thirdFullStarGreen7.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            thirdFullStarGreen7.bottomAnchor.constraint(equalTo: thirdLabel2.topAnchor, constant: view.bounds.height * -0.001),
            
            thirdStarEmpty.widthAnchor.constraint(equalToConstant: 22),
            thirdStarEmpty.heightAnchor.constraint(equalToConstant: 22),
            thirdStarEmpty.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            thirdStarEmpty.bottomAnchor.constraint(equalTo: thirdLabel3.topAnchor, constant: view.bounds.height * -0.040),
            
            thirdStarEmpty2.widthAnchor.constraint(equalToConstant: 22),
            thirdStarEmpty2.heightAnchor.constraint(equalToConstant: 22),
            thirdStarEmpty2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 165),
            thirdStarEmpty2.bottomAnchor.constraint(equalTo: thirdLabel2.topAnchor, constant: view.bounds.height * -0.017),
            
            thirdStarFullEmpty.widthAnchor.constraint(equalToConstant: 51),
            thirdStarFullEmpty.heightAnchor.constraint(equalToConstant: 51),
            thirdStarFullEmpty.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 39),
            thirdStarFullEmpty.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: view.bounds.height * -0.115),
            
            thirdLabel1.widthAnchor.constraint(equalToConstant: 183),
            thirdLabel1.heightAnchor.constraint(equalToConstant: 61),
            thirdLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            thirdLabel1.bottomAnchor.constraint(equalTo: thirdLabel2.topAnchor, constant: view.bounds.height * -0.099),
            
            thirdLabel2.widthAnchor.constraint(equalToConstant: 345),
            thirdLabel2.heightAnchor.constraint(equalToConstant: 78),
            thirdLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdLabel2.bottomAnchor.constraint(equalTo: thirdLabel3.topAnchor, constant: view.bounds.height * -0.073),
            
            thirdLabel3.widthAnchor.constraint(equalToConstant: 236),
            thirdLabel3.heightAnchor.constraint(equalToConstant: 50),
            thirdLabel3.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16),
            thirdLabel3.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: view.bounds.height * -0.100),
        ])
    }
        
    func createLabel(text: String, fontSize: CGFloat, fontWeight: UIFont.Weight,textColor: UIColor, textAlignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func createImageView(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    func configureNextButton() {
        nextButton.setTitle("OnboardingViewController.nextButton.title".localized(), for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        nextButton.backgroundColor = .black
        nextButton.layer.cornerRadius = 25
        nextButton.layer.borderWidth = 2
        nextButton.layer.borderColor = UIColor.white.cgColor
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
    }
    
    func configureStartButton() {
        startButton.setTitle("OnboardingViewController.startButton.title".localized(), for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        startButton.backgroundColor = .black
        startButton.layer.cornerRadius = 25
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor.white.cgColor
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        thirdScreen.addSubview(startButton)
    }
    
    @objc func nextButtonTapped() {
        if firstScreen.isHidden {
            secondScreen.isHidden = true
            thirdScreen.isHidden = false
        } else {
            firstScreen.isHidden = true
            secondScreen.isHidden = false
        }
    }
    
    @objc func startButtonTapped() {
        UserDefaults.standard.set(true, forKey: "kOnboardingShownKey")
        self.dismiss(animated: true, completion: nil)
        
        let navigationController = UINavigationController(rootViewController: MainViewController())
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}
