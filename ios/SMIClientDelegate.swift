    //
//  SMIClientDelegate.swift
//  SalesforceMessaging
//
//  Created by Paul Goergen on 2/27/25.
//

import SMIClientCore
import SMIClientUI

class SalesforceClientDelegate {
    static let shared = SalesforceClientDelegate()
    
    var driverExternalId: String?
    var config: UIConfiguration?
    var client: CoreClient?
    var convoClient: ConversationClient?
    var remoteConfig: RemoteConfiguration? {
        didSet {
            if let config = remoteConfig {
                if let prechatConfig = config.preChatConfiguration {
                    if let fields = prechatConfig.first?.hiddenPreChatFields {
                        dump("hiddenPrechatFields \(fields)")
                    }
                }
            }
        }
    }
    
    init() {
        guard let serviceAPIURL = URL(string: "https://curri.my.salesforce-scrt.com") else {
            print("Bad URL")
            return
        }
        
        // Generate a random conversation ID
        // (But be sure to use the SAME conversation ID if you want
        // to continue this conversation across app restarts or
        // across devices!)
        let conversationID = UUID()
        
        // Create a configuration object
        config = UIConfiguration(serviceAPI: serviceAPIURL,
                                     organizationId: "00DHs00000CnigT",
                                     developerName: "Messaging_for_Mobile",
                                     conversationId: conversationID)
        
        if let config = config {
            client = CoreFactory.create(withConfig: config)
        } else {
            print("Unable to create UIConfiguration")
            return
        }
        
        if let coreClient = client {
            convoClient = coreClient.conversationClient(with: conversationID)
            
            coreClient.retrieveRemoteConfiguration( completion: { (remoteConfig, error) in
                self.remoteConfig = remoteConfig
            })            
        } else {
            print("Unable to create core client")
            return
        }
    }
}
