import ExpoModulesCore
import WebKit
import SMIClientUI
import SMIClientCore
import SwiftUI

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class SalesforceMessagingView: ExpoView {
    required init(appContext: AppContext? = nil) {
        print("view initialized")
        super.init(appContext: appContext)
        clipsToBounds = true
        
        guard let parentVC = findViewController() else {
                        print("Error: Could not find a suitable UIViewController.")
                        return
                    }
        
        let salesforceController = Controller()
        print("controller gathered")
        salesforceController.startInApp()
        print("main view init complete")
        parentVC.present(salesforceController, animated: true)
        
        
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
