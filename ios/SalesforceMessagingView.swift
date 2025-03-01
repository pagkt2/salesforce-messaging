import ExpoModulesCore
import SMIClientUI
import SMIClientCore

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class SalesforceMessagingView: ExpoView {
    private var chatVC: UIViewController!
    
    var driverExternalId: String? {
        didSet {
            if let externalId = driverExternalId {
                let prechatDelegate = HiddenPrechatDelegateImplementation.shared
                prechatDelegate.driverExternalId = externalId
                if let client = SalesforceClientDelegate.shared.client {
                    client.setPreChatDelegate(delegate: prechatDelegate, queue: .main)
                }
                chatVC = SalesforceHostingController()
                addSubview(chatVC.view)
                
            }
        }
    }
    
    required init(appContext: AppContext? = nil) {
        super.init(appContext: appContext)
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
          chatVC.view.frame = bounds
    }
    
    func propsRetrieved() {
        print("Props retrieved!")
    }
}
