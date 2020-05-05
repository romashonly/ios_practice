//
//  UserInfoRegistration.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import UIKit

class UserInfoRegistrationVC: UIViewController {

    static func show(parent: UIViewController) {
        let instanse = UserInfoRegistrationAssembly.configureModule()
        instanse.isRegistration = parent is SportsRegVC
        parent.present(instanse, animated: true, completion: nil)
    }
    
    //----------------------------------------------------------------------
    
    var output: UserInfoRegViewProtocolOutput!
    
    var isRegistration: Bool = true
    
    var user: User? = nil
    
    //----------------------------------------------------------------------

    var nameField = UserField()
    var cityFiled = UserField()
    var ageField = UserField()
    
    var stand = UISegmentedControl()

    //----------------------------------------------------------------------

    var image: UIImage? = UIImage(named: "Registration/avatar")?.withRenderingMode(.alwaysTemplate) {
        didSet {
            self.avatarBtn.setImage(self.image, for: .normal)
        }
    }
    
    var avatarBtn = UIButton()
    var addAvatarBtn = UIButton()
    
    //----------------------------------------------------------------------
    
    let socNetLbl = UILabel()
    
    let faceBtn = UIButton()
    let instBtn = UIButton()
    let twitBtn = UIButton()
    
    //----------------------------------------------------------------------
    
    var nextVcBtn = UIButton()

    //----------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        let name = self.nameField.text ?? ""
        let age = self.ageField.text ?? "0"
        let city = self.cityFiled.text ?? ""
        
        let isReg = self.stand.selectedSegmentIndex == 0
        
        self.output.saveUserData(with: name, city: city, age: age, isReg: isReg)
    }
}

extension UserInfoRegistrationVC: UserInfoRegViewProtocolInput {
    
    func configureView(with user: User) {
        self.user = user
        
        self.nameField.text = user.login
        self.ageField.text = String(user.age)
        self.cityFiled.text = user.city
        
        self.stand.selectedSegmentIndex = user.standIsRegular ? 0 : 1
        
        if let imageData = user.avatarImageData {
            self.image = UIImage(data: imageData)?.withRenderingMode(.alwaysTemplate)
        } else {
            self.image = UIImage(named: "Registration/avatar")?.withRenderingMode(.alwaysTemplate)
        }
        
    }
    
    func setUp() {
        self.setUpUI()
    }
}

extension UserInfoRegistrationVC {
    
    func setUpUI(){
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
        
        //Сделанно с точки зрения читабельности View
        if self.isRegistration {
            let bottom = self.addHeader()
            self.addUsersFiled(topAnchor: bottom)
            
            self.addAvatarView(headerBottom: nil)
            
            self.addSocialetworks()
            
            self.addBtn()
        } else {
            let bottom = self.addHeader()
            self.addAvatarView(headerBottom: bottom)
            
            self.addUsersFiled(topAnchor: self.avatarBtn.bottomAnchor)
            
            self.addBtn()
            
            self.addSocialetworks()
            
        }
        
        self.view.layoutIfNeeded()
        self.avatarBtn.layer.cornerRadius = self.avatarBtn.frame.height / 2
        self.avatarBtn.frame.size.width = self.avatarBtn.frame.height
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        self.view.addGestureRecognizer(tapRecognizer)
        
    }
    
    func addHeader() -> NSLayoutYAxisAnchor {
        if self.isRegistration{
            let header = RegHeaderView(step: .userInfo, parentView: self.view)
            return header.bottomAnchor
        } else {
            let label  = UILabel()
            self.view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 33).isActive = true
            label.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
            label.font = UIFont.systemFont(ofSize: 46)
            label.textColor = .white
            label.text = "Settings"
            
            return label.bottomAnchor
        }
    }
    
    func addUsersFiled(topAnchor: NSLayoutYAxisAnchor) {
        
        self.textFiledSetUp(field: self.nameField, with: topAnchor , constant: 30, and: .name)
        self.textFiledSetUp(field: self.cityFiled, with: self.nameField.bottomAnchor, and: .city)
        self.textFiledSetUp(field: self.ageField, with: self.cityFiled.bottomAnchor, and: .age)
        
        self.stand = UISegmentedControl(items: ["Regular","Goofy"])
        
        self.view.addSubview(self.stand)
        
        self.stand.setTitle("Regular", forSegmentAt: 0)
        self.stand.setTitle("Goofy", forSegmentAt: 1)
        
        self.stand.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        
        self.stand.selectedSegmentTintColor = UIColor(red: 0.131, green: 0.309, blue: 0.939, alpha: 1)
        self.stand.tintColor = .red
        
        self.stand.backgroundColor = UIColor(red: 0.314, green: 0.314, blue: 0.314, alpha: 1)
        self.stand.selectedSegmentIndex = 0
        
        self.stand.translatesAutoresizingMaskIntoConstraints = false
        
        self.stand.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -33).isActive = true
        self.stand.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant:  33).isActive = true
        self.stand.topAnchor.constraint(equalTo: self.ageField.bottomAnchor, constant:  15).isActive = true
        self.stand.heightAnchor.constraint(equalTo: self.ageField.heightAnchor).isActive = true
    }
    
    @objc func addAvatarBtnIsSelected() {
        self.output.openPhotoPicker()
    }
    
    @objc func avatarBtnIsSelected() {
        self.output.openCameraPicker()
    }
    
    func addAvatarView(headerBottom: NSLayoutYAxisAnchor?) {
        
        self.view.addSubview(self.avatarBtn)
        self.avatarBtn.addTarget(self, action: #selector(avatarBtnIsSelected), for: .touchUpInside)
        self.avatarBtn.translatesAutoresizingMaskIntoConstraints = false
        self.avatarBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 33).isActive = true
        
        if self.isRegistration {
            
            self.avatarBtn.topAnchor.constraint(equalTo: self.stand.bottomAnchor, constant: 26).isActive = true
            self.avatarBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
            self.avatarBtn.widthAnchor.constraint(equalTo: self.avatarBtn.heightAnchor).isActive = true
        } else {
            
            self.avatarBtn.topAnchor.constraint(equalTo: headerBottom!, constant: 37).isActive = true
            let height = self.avatarBtn.heightAnchor.constraint(equalToConstant: 80)
            height.isActive = true
            let  width = self.avatarBtn.widthAnchor.constraint(equalTo: self.avatarBtn.heightAnchor)
            width.isActive = true
        }
        
        self.avatarBtn.layer.borderWidth = 1
        self.avatarBtn.layer.borderColor = UIColor(red: 0.314, green: 0.314, blue: 0.314, alpha: 1).cgColor

        self.avatarBtn.setImage(self.image, for: .normal)
        self.avatarBtn.imageView?.tintColor = UIColor(red: 0.314, green: 0.314, blue: 0.314, alpha: 1.0)
        
        self.avatarBtn.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8 )
        
        self.view.addSubview(self.addAvatarBtn)
        self.addAvatarBtn.addTarget(self, action: #selector(self.addAvatarBtnIsSelected), for: .touchUpInside)
        self.addAvatarBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.addAvatarBtn.leftAnchor.constraint(equalTo: self.avatarBtn.rightAnchor, constant: 22).isActive = true
        self.addAvatarBtn.centerYAnchor.constraint(equalTo: self.avatarBtn.centerYAnchor).isActive = true
        
        let attrs : [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 19.0),
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.underlineStyle : 1]

        let buttonTitleStr = NSMutableAttributedString(string: "Download", attributes:attrs)
        
        self.addAvatarBtn.setAttributedTitle(buttonTitleStr, for: .normal)
    }
    
    func addSocialetworks() {
        
        guard ScreenTheme.isXFormat else { return }
        
        self.view.addSubview(socNetLbl)
        self.socNetLbl.translatesAutoresizingMaskIntoConstraints = false
        
        self.socNetLbl.leftAnchor.constraint(equalTo: self.avatarBtn.leftAnchor).isActive = true
        if self.isRegistration{
            self.socNetLbl.topAnchor.constraint(equalTo: self.avatarBtn.bottomAnchor, constant: 32).isActive = true
        } else {
            self.socNetLbl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive  = true
        }
        
        self.socNetLbl.font = UIFont.systemFont(ofSize: 18)
        self.socNetLbl.numberOfLines = 2
        self.socNetLbl.lineBreakMode = .byWordWrapping
        
        self.socNetLbl.text = "Add social\nnetwork"
        self.socNetLbl.textColor = .white
        
        self.view.addSubview(self.twitBtn)
        self.twitBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.twitBtn.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -33).isActive = true
        self.twitBtn.centerYAnchor.constraint(equalTo: self.socNetLbl.centerYAnchor).isActive = true
        self.twitBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.twitBtn.widthAnchor.constraint(equalTo: self.twitBtn.heightAnchor).isActive = true
        
        let twitImage = UIImage(named: "Registration/twit")?.withRenderingMode(.alwaysTemplate)
        self.twitBtn.setImage(twitImage, for: .normal)
        self.twitBtn.tintColor = .white
        self.twitBtn.addTarget(self, action: #selector(self.openInst), for: .touchUpInside)
        
        self.view.addSubview(self.instBtn)
        self.instBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.instBtn.rightAnchor.constraint(equalTo: self.twitBtn.leftAnchor, constant: -22).isActive = true
        self.instBtn.centerYAnchor.constraint(equalTo: self.socNetLbl.centerYAnchor).isActive = true
        self.instBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.instBtn.widthAnchor.constraint(equalTo: self.instBtn.heightAnchor).isActive = true
        
        let instImage = UIImage(named: "Registration/inst")?.withRenderingMode(.alwaysTemplate)
        self.instBtn.setImage(instImage, for: .normal)
        self.instBtn.tintColor = .white
        self.instBtn.addTarget(self, action: #selector(self.openInst), for: .touchUpInside)
        
        self.view.addSubview(self.faceBtn)
        self.faceBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.faceBtn.rightAnchor.constraint(equalTo: self.instBtn.leftAnchor, constant: -22).isActive = true
        self.faceBtn.centerYAnchor.constraint(equalTo: self.socNetLbl.centerYAnchor).isActive = true
        self.faceBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.faceBtn.widthAnchor.constraint(equalTo: self.faceBtn.heightAnchor).isActive = true
        self.faceBtn.addTarget(self, action: #selector(self.openInst), for: .touchUpInside)
        
        let faceImage = UIImage(named: "Registration/facebook")?.withRenderingMode(.alwaysTemplate)
        self.faceBtn.setImage(faceImage, for: .normal)
        self.faceBtn.tintColor = .white
    }
    
    @objc func openInst() {
        
        let alert = UIAlertController(title: "While you can’t add your social network, but you can subscribe to us", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Let's go", style: .default, handler: { (_) in
            let instagramHooks = "instagram.com/wins_app?igshid=uc289nm1r62l"
            let instagramUrl = URL(string: instagramHooks)
            if let url = instagramUrl,UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            } else {
              //redirect to safari because the user doesn't have Instagram
                UIApplication.shared.open(URL(string: "http://instagram.com/")!)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Maybe later", style: .cancel, handler: nil))
        self.output.openAlert(alert: alert)
    }
    
    func addBtn() {
        
        self.view.addSubview(self.nextVcBtn)
        self.nextVcBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextVcBtn.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -33).isActive = true
        self.nextVcBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant:  33).isActive = true
        
        if self.isRegistration{
            self.nextVcBtn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            self.nextVcBtn.topAnchor.constraint(equalTo: self.stand.bottomAnchor, constant: 18).isActive = true
        }
        self.nextVcBtn.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        self.nextVcBtn.backgroundColor = UIColor(red: 0.131, green: 0.309, blue: 0.939, alpha: 1)
        self.nextVcBtn.layer.cornerRadius = 6
        if self.isRegistration{
            self.nextVcBtn.setTitle("Next", for: .normal)
        }else{
            self.nextVcBtn.setTitle("Change Sport", for: .normal)
        }
        self.nextVcBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        self.nextVcBtn.addTarget(self, action: #selector(self.nextVC), for: .touchUpInside)
    }
    
    @objc func nextVC(){
        
        if self.isRegistration {
            self.output.openNextStep()
        } else {
            self.output.openSportVC()
        }
    }

    @objc func hideKeyboard() {
        self.nameField.resignFirstResponder()
        self.cityFiled.resignFirstResponder()
        self.ageField.resignFirstResponder()
    }

    func textFiledSetUp(field: UserField, with top: NSLayoutYAxisAnchor,constant: CGFloat = 15, and type: TextFiledType) {
        
        self.view.addSubview(field)
        field.translatesAutoresizingMaskIntoConstraints = false
        
        field.topAnchor.constraint(equalTo: top, constant: constant).isActive = true
        field.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -33).isActive = true
        field.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 33).isActive = true
        field.heightAnchor.constraint(equalToConstant: 65).isActive = true

        field.configure(type: type)
    }
}

extension UserInfoRegistrationVC {
    class SocialNetWorkView: UIView {
        //потом напиcать нормально
    }
}

extension UserInfoRegistrationVC {
    
    class UserField: UITextField {
        func configure(type: TextFiledType) {
            
            let attributes: [NSAttributedString.Key : Any] = [.font : UIFont.systemFont(ofSize: 18), .foregroundColor : UIColor(red: 0.314, green: 0.314, blue: 0.314, alpha: 1)]
            let attributedString = NSAttributedString(string: type.rawValue, attributes: attributes)
            self.attributedPlaceholder = attributedString

            self.keyboardType = type.keyboardType
            
            self.textColor = .white

            self.layer.borderColor = UIColor(red: 0.314, green: 0.314, blue: 0.314, alpha: 1).cgColor
            self.layer.borderWidth = 1
            self.layer.cornerRadius = 4

            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
    }

    enum TextFiledType: String {
        
        case name = "Your name"
        case city = "Your city"
        case age = "Your age"

        var keyboardType: UIKeyboardType {
            switch self {
            case .name:
                return .namePhonePad
            case .city:
                return .asciiCapable
            case .age:
                return .numberPad
            }
        }
    }
}

enum SocialNetWork: Int {
    case instagram = 0
    case facebook
    case twiter
}

extension UserInfoRegistrationVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showCameraPicker() {
        
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = UIImagePickerController.SourceType.camera
            imagePickerController.allowsEditing = true
            self.present(imagePickerController, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "Sorry, you don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showImagePicker() {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePickerController.allowsEditing = true
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        if let image = info[.editedImage] as? UIImage {
            self.avatarBtn.setImage(image, for: .normal)
            self.avatarBtn.imageView!.bounds = self.avatarBtn.imageView!.frame
            self.avatarBtn.imageView!.layer.cornerRadius = self.avatarBtn.imageView!.frame.size.width / 2
            self.output.setUserImage(image: image)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated:  true, completion: nil)
    }
    
}

