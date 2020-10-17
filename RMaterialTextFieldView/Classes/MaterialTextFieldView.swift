//
//  MaterialTextFieldView.swift
//  OnGraviti
//
//  Created by Rishabh Yadav on 2/5/19.
//  Copyright © 2019 SouthSoft. All rights reserved.
//

import UIKit

typealias ButtonAction = (UIButton)->()

class MaterialTextFieldView: UIView {

    //MARK: - IBOutlets
    @IBOutlet private var contentView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet private weak var titleLabelCenter: NSLayoutConstraint!
    @IBOutlet private weak var titleLabelContainer: UIView!
    @IBOutlet private weak var titleLabelleading: NSLayoutConstraint!
    @IBOutlet var textfieldDelegate: UITextFieldDelegate?{
        didSet{
            textField.delegate = textfieldDelegate
        }
    }
    
    //MARK: - Constants
    private static let nibName = "MaterialTextFieldView"
    
    //MARK: - Variables
    @IBInspectable
    var textFieldBorderColor: UIColor = UIColor("cacad5") //------default value
    @IBInspectable
    var textFieldBorderRadius:CGFloat = 8.0 //------default value
    @IBInspectable
    var textFieldBorderWidth:CGFloat = 1.0 //------default value
    @IBInspectable
    var textFieldPadding:CGFloat = 15.0 //------default value

    @IBInspectable
    var titleText:String = ""{ //------default value
        didSet{
            titleLabel.text = titleText
            textField.placeholder = titleText
        }
    }
    
    @IBInspectable
    fileprivate var enableRightButton:Bool = false{ //------default value
        didSet{
            if (enableRightButton){
                addButtonInRightView()
            }else{
                let paddingRect = CGRect(x: 0, y: 0, width: textFieldPadding, height: 50)
                rightButton?.removeFromSuperview()
                rightView.frame = paddingRect
            }
            
        }
    }
    fileprivate var rightView: UIView = UIView()
    var righthButtonAction: ButtonAction?
    var rightButton:UIButton?

    @IBInspectable
    var rightButtonImage:UIImage = UIImage.init(named: "view_pass") ?? UIImage()
    
    //MARK: - LifeCycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = self.bounds
    }
    
    fileprivate func customInit(){
        // we're customizing the data here
        let bundle = Bundle(for: MaterialTextFieldView.self)
        bundle.loadNibNamed(MaterialTextFieldView.nibName, owner: self, options: nil)
        addSubview(contentView)
        if self.backgroundColor == .clear{
             self.backgroundColor = .white
        }
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addPadding()
        addBorder()
        titleLabelContainer.backgroundColor = self.backgroundColor
        titleLabel.text = titleText
       
        textField.placeholder = titleText
        
        textField.delegate = textfieldDelegate
        textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
    
    fileprivate func addButtonInRightView(){
        let paddingRect = CGRect(x: 0, y: 0, width: textFieldPadding+15, height: 50)
        rightView.frame = paddingRect
        
        let button = UIButton.init(frame: paddingRect)
        button.addTarget(self, action: #selector(rightButtonClicked(_:)), for: .touchUpInside)
        button.setImage(rightButtonImage, for: .normal)
        button.contentHorizontalAlignment = .left
        rightView.addSubview(button)
        rightButton = button
    }
    
    //MARK: - Helpers
   
    
    fileprivate func addPadding(){
        titleLabelleading.constant = textFieldPadding-5
        let paddingRect = CGRect(x: 0, y: 0, width: textFieldPadding, height: 50)
        
        let leftView = UIView.init(frame: paddingRect)
        textField.leftView = leftView//----- set right view
        
        let rightView = UIView.init(frame: paddingRect)
        textField.rightView = rightView //----- set right view
        
        self.rightView = rightView
        if enableRightButton {
            addButtonInRightView()
        }
        textField.leftViewMode = .always
        textField.rightViewMode = .always
    }
    fileprivate func addBorder(){
        textField.layer.borderColor = textFieldBorderColor.cgColor
        textField.layer.borderWidth = textFieldBorderWidth
        textField.layer.cornerRadius = textFieldBorderRadius
    }
    
    fileprivate func animateTitleLabel() {
        var centerPosition = CGFloat(0.0)
        if let textFieldText = textField.text,
            !textFieldText.isEmpty{
            centerPosition = -CGFloat(textField.bounds.height/2)
        }
        
        if titleLabelCenter.constant == centerPosition{//----- already on right position
        //fds    titleLabel.textColor = UIColor.init(red: 155.0/255.0, green: 154.0/255.0, blue: 173.0/255.0, alpha: 1.0)
            return
        }
        
        if  titleLabelCenter.constant > centerPosition{ //-----up
            titleLabelCenter.constant = centerPosition
            titleLabelContainer.alpha = 0.0
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.titleLabel.textColor = UIColor.init(red: 115.0/255.0, green: 93.0/255.0, blue: 243.0/255.0, alpha: 1.0)
                self.titleLabelContainer.alpha = 1.0
                self.titleLabelContainer.layoutIfNeeded()
                self.layoutIfNeeded()
            }, completion: nil)
        }else{ //-----down
            titleLabelCenter.constant = centerPosition
            titleLabelContainer.alpha = 1.0
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                self.titleLabel.textColor = UIColor.init(red: 155.0/255.0, green: 154.0/255.0, blue: 173.0/255.0, alpha: 1.0)
                self.titleLabelContainer.alpha = 0.0
                self.titleLabelContainer.layoutIfNeeded()
                self.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    //MARK: - Actions
    @objc fileprivate func editingChanged(){
        animateTitleLabel()
    }
    
    @objc fileprivate func rightButtonClicked(_ sender: UIButton){
        if let righthButtonAction = righthButtonAction{
            righthButtonAction(sender)
        }
    }

}

/*
class MaterialTextfield: UITextField {
    
    private var materialView:MaterialTextFieldView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         customInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        materialView.frame = CGRect.init(origin: CGPoint.zero, size: frame.size)
    }
    
    fileprivate func customInit(){
        // we're customizing the data here
        let textContainer = MaterialTextFieldView.init(frame: CGRect.init(origin: CGPoint.zero, size: frame.size))
        self.addSubview(textContainer)
        materialView = textContainer
    }
}
*/
