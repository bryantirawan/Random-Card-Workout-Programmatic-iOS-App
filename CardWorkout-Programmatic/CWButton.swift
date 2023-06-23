//
//  CWButton.swift
//  CardWorkout-Programmatic
//
//  Created by Bryant Irawan on 10/20/22.
//

import UIKit

class CWButton: UIButton {
    
    //override UI Button's init function
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    //will be required whenever you override init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false //use auto layout
    }
    
    init(backgroundColor: UIColor, title: String){
        super.init(frame: .zero) //frame takes in dimensions. CGRect is a frame that has x, y, width, height and doing .zero is just a shortcut to put 0 for the time being for all those dimensions
        self.backgroundColor = backgroundColor
        //we have to put self.backgroundColor instead of just backgroundColor because there is backgroundColor in the paramater already. If you just put color in parameter, you do not need to put self
        setTitle(title, for: .normal)
        configure()
        
        
        /// IOS 15 button update
//        init(color: UIColor, title: String, systemImageName: String) {
//            super.init(frame: .zero)
//
//            configuration = .tinted()
//            configuration?.title = title
//            configuration?.baseBackgroundColor = color
//            configuration?.cornerStyle = .medium
//            configuration?.image = UIImage(systemName: systemImageName)
//            configuration?.imagePadding = 5
//            configuration?.imagePlacement = .trailing
//
//            translatesAutoresizingMaskIntoConstraints = false
//        }
        
    }


}
