//
//  AddFeedController.swift
//  UDFeeds
//
//  Created by Ipsi Patro on 15/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import UIKit

class AddFeedController: UIViewController {
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var uploadButton: BlueButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let placeholder = "Body Text"
    let start = NSRange(location: 0, length: 0)
    var presenter: AddFeedPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        presenter?.viewDidLoad()
    }
    
    func setUp() {
        self.navigationController?.navigationBar.topItem?.title = ""
        addShadowEffect(view: titleTextField)
        addShadowEffect(view: descriptionTextView)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        descriptionTextView.textContainer.maximumNumberOfLines = 3
        descriptionTextView.textContainer.lineBreakMode = .byTruncatingTail
        titleTextField.returnKeyType = UIReturnKeyType.done
        descriptionTextView.returnKeyType = UIReturnKeyType.done
    }
    
    func addShadowEffect(view: UIView) {
        view.layer.cornerRadius = 3.0
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func uploadButtonTapped(_ sender: Any) {
        self.view?.endEditing(true)
        presenter?.uploadButtonTapped(title: titleTextField.text ?? "", subTitle: descriptionTextView.text)
    }
}

extension AddFeedController: AddFeedView {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func resetFields() {
        descriptionTextView.text = placeholder
        descriptionTextView.textColor = .lightGray
        self.titleTextField.text = ""
    }
    
    func toggleUploadButton(enableFlag: Bool) {
        uploadButton.isEnabled = enableFlag
        uploadButton.alpha = enableFlag ? 1 : 0.4
    }
    
    func toggleLoadingIndicator(show: Bool) {
        let buttonTitle = show ? "" : "Upload"
        uploadButton.setTitle(buttonTitle, for: .normal)
        if show {
            activityIndicator.startAnimating()
        }else {
            activityIndicator.stopAnimating()
        }
    }
}

extension AddFeedController: UITextViewDelegate {
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText:String = textView.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
        
        if updatedText.isEmpty {
            textView.text = placeholder
            textView.textColor = UIColor.lightGray
            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            presenter?.subTitleTextUpdated(subTitle: "")
        }else if textView.textColor == UIColor.lightGray && !text.isEmpty {
            textView.textColor = UIColor.black
            textView.text = text
            presenter?.subTitleTextUpdated(subTitle: textView.text)
        }else if (text == "\n") {
            textView.resignFirstResponder()
        }else {
            return true
        }
        
        return false
    }
    
    
}

extension AddFeedController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.presenter?.titleTextFieldUpdated(title: textField.text ?? "")
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.presenter?.titleTextFieldUpdated(title: textField.text ?? "")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.presenter?.titleTextFieldUpdated(title: textField.text ?? "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}


