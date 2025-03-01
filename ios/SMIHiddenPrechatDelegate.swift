//
//  SMIHiddenPrechatDelegate.swift
//  SalesforceMessaging
//
//  Created by Paul Goergen on 2/27/25.
//

import SMIClientCore

class HiddenPrechatDelegateImplementation: HiddenPreChatDelegate {
    static let shared = HiddenPrechatDelegateImplementation()
    
    var driverExternalId: String?

  func core(_ core: CoreClient,
            conversation: Conversation,
            didRequestPrechatValues hiddenPreChatFields: [HiddenPreChatField],
            completionHandler: HiddenPreChatValueCompletion) {

    // Use the conversation object to inspect info about the conversation

        // Fill in all the hidden pre-chat fields
        for it in hiddenPreChatFields {
            switch it.name {
                case "Driver_External_ID": it.value = driverExternalId
//                case "Driver_External_ID": it.value = "driver_LPPD93VQJH"
                default: print("Unknown hidden prechat field: \(it.name)")
            }
          }

    // Pass pre-chat fields back to SDK
    completionHandler(hiddenPreChatFields)
  }
}
