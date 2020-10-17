//
//  SignInViewController.swift
//  EWallet
//
//  Created on 22/08/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class SignInViewController: BaseViewController {
    static var storyBoardId: String = "SignInViewController"
    static var storyBoardName: String = Storyboard.onBoarding

    //MARK:-  IBOutlets
    @IBOutlet fileprivate weak var titleLabel:UILabel!
    @IBOutlet fileprivate weak var signInBtn:UIButton!
    @IBOutlet fileprivate weak var signUpBtn:UIButton!
    @IBOutlet fileprivate weak var forgotPasswordBtn:UIButton!
    @IBOutlet fileprivate weak var facebookBtn:UIButton!
    @IBOutlet fileprivate weak var googleBtn:UIButton!
    @IBOutlet fileprivate weak var appleBtn:UIButton!
    @IBOutlet fileprivate weak var userNameTextField:TextField!
    @IBOutlet fileprivate weak var passwordTextField:TextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        addShowPasswordBtn()
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
        if textField == userNameTextField{
            textField.addLine(position: .LINE_POSITION_BOTTOM, color: color, width: Double(width))
        }
        else{
            textField.addLine(position: .LINE_POSITION_BOTTOM, color: color, width: Double(width))
        }
    }

    fileprivate func initialTextFieldSetup() {
        userNameTextField.setupLeftImage(imageName: "Group -4")
        passwordTextField.setupLeftImage(imageName: "Group 43")
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        addBorderToTextfield(textfield: userNameTextField)
        addBorderToTextfield(textfield: passwordTextField)
    }

    fileprivate func addShowPasswordBtn(){
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Group 48"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(passwordTextField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.refresh), for: .touchUpInside)
        passwordTextField.rightView = button
        passwordTextField.rightViewMode = .always
    }

    @IBAction func refresh(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            passwordTextField.isSecureTextEntry = false
        }
        else{
            passwordTextField.isSecureTextEntry = true
        }
    }

    //MARK:-  Button Actions


    @IBAction fileprivate func signInBtnAction(_ sender:UIButton) {
        AppInitialiser.shared.setupDashBoard()
    }

    @IBAction fileprivate func forgotPasswordBtnAction(_ sender:UIButton) {

    }

    @IBAction fileprivate func signUpBtnAction(_ sender:UIButton) {
        let vc = SignUpViewController.instantiateFromStoryBoard()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction fileprivate func facebookBtnAction(_ sender:UIButton) {

    }

    @IBAction fileprivate func googleBtnAction(_ sender:UIButton) {

    }

    @IBAction fileprivate func appleBtnAction(_ sender:UIButton) {

    }

}

extension SignInViewController:UITextFieldDelegate{

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == userNameTextField {
            updateBorder(textField: textField, color: AppColors.themeLightYellow, width: 1.0)
            userNameTextField.setupLeftImage(imageName: "Group -4", isTintEnable: true)
        }
        else{
            updateBorder(textField: textField, color: AppColors.themeLightYellow, width: 1.0)
            passwordTextField.setupLeftImage(imageName: "Group 43", isTintEnable: true)
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        updateBorder(textField: textField, color: UIColor.lightGray, width: 1.0)
        userNameTextField.setupLeftImage(imageName: "Group -4", isTintEnable: false)
        passwordTextField.setupLeftImage(imageName: "Group 43", isTintEnable: false)
    }



}
