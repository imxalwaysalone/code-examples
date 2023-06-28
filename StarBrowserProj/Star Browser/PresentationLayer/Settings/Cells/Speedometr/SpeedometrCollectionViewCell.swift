//
//  SpeedometrCollectionViewCell.swift
//  Star Browser
//
//  Created by Островский Лев Владимирович on 10.04.2023.
//

import UIKit

class SpeedometrCollectionViewCell: UICollectionViewCell {
	private var circleRadius: CGFloat = 0
	private var labels: [UILabel] = []
	private var lineLayers: [CAShapeLayer] = []

	@IBOutlet private var valueLabelYConstraint: NSLayoutConstraint!
	@IBOutlet private var titleLabel: UILabel!
	@IBOutlet private var mainView: UIView!
	@IBOutlet private var valueLabel: UILabel!

	override func awakeFromNib() {
        super.awakeFromNib()

        mainView.backgroundColor = .clear
    }

	func config(model: SpeedometrModel) {
		setupTitleLabel(title: model.title)
		if model.titleValue == 0 {
			setupValueLabel(value: "--")
		} else {
			setupValueLabel(value: "\(Int(model.titleValue))")
		}

		drawSpeedometr()
	}

	private func drawSpeedometr() {
		mainView.layoutIfNeeded()
		circleRadius = mainView.bounds.width / 4
		valueLabelYConstraint.constant = mainView.bounds.height * 2.5 / 4 - circleRadius - 45
		drawWhiteCircle()
		insertLines()
		insertLabels()
	}

	private func insertLines() {
		// down left 50*
		drawLine(
			startX: mainView.bounds.width / 2 - (circleRadius + 45 + 10) * sin(.pi / 3) - 10 ,
			startY:  mainView.bounds.width / 2  + (circleRadius + 45 + 30) * cos((.pi / 18)*5) - 30,
			endX: mainView.bounds.width / 2  - (circleRadius + 45 + 30) * sin((.pi / 18)*5) + 10,
			endY: mainView.bounds.width / 2 + (circleRadius + 45 + 10) * cos(.pi / 3) - 10,
			lineColor: .white
		)
		// down left 10*
		drawLine(
			startX: mainView.bounds.width / 2 - (circleRadius + 45) * cos((.pi / 36) * 5) - 15,
			startY: mainView.bounds.width / 2 + (circleRadius + 45) * sin((.pi / 36) * 5) - 27,
			endX: mainView.bounds.width / 2  - (circleRadius + 45) * cos((.pi / 36) * 5) - 30,
			endY: mainView.bounds.width / 2  + (circleRadius + 45) * sin((.pi / 36) * 5) - 22,
			lineColor: .gray
		)
		// 0* left
		drawLine(
			startX: mainView.bounds.width / 2  - circleRadius - 42,
			startY: mainView.bounds.height / 2 + 40,
			endX: mainView.bounds.width / 2  - circleRadius - 67,
			endY: mainView.bounds.height / 2 + 40,
			lineColor: .white
		)
		// left 10*
		drawLine(
			startX: mainView.bounds.width / 2 - (circleRadius + 45) * cos((.pi / 36) * 5) - 15,
			startY: mainView.bounds.width / 2 - (circleRadius + 45) * sin((.pi / 36) * 5) + 7,
			endX: mainView.bounds.width / 2  - (circleRadius + 45) * cos((.pi / 36) * 5) - 30,
			endY: mainView.bounds.width / 2  - (circleRadius + 45) * sin((.pi / 36) * 5) + 5,
			lineColor: .gray
		)
		// 45* left
		drawLine(
			startX: mainView.bounds.width / 2 - (circleRadius + 45) * sin(.pi / 4) - 12,
			startY: mainView.bounds.width / 2 - (circleRadius + 45) * cos(.pi / 4) - 14,
			endX: mainView.bounds.width / 2  - (circleRadius + 45) * sin(.pi / 4) - 25,
			endY: mainView.bounds.width / 2  - (circleRadius + 45) * cos(.pi / 4) - 25,
			lineColor: .gray
		)

		// left 50*
		drawLine(
			startX: mainView.bounds.width / 2  - (circleRadius + 45 + 30) * sin((.pi / 18)*5) + 10,
			startY: mainView.bounds.width / 2 - (circleRadius + 45 + 10) * cos(.pi / 3) - 7,
			endX: mainView.bounds.width / 2 - (circleRadius + 45 + 10) * sin(.pi / 3) - 10 ,
			endY: mainView.bounds.width / 2  - (circleRadius + 45 + 30) * cos((.pi / 18)*5) + 15,
			lineColor: .white
		)
		// left 60*
		drawLine(
			startX: mainView.bounds.width / 2  - (circleRadius + 55) * cos(.pi / 3),
			startY: mainView.bounds.width / 2  - (circleRadius + 55) * sin(.pi / 3),
			endX: mainView.bounds.width / 2 - (circleRadius + 55 + 10) * cos(.pi / 3) - 10,
			endY: mainView.bounds.width / 2 - (circleRadius + 55 + 10) * sin(.pi / 3) - 10,
			lineColor: .white
		)
		// left 70*
		drawLine(
			startX: mainView.bounds.width / 2 - (circleRadius + 45) * sin((.pi / 36) * 5) + 15,
			startY: mainView.bounds.width / 2 - (circleRadius + 45) * cos((.pi / 36) * 5) - 30,
			endX: mainView.bounds.width / 2  - (circleRadius + 45) * sin((.pi / 36) * 5) + 10,
			endY: mainView.bounds.width / 2  - (circleRadius + 45) * cos((.pi / 36) * 5) - 45,
			lineColor: .gray
		)
		// 90*
		drawLine(
			startX: mainView.bounds.width / 2,
			startY: mainView.bounds.height * 2.5 / 4 - circleRadius - 45,
			endX: mainView.bounds.width / 2,
			endY: mainView.bounds.height * 2.5 / 4 - circleRadius - 45 - 25,
			lineColor: .white
		)
		// right 90*
		drawLine(
			startX: mainView.bounds.width / 2 + (circleRadius + 45) * sin((.pi / 36) * 5) - 13,
			startY: mainView.bounds.width / 2 - (circleRadius + 45) * cos((.pi / 36) * 5) - 30,
			endX: mainView.bounds.width / 2  + (circleRadius + 45) * sin((.pi / 36) * 5) - 5,
			endY: mainView.bounds.width / 2  - (circleRadius + 45) * cos((.pi / 36) * 5) - 45,
			lineColor: .gray
		)
		// right 60*
		drawLine(
			startX: mainView.bounds.width / 2  + (circleRadius + 45 + 10) * sin(.pi / 6),
			startY: mainView.bounds.width / 2  - (circleRadius + 45 + 10) * cos(.pi / 6),
			endX: mainView.bounds.width / 2 + (circleRadius + 45 + 20) * sin(.pi / 6) + 10,
			endY: mainView.bounds.width / 2 - (circleRadius + 45 + 20) * cos(.pi / 6) - 10,
			lineColor: .white
		)
		// right 50*
		drawLine(
			startX: mainView.bounds.width / 2 + (circleRadius + 45 + 10) * sin(.pi / 3) - 10 ,
			startY: mainView.bounds.width / 2 - (circleRadius + 45 + 10) * cos(.pi / 3) - 7 ,
			endX: mainView.bounds.width / 2  + (circleRadius + 45 + 30) * sin((.pi / 18)*5) + 10,
			endY: mainView.bounds.width / 2  - (circleRadius + 45 + 30) * cos((.pi / 18)*5) + 15,
			lineColor: .white
		)
		// 45* right
		drawLine(
			startX: mainView.bounds.width / 2 + (circleRadius + 45) * sin(.pi / 4) + 10,
			startY: mainView.bounds.width / 2 - (circleRadius + 45) * cos(.pi / 4) - 14,
			endX: mainView.bounds.width / 2  + (circleRadius + 45) * sin(.pi / 4) + 23,
			endY: mainView.bounds.width / 2  - (circleRadius + 45) * cos(.pi / 4) - 25,
			lineColor: .gray
		)
		// right 10*
		drawLine(
			startX: mainView.bounds.width / 2 + (circleRadius + 45) * cos((.pi / 36) * 5) + 13,
			startY: mainView.bounds.width / 2 - (circleRadius + 45) * sin((.pi / 36) * 5) + 10,
			endX: mainView.bounds.width / 2  + (circleRadius + 45) * cos((.pi / 36) * 5) + 28,
			endY: mainView.bounds.width / 2  - (circleRadius + 45) * sin((.pi / 36) * 5) + 5,
			lineColor: .gray
		)
		// 0* right
		drawLine(
			startX: mainView.bounds.width / 2  + circleRadius + 62,
			startY: mainView.bounds.height / 2 + 40,
			endX: mainView.bounds.width / 2  + circleRadius + 37,
			endY: mainView.bounds.height / 2 + 40,
			lineColor: .white
		)
		drawLine(
			startX: mainView.bounds.width / 2 + (circleRadius + 45) * cos((.pi / 36) * 5) + 15,
			startY: mainView.bounds.width / 2 + (circleRadius + 45) * sin((.pi / 36) * 5) - 27,
			endX: mainView.bounds.width / 2  + (circleRadius + 45) * cos((.pi / 36) * 5) + 30,
			endY: mainView.bounds.width / 2  + (circleRadius + 45) * sin((.pi / 36) * 5) - 23,
			lineColor: .gray
		)
		// down right 50*
		drawLine(
			startX: mainView.bounds.width / 2 + (circleRadius + 45 + 10) * sin(.pi / 3) - 10,
			startY: mainView.bounds.width / 2 + (circleRadius + 45 + 10) * cos(.pi / 3) - 12,
			endX: mainView.bounds.width / 2  + (circleRadius + 45 + 30) * sin((.pi / 18)*5) + 10,
			endY: mainView.bounds.width / 2  + (circleRadius + 45 + 30) * cos((.pi / 18)*5) - 35,
			lineColor: .white
		)
	}

	private func insertLabels() {
		// 20
		insertLabel(
			originX: mainView.bounds.width / 2 - circleRadius - 38,
			originY: mainView.bounds.height / 2 + 20,
			value: "20"
		)

		// 140
		insertLabel(
			originX: mainView.bounds.width / 2 + circleRadius + 10,
			originY: mainView.bounds.height / 2 + 20,
			value: "140"
		)
		// 0
		insertLabel(
			originX: mainView.bounds.width / 2 - (circleRadius + 45) * cos((.pi / 36) * 5) + 13,
			originY: mainView.bounds.width / 2 + (circleRadius + 45) * sin((.pi / 36) * 5) - 17,
			value: "0"
		)
		// 40
		insertLabel(
			originX: mainView.bounds.width / 2  - (circleRadius + 45 + 30) * sin((.pi / 18)*5) + 13,
			originY: mainView.bounds.width / 2 - (circleRadius + 45 + 10) * cos(.pi / 3) - 20,
			value: "40"
		)
		// 60
		insertLabel(
			originX: mainView.bounds.width / 2  - (circleRadius + 55) * cos(.pi / 3),
			originY: mainView.bounds.width / 2  - (circleRadius + 55) * sin(.pi / 3) - 7,
			value: "60"
		)
		// 80
		insertLabel(
			originX: mainView.bounds.width / 2 - 10,
			originY: mainView.bounds.height * 2.5 / 4 - circleRadius - 50,
			value: "80"
		)
		// 100
		insertLabel(
			originX: mainView.bounds.width / 2  + (circleRadius + 45 + 10) * sin(.pi / 6) - 23,
			originY: mainView.bounds.width / 2  - (circleRadius + 45 + 10) * cos(.pi / 6) - 7,
			value: "100"
		)
		// 120
		insertLabel(
			originX: mainView.bounds.width / 2  + (circleRadius + 45 + 10) * sin(.pi / 6) + 17,
			originY: mainView.bounds.width / 2  - (circleRadius + 45 + 10) * cos(.pi / 6) + 38,
			value: "120"
		)
		// 160
		insertLabel(
			originX: mainView.bounds.width / 2 + (circleRadius + 45 + 10) * sin(.pi / 3) - 40,
			originY: mainView.bounds.width / 2 + (circleRadius + 45 + 10) * cos(.pi / 3) - 35,
			value: "160"
		)
	}

	private func updateSpeedometr(with value: Double) {
		drawGreenCircle(value: value)
		// change label's colors
		for label in labels {
			if let labelValue = Double(label.text ?? ""), labelValue <= value {
				label.textColor = .green
			}
		}

		let numValue = value / 10
		for (num, lineLayer) in lineLayers.enumerated() {
			if num <= Int(numValue) {
				lineLayer.strokeColor = UIColor.green.cgColor
			}
		}
	}

    private func insertLabel(originX: CGFloat, originY: CGFloat, value: String) {
        let label = UILabel(frame: CGRect(x: originX, y: originY, width: 40, height: 40))
        label.attributedText = NSAttributedString(
            string: value,
            attributes: [
                .font: UIFont(name: "Onest-Regular", size: 14) ?? UIFont(name: "Onest-Regular", size: 14),
                .foregroundColor: UIColor.white
            ]
        )
        mainView.addSubview(label)
		labels.append(label)
    }

	private func drawWhiteCircle() {
		let layer = CAShapeLayer()
		layer.name = "speedometr"
		let path = UIBezierPath(
			arcCenter: CGPoint(
				x: mainView.bounds.width / 2,
				y: mainView.bounds.height * 2.5 / 4
			),
			radius: circleRadius,
			startAngle: -.pi * 3 / 2 + .pi / 3.5,
			endAngle: .pi / 2 - .pi / 3.5,
			clockwise: true
		)

		layer.path = path.cgPath
		layer.fillColor = UIColor.clear.cgColor
		layer.strokeColor = UIColor.white.cgColor
		layer.lineWidth = 2
		layer.lineCap = .round

		mainView.layer.addSublayer(layer)
	}
    
    private func drawGreenCircle(value: Double) {
        var angleValue = value
        if value >= 160 {
            angleValue = 160
        }
        
        let layer = CAShapeLayer()
		layer.name = "speedometr"
        let whiteStartAngle = -CGFloat.pi * 3 / 2 + .pi / 3.5
		let endAngle = whiteStartAngle + (2 * CGFloat.pi - 4 * CGFloat.pi / 7) * angleValue / 160
        let path = UIBezierPath(
            arcCenter: CGPoint(
                x: mainView.bounds.width / 2,
                y: mainView.bounds.height * 2.5 / 4
            ),
            radius: circleRadius,
            startAngle: -.pi * 3 / 2 + .pi / 3.5,
            endAngle: endAngle,
            clockwise: true
        )
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.green.cgColor
        layer.lineWidth = 2
        layer.lineCap = .round
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(named: "shadow")?.cgColor
        mainView.layer.addSublayer(layer)
		drawValueCircle(endPoint: path.currentPoint)
    }

	private func drawValueCircle(endPoint: CGPoint) {
		let layer = CAShapeLayer()
		layer.name = "speedometr"
		let path = UIBezierPath(
			arcCenter: endPoint,
			radius: 5,
			startAngle: 0,
			endAngle: 2 * CGFloat.pi,
			clockwise: true
		)
		layer.path = path.cgPath
		layer.fillColor = UIColor.green.cgColor
		layer.strokeColor = UIColor.green.cgColor
		layer.lineCap = .round
		mainView.layer.addSublayer(layer)
	}

	private func drawLine(startX: CGFloat, startY: CGFloat, endX: CGFloat, endY: CGFloat, lineColor: UIColor) {
		let layer = CAShapeLayer()
		layer.name = "speedometr"
		let path = UIBezierPath()
		path.move(
			to: CGPoint(
				x: startX,
				y: startY
			)
		)

		path.addLine(
			to: CGPoint(
				x: endX,
				y: endY
			)
		)

		layer.path = path.cgPath
		layer.lineWidth = 2
		layer.lineCap = .round
		layer.strokeColor = lineColor.cgColor
		lineLayers.append(layer)
		mainView.layer.addSublayer(layer)
	}

	private func setupTitleLabel(title: String) {
		titleLabel.attributedText = NSAttributedString(
			string: title
		)
	}

	private func setupValueLabel(value: String) {
		valueLabel.attributedText = NSAttributedString(
			string: value,
            attributes: [
				.foregroundColor : UIColor.white,
				.font: UIFont(name: "Onest-Bold", size: 20)
            ]
		)
	}
}

extension SpeedometrCollectionViewCell: SpeedometrDelegate {
	func removeSpeedometr() {
		mainView.layer.sublayers?.removeAll { $0.name == "speedometr" }
		labels.forEach {
			$0.removeFromSuperview()
		}
		labels = []
		lineLayers = []
	}

	func startTest(model: SpeedometrModel) {
		removeSpeedometr()
		drawSpeedometr()
		setupValueLabel(value: "\(model.titleValue)")
		updateSpeedometr(with: model.titleValue)
	}
}

protocol SpeedometrDelegate: AnyObject {
    func removeSpeedometr()

	func startTest(model: SpeedometrModel)
}
