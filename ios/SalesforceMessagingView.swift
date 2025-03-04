import ExpoModulesCore
import SMIClientUI
import SMIClientCore

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class SalesforceMessagingView: ExpoView {
    static var shared = SalesforceMessagingView()
    private var chatVC: UIViewController?
    
    
    var driverExternalId: String? {
        didSet {
            if let externalId = driverExternalId {
                let prechatDelegate = HiddenPrechatDelegateImplementation.shared
                let clientDelegate = SalesforceClientDelegate.shared
                
                prechatDelegate.driverExternalId = externalId
                if let client = clientDelegate.client {
                    client.setPreChatDelegate(delegate: prechatDelegate, queue: .main)
                    let coreDelegate = SalesforceCoreDelegate.shared
                    client.addDelegate(delegate: coreDelegate)
                    
                    if let config = clientDelegate.config {
                        chatVC = ModalInterfaceViewController(config)
                    }
                }
            }
        }
    }
    
    required init(appContext: AppContext? = nil) {
        super.init(appContext: appContext)
    }
    
    private func findViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while let nextResponder = responder?.next {
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            responder = nextResponder
        }

        // Use the active scene's key window in iOS 13+
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            return scene.windows.first { $0.isKeyWindow }?.rootViewController
        }
        
        return nil
    }
    
    func openChat() {
        guard let chatVC = chatVC else { return }
        if let rootVC = findViewController() {
            rootVC.present(chatVC, animated: true)
        }
        
    }
}


