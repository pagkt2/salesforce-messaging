//
//  SMICoreDelegate.swift
//  SalesforceMessaging
//
//  Created by Paul Goergen on 2/28/25.
//

import SMIClientCore

/* Implement this delegate to listen to
   ALL messaging events…
    https://developer.salesforce.com/docs/service/messaging-in-app/guide/ios-core-sdk.html#listen-for-events
*/

class SalesforceCoreDelegate : NSObject, CoreDelegate {
    static let shared = SalesforceCoreDelegate()

  // Received incoming conversation entries
  func core(_ core: CoreClient,
            conversation: Conversation,
            didReceiveEntries entries: [ConversationEntry],
            paged: Bool) {
    // TO DO: Handle event
  }

  // Message status has changed
  func core(_ core: CoreClient,
            conversation: Conversation,
            didUpdateEntries entries: [ConversationEntry]) {
      // TO DO: Handle event
      
    }

  // Conversation was created
  func core(_ core: CoreClient,
            didCreateConversation conversation: Conversation) {
      // TO DO: Handle event
    }

  // Received a started typing event
  func core(_ core: CoreClient,
            didReceiveTypingStartedEvent event: ConversationEntry) {
      // TO DO: Handle event
  }

  // Received a stopped typing event
  func core(_ core: CoreClient,
            didReceiveTypingStoppedEvent event: ConversationEntry) {
      // TO DO: Handle event
  }

  // Network status has changed
  func core(_ core: CoreClient,
            didChangeNetworkState state: NetworkConnectivityState) {
      
      print("Network state: \(state)")
      // TO DO: Handle event
  }

  // Received an error message
  func core(_ core: CoreClient, didError error: Error) {
    // TO DO: Handle an error condition!
      print("Error: \(error)")
  }
    
    func core(_ core: CoreClient, didUpdate conversation: Conversation) {
    // TO DO: Handle an error condition!
        
  }
}
