//
//  SalesforceMessengerViewController.swift
//  SalesforceMessaging
//
//  Created by Paul Goergen on 2/24/25.
//

import ExpoModulesCore
import WebKit
import SMIClientUI
import SMIClientCore
import SwiftUI

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class Controller: UIViewController {
    let uiConfiguration: SMIClientUI.UIConfiguration?
    
    init() {
        print("controller initialized")
        // Get a URL for the service API path
        guard let serviceAPIURL = URL(string: "https://curri.my.salesforce-scrt.com") else {
            self.uiConfiguration = nil
            super.init(nibName: nil, bundle: nil)
            return
        }
        
        // Generate a random conversation ID
        // (But be sure to use the SAME conversation ID if you want
        // to continue this conversation across app restarts or
        // across devices!)
        let conversationID = UUID()
        
        // Create a configuration object
        self.uiConfiguration = UIConfiguration(serviceAPI: serviceAPIURL,
                                               organizationId: "00DHs00000CnigT",
                                               developerName: "Messaging_for_Mobile",
                                               conversationId: conversationID)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func startInApp() {
        
        if let config = uiConfiguration {
            print("config \(config) ")
            let controller = InterfaceViewController(config)
            
            self.navigationController?.pushViewController(controller, animated: true)
        }}
    
    override func viewDidLoad() {
//                super.viewDidLoad()
        print("viewDidLoad")
            }
  }
