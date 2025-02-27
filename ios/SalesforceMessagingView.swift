import ExpoModulesCore
import SMIClientUI
import SMIClientCore

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class SalesforceMessagingView: ExpoView {
    private var chatVC: UIViewController!
    private var config: UIConfiguration!
    
    var driverExternalId: String? {
        didSet {
            if let externalId = driverExternalId {
                // Create an instance of the hidden pre-chat delegate
                let myPreChatDelegate = HiddenPrechatDelegateImplementation(driverExternalId: externalId)

                // Create a core client from a config
                let coreClient = CoreFactory.create(withConfig: config)

                // Assign the hidden pre-chat delegate
                coreClient.preChatDelegate = myPreChatDelegate
                
                chatVC = SalesforceHostingController(config: config)
                addSubview(chatVC.view)
            }
        }
    }
    
    required init(appContext: AppContext? = nil) {
        guard let serviceAPIURL = URL(string: "https://curri.my.salesforce-scrt.com") else {
            super.init(appContext: appContext)
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
        super.init(appContext: appContext)
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        chatVC.view.frame = bounds
    }
}
