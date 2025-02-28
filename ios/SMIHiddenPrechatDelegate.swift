//
//  SMIHiddenPrechatDelegate.swift
//  SalesforceMessaging
//
//  Created by Paul Goergen on 2/27/25.
//

import SMIClientCore

class HiddenPrechatDelegateImplementation: HiddenPreChatDelegate {
    var driverExternalId: String?
    
    init(driverExternalId: String? = nil) {
        print("Inside the delegate")
        self.driverExternalId = driverExternalId
    }

  func core(_ core: CoreClient,
            conversation: Conversation,
            didRequestPrechatValues hiddenPreChatFields: [HiddenPreChatField],
            completionHandler: HiddenPreChatValueCompletion) {

    // Use the conversation object to inspect info about the conversation
        print("Running")
      
        let preChatData: [String: String?] = [
          "Driver_External_ID": driverExternalId,
        ]

        // Fill in all the hidden pre-chat fields
        for preChatField in hiddenPreChatFields {
            if let fieldValue = preChatData[preChatField.label] {
              preChatField.value = fieldValue
            }
          }

    // Pass pre-chat fields back to SDK
    completionHandler(hiddenPreChatFields)
  }
}
