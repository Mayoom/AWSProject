//
//  ViewController.swift
//  AWSProject
//
//  Created by Maryamalmoqbali on 2/29/20.
//  Copyright © 2020 Maryamalmoqbali. All rights reserved.
//

import UIKit
import AWSAuthCore
import AWSAuthUI
import AWSMobileClient
import AWSUserPoolsSignIn

class ViewController: UIViewController {
    

    @IBOutlet weak var txtAccessToken: UITextView!
    @IBOutlet weak var txtTokenID: UITextView!
    @IBOutlet weak var txtpass: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtemail.text = "mayoom"
        txtpass.text = "Mayoom91!"
     
    }
    
    
    
    @IBAction func Login(_ sender: Any) {
      showlogintoken()
     
   }
      func getPhoneJWT() {
          AWSCognitoUserPoolsSignInProvider.sharedInstance().getUserPool().token().continueWith { (AWSTask) -> Any? in
              if AWSTask.error == nil {
                  print("Token \(String(describing: AWSTask.result))")
                self.txtTokenID.text! = AWSTask.result! as String

              }else{
                  print(AWSTask.error)
              }
              return nil
          }
    }
        

    
    func accesstoken(){
    AWSMobileClient.default().getTokens { (tokens, error) in
        if let error = error {
            print("Error getting token \(error.localizedDescription)")
        } else if let tokens = tokens {
            print("This is access token \(tokens.accessToken!.tokenString!)")
            DispatchQueue.main.async{
            self.txtAccessToken.text! = tokens.accessToken!.tokenString!
            }
        }
    }
    
    
    }
 
    func showlogintoken() {


        guard let username = txtemail.text,
            let password = txtpass.text  else {
                print("Enter some values please.")
                return
        }

        print("\(username) and \(password)")

        AWSMobileClient.sharedInstance().signIn(username: username, password: password) {
            (signInResult, error) in

            if let error = error  {
                print("There's an error : \(error.localizedDescription)")
                print(error)
                return
            }

            guard let signInResult = signInResult else {
                return
            }

            switch (signInResult.signInState) {
            case .signedIn:
                print("User is signed in.")
                  
                DispatchQueue.main.async {
//                    let mainViewController = MainViewController()
//                    UIApplication.setRootView(mainViewController)
                  self.getPhoneJWT()
                    self.accesstoken()
                    print("Done...")
                }

            case .newPasswordRequired:
                print("User needs a new password.")
            default:
                print("Sign In needs info which is not et supported.")
            }
        }
    }

}
