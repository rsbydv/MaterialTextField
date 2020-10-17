//
//  CreatePasswordViewController.swift
//  EWallet
//
//  Created  on 24/08/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class CreatePasswordViewController: BaseViewController {
    static var storyBoardId: String = "CreatePasswordViewController"
    static var storyBoardName: String = Storyboard.onBoarding


    //MARK:-  IBOutlets
    @IBOutlet fileprivate weak var titleImage:UIImageView!
    @IBOutlet fileprivate weak var passwordImage:UIImageView!
    @IBOutlet fileprivate weak var titleLabel:UILabel!
    @IBOutlet fileprivate weak var subTitleLabel:UILabel!
    @IBOutlet fileprivate weak var signInBtn:UIButton!
    @IBOutlet fileprivate weak var signUpBtn:UIButton!
    @IBOutlet fileprivate weak var facebookBtn:UIButton!
    @IBOutlet fileprivate weak var googleBtn:UIButton!
    @IBOutlet fileprivate weak var appleBtn:UIButton!
    @IBOutlet fileprivate weak var createPasswordTextField:TextField!
    @IBOutlet fileprivate weak var confirmPasswordTextField:TextField!


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
        if textField == createPasswordTextField{
            textField.addLine(position: .LINE_POSITION_BOTTOM, color: color, width: Double(width))
        }
        else{
            textField.addLine(position: .LINE_POSITION_BOTTOM, color: color, width: Double(width))
        }
    }

    fileprivate func initialTextFieldSetup() {
        createPasswordTextField.setupLeftImage(imageName: "Group 43")
        confirmPasswordTextField.setupLeftImage(imageName: "Group 43")
        createPasswordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        addBorderToTextfield(textfield: createPasswordTextField)
        addBorderToTextfield(textfield: confirmPasswordTextField)

    }

    //MARK:-  Button Actions

    @IBAction fileprivate func signInBtnAction(_ sender:UIButton) {
        let vc = SignInViewController.instantiateFromStoryBoard()
        navigationController?.pushViewController(vc, animated: true)

    }

    @IBAction fileprivate func signUpBtnAction(_ sender:UIButton) {
        AppInitialiser.shared.setupDashBoard()
    }

    @IBAction fileprivate func facebookBtnAction(_ sender:UIButton) {

    }

    @IBAction fileprivate func googleBtnAction(_ sender:UIButton) {

    }

    @IBAction fileprivate func appleBtnAction(_ sender:UIButton) {

    }

}

extension CreatePasswordViewController:UITextFieldDelegate{

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == createPasswordTextField {
            updateBorder(textField: textField, color: AppColors.themeLightYellow, width: 1.0)
            createPasswordTextField.setupLeftImage(imageName: "Group 43", isTintEnable: true)
        }

        else{
            updateBorder(textField: textField, color: AppColors.themeLightYellow, width: 1.0)
            confirmPasswordTextField.setupLeftImage(imageName: "Group 43", isTintEnable: true)
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        updateBorder(textField: textField, color: UIColor.lightGray, width: 1.0)
        createPasswordTextField.setupLeftImage(imageName: "Group 43", isTintEnable: false)
        confirmPasswordTextField.setupLeftImage(imageName: "Group 43", isTintEnable: false)

    }
}
