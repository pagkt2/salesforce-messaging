import ExpoModulesCore
import WebKit
import SMIClientUI

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class SalesforceMessagingView: ExpoView {
  required init(appContext: AppContext? = nil) {
      super.init(appContext: appContext)
      
      
      // Get a URL for the service API path
      guard let serviceAPIURL = URL(string: "https://curri.my.salesforce-scrt.com") else {
          // TO DO: Handle error
          return
      }

      // Generate a random conversation ID
      // (But be sure to use the SAME conversation ID if you want
      // to continue this conversation across app restarts or
      // across devices!)
      let conversationID = UUID()

      // Create a configuration object
      let config = UIConfiguration(serviceAPI: serviceAPIURL,
                                   organizationId: "00DHs00000CnigT",
                                   developerName: "Messaging_for_Mobile",
                                   conversationId: conversationID)

      let chatVC = InterfaceViewController(config)
      chatVC.navigationController
      
      // Find the nearest view controller to present from
      if let parentVC = findViewController() {
          parentVC.present(chatVC, animated: true, completion: nil)
      }
  }
    
    
  // Updated function to find a UIViewController safely in iOS 13+
  private func findViewController() -> UIViewController? {
      var responder: UIResponder? = self
      while let nextResponder = responder?.next {
          if let viewController = nextResponder as? UIViewController {
              return viewController
          }
          responder = nextResponder
      }

      // Use the active scene’s key window in iOS 13+
      if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
          return scene.windows.first { $0.isKeyWindow }?.rootViewController
      }
      
      return nil
  }
}

