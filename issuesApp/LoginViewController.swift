//
//  LoginViewController.swift
//  issuesApp
//
//  Created by JUNYOUNG on 2017. 10. 28..
//  Copyright © 2017년 JUNYOUNG. All rights reserved.
//

import UIKit
import OAuthSwift

class LoginViewController: UIViewController {
    
    let oauth: OAuth2Swift = OAuth2Swift (
        consumerKey: "dc275432d5d7268ad0be",
        consumerSecret: "088073f011b485a70f694b0c6d58993476f91c6f",
        authorizeUrl: "https://github.com/login/oauth/authorize",
        accessTokenUrl: "https://github.com/login/oauth/access_token",
        responseType: "code"
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func loginToGitHubButtonTapped() {
        oauth.authorize(
            withCallbackURL: "issuesapp://oauth-callback/github",
                    scope: "user,repo",
                    state: "state",
                    success: { (credential, _, _) in
                        let token = credential.oauthToken
                        print("token: \(token)")
            
        }, failure: { error in
            print(error.localizedDescription)
        })
    }
     
}
