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
                chatVC.view.removeFromSuperview()
                let delegate = SalesforceClientDelegate()
                delegate.addPrechatVars(externalId: externalId)
                chatVC = SalesforceHostingController()
                addSubview(chatVC.view)
            }
        }
    }
    
    required init(appContext: AppContext? = nil) {
        super.init(appContext: appContext)
        chatVC = SalesforceHostingController()
        addSubview(chatVC.view)
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
          chatVC.view.frame = bounds
    }
}
