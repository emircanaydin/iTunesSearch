//
//  SegmentedControlComponent.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 27.10.2021.
//

import UIKit

class SegmentedControlComponent: GenericBaseView<SegmentedControlData> {
    
    private var buttons: [UIButton]!
    weak var delegate: SegmentedControlProtocol!
    
    private var buttonTitles:[String]!
    var textColor: UIColor!
    var selectorViewColor: UIColor!
    var selectorTextColor: UIColor!
    
    private(set) var selectedIndex: Int = 0
    
    private lazy var buttonStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: buttons)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .horizontal
        temp.alignment = .center
        temp.distribution = .fillEqually
        return temp
    }()
    
    private lazy var selectorView: UIView = {
        let selectorWidth = (UIScreen.main.bounds.width - 20) / 4
        let view = UIView(frame: CGRect(x: 0, y: 50, width: selectorWidth, height: 2))
        return view
    }()
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        self.textColor = data.textColor
        self.selectorViewColor = data.selectorViewColor
        self.selectorTextColor = data.selectorTextColor
        self.buttonTitles = data.buttonTitles
        self.delegate = data.indexListener
        
        selectorView.frame.origin.x = 0
        selectorView.frame.origin.y = 40
        selectorView.backgroundColor = self.selectorViewColor
        
        createButtons()
        addSubview(selectorView)
        addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: topAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    @objc func buttonAction(sender: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let selectorPosition = (UIScreen.main.bounds.width / 4) * CGFloat(buttonIndex)
                selectedIndex = buttonIndex
                delegate?.changeIndex(to: selectedIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
    
    func createButtons() {
        buttons = [UIButton]()
        subviews.forEach( {$0.removeFromSuperview()})
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action:#selector(SegmentedControlComponent.buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
}
