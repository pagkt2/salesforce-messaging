import ExpoModulesCore
import WebKit
import SMIClientUI
import SMIClientCore
import SwiftUI
import UIKit

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class SalesforceMessagingView: ExpoView {
    let chatVC = SalesforceController()
    
    required init(appContext: AppContext? = nil) {
        super.init(appContext: appContext)
        clipsToBounds = true

        addSubview(chatVC.view)
    }
    
    override func layoutSubviews() {
        chatVC.view.frame = bounds
    }
}

class SalesforceController: UIViewController {
    let chatVC: UIViewController
    
    required init() {
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
        
        chatVC = InterfaceViewController(config)
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Now the view controller's view is ready, add chatVC's view
                addChild(chatVC)
                view.addSubview(chatVC.view)
                chatVC.view.frame = view.bounds
                chatVC.didMove(toParent: self)
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
