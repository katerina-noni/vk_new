//
//  ViewController.swift
//  VK App New
//
//  Created by Екатерина on 21/10/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit

class LoginControler: UIViewController {
//MARK: - Outlet
    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGR)
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }


    @IBAction func logInButton(_ sender: Any) {
        guard let login = loginTextField.text,
            let password = passwordTextField.text,
        login == "",
        password == "" else {
            show(message: "Incorrect login/password")
            return
            
        }
        
        performSegue(withIdentifier: "Login Segue", sender: nil)
    }
    
    @objc func willShowKeyboard(_ notification: Notification) {
        guard let info = notification.userInfo as NSDictionary?,
        let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else { return }
        let keyboardHeight = keyboardSize.cgRectValue.size.height
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
    }
    @objc func willHideKeyboard(_ notification: Notification) {
        scrollView.contentInset = .zero
        
    }
    @objc func viewTapped() {
        view.endEditing(true)
    }
}

