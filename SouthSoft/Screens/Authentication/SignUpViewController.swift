//
//  SignUpViewController.swift
//  EWallet
//
//  Created  on 22/08/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class SignUpViewController: BaseViewController {
    static var storyBoardId: String = "SignUpViewController"
    static var storyBoardName: String = Storyboard.onBoarding


    //MARK:-  IBOutlets
    @IBOutlet fileprivate weak var titleImage:UIImageView!
    @IBOutlet fileprivate weak var titleLabel:UILabel!
    @IBOutlet fileprivate weak var subTitleLabel:UILabel!
    @IBOutlet fileprivate weak var signInBtn:UIButton!
    @IBOutlet fileprivate weak var signUpBtn:UIButton!
    @IBOutlet fileprivate weak var facebookBtn:UIButton!
    @IBOutlet fileprivate weak var googleBtn:UIButton!
    @IBOutlet fileprivate weak var appleBtn:UIButton!
    @IBOutlet fileprivate weak var firstNameTextField:TextField!
    @IBOutlet fileprivate weak var lastNameTextField:TextField!
    @IBOutlet fileprivate weak var mobileNumberTextField:TextField!
    @IBOutlet fileprivate weak var emailTextField:TextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        initialTextFieldSetup()
        setNavigationBar(showAttributedTitle: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }


    private func addBorderToTextfield(textfield:UITextField){
        textfield.delegate = self
        textfield.addLine(position: .LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 1)
    }

    fileprivate func updateBorder(textField: UITextField, color: UIColor, width: CGFloat) -> Void {
        if textField == firstNameTextField{
            textField.addLine(position: .LINE_POSITION_BOTTOM, color: color, width: Double(width))
        }
        else if textField == lastNameTextField{
            textField.addLine(position: .LINE_POSITION_BOTTOM, color: color, width: Double(width))
        }
        else if textField == mobileNumberTextField{
            textField.addLine(position: .LINE_POSITION_BOTTOM, color: color, width: Double(width))
        }
        else{
            textField.addLine(position: .LINE_POSITION_BOTTOM, color: color, width: Double(width))
        }
    }

    fileprivate func initialTextFieldSetup() {
        firstNameTextField.setupLeftImage(imageName: "Group -4")
        lastNameTextField.setupLeftImage(imageName: "Group -4")
        mobileNumberTextField.setupLeftImage(imageName: "Group 53")
        emailTextField.setupLeftImage(imageName: "Group 54")
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        mobileNumberTextField.delegate = self
        emailTextField.delegate = self
        addBorderToTextfield(textfield: firstNameTextField)
        addBorderToTextfield(textfield: lastNameTextField)
        addBorderToTextfield(textfield: mobileNumberTextField)
        addBorderToTextfield(textfield: emailTextField)
    }

    //MARK:-  Button Actions

    @IBAction fileprivate func signInBtnAction(_ sender:UIButton) {
        let vc = SignInViewController.instantiateFromStoryBoard()
        navigationController?.pushViewController(vc, animated: true)

    }

    @IBAction fileprivate func signUpBtnAction(_ sender:UIButton) {
        let passwodVC = CreatePasswordViewController.instantiateFromStoryBoard()
         navigationController?.pushViewController(passwodVC, animated: true)
    }

    @IBAction fileprivate func facebookBtnAction(_ sender:UIButton) {

    }

    @IBAction fileprivate func googleBtnAction(_ sender:UIButton) {

    }

    @IBAction fileprivate func appleBtnAction(_ sender:UIButton) {

    }

}

extension SignUpViewController:UITextFieldDelegate{

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == firstNameTextField {
            updateBorder(textField: textField, color: AppColors.themeLightYellow, width: 1.0)
            firstNameTextField.setupLeftImage(imageName: "Group -4", isTintEnable: true)
        }
        else if textField == lastNameTextField {
            updateBorder(textField: textField, color: AppColors.themeLightYellow, width: 1.0)
            lastNameTextField.setupLeftImage(imageName: "Group -4", isTintEnable: true)
        }
        else if textField == mobileNumberTextField {
            updateBorder(textField: textField, color: AppColors.themeLightYellow, width: 1.0)
            mobileNumberTextField.setupLeftImage(imageName: "Group 53", isTintEnable: true)
        }
        else{
            updateBorder(textField: textField, color: AppColors.themeLightYellow, width: 1.0)
            emailTextField.setupLeftImage(imageName: "Group 54", isTintEnable: true)
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        updateBorder(textField: textField, color: UIColor.lightGray, width: 1.0)
        firstNameTextField.setupLeftImage(imageName: "Group -4", isTintEnable: false)
        lastNameTextField.setupLeftImage(imageName: "Group -4", isTintEnable: false)
        mobileNumberTextField.setupLeftImage(imageName: "Group 53", isTintEnable: false)
        emailTextField.setupLeftImage(imageName: "Group 54", isTintEnable: false)
    }
}
