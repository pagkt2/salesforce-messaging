import ExpoModulesCore
import WebKit
import SMIClientUI
import SMIClientCore
import SwiftUI
import UIKit

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class SalesforceMessagingView: ExpoView {
    let chatVC: UIViewController
    
    required init(appContext: AppContext? = nil) {
        chatVC = SalesforceHostingController()
        super.init(appContext: appContext)
        
        clipsToBounds = true
        addSubview(chatVC.view)
    }
    
    override func layoutSubviews() {
        chatVC.view.frame = bounds
    }
}

class SalesforceHostingController: UIViewController {
    let hostingController: UIHostingController<SalesforceSwiftUIView>
    
    required init() {
        let swiftUIView = SalesforceSwiftUIView()
        hostingController = UIHostingController(rootView: swiftUIView)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the hosting controller as a child view controller
        addChild(hostingController)
        
        // Add the hosting controller's view to your view hierarchy
        hostingController.modalPresentationStyle = .currentContext
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
        return Interface(config)
    }
}
