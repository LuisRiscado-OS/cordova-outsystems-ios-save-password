import Foundation
//import Capacitor
import UIKit

@objc(SavePassword) class SavePassword: CDVPlugin {

    @objc(promptDialog:)
    func promptDialog(command: CDVInvokedUrlCommand) {
        DispatchQueue.main.async {
            let username = command.arguments[0] as? String ?? ""
            let password = command.arguments[1] as? String ?? ""

            let loginScreen = LoginScreenViewController()
            loginScreen.usernameTextField.text = username
            loginScreen.passwordTextField.text = password
            
            self.viewController.view.addSubview(loginScreen.view)
            loginScreen.view.removeFromSuperview()
            
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "Success")
            self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
}

class LoginScreenViewController: UIViewController {
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.frame.size.width = 1
        textField.frame.size.height = 1
        textField.textContentType = .username
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.frame.size.width = 1
        textField.frame.size.height = 1
        textField.textContentType = .password
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        usernameTextField.becomeFirstResponder()
    }
}