//
//  SMIClientDelegate.swift
//  SalesforceMessaging
//
//  Created by Paul Goergen on 2/27/25.
//

import SMIClientCore
import SMIClientUI

class SalesforceClientDelegate {
    var client: CoreClient?
    var config: UIConfiguration?
    
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
        }
        
        
    }
    
    func addPrechatVars(externalId: String) {
        print("driverExternalID \(externalId)")
        if let tempClient = client {
            let myPreChatDelegate = HiddenPrechatDelegateImplementation(driverExternalId: externalId)
            tempClient.preChatDelegate = myPreChatDelegate
            if let delegateExists = tempClient.preChatDelegate {
                print("Prechat delegate added!")
            } else {
                print("Unable to add prechat delegate")
            }
            client = tempClient
            print("client?.state.rawValue \(client?.state.rawValue)")
            print("client?.realtimeConnectionState.rawValue \(client?.realtimeConnectionState.rawValue)")
        }
    }
}
