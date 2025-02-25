import ExpoModulesCore
import WebKit
import SMIClientUI
import SMIClientCore
import SwiftUI
import UIKit

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class SalesforceMessagingView: ExpoView {
    required init(appContext: AppContext? = nil) {
        super.init(appContext: appContext)
        clipsToBounds = true
        
        guard let parentVC = findViewController() else { return }
        
        let chatVC = SalesforceController()
//        chatVC.modalPresentationStyle = .automatic
        
        parentVC.show(chatVC, sender: nil)
    }

    
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

class SalesforceController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
            
            // Create the SwiftUI view
        let swiftUIView = SalesforceSwiftUIView()
        
        // Create a UIHostingController with the SwiftUI view
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        // Add the hosting controller as a child view controller
        addChild(hostingController)
//        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Add the hosting controller's view to your view hierarchy
        hostingController.view.frame = view.bounds // set the frame
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(hostingController.view)
        
        // Notify the hosting controller that it's been added
        hostingController.didMove(toParent: self)
    }
}

struct SalesforceSwiftUIView: View {

    var body: some View {
        let serviceAPIURL = URL(string: "https://curri.my.salesforce-scrt.com")!

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
//        Text("Hello, World!")
        return Interface(config)
    }
}
