//
//  SMIHostingController.swift
//  SalesforceMessaging
//
//  Created by Paul Goergen on 2/27/25.
//

import SwiftUI
import SMIClientUI
import SMIClientCore

class SalesforceHostingController: UIViewController {
    let hostingController: UIHostingController<SalesforceSwiftUIView>?
    
    required init() {
        let delegate = SalesforceClientDelegate()
        if let config = delegate.config {
            let swiftUIView = SalesforceSwiftUIView(config: config)
            hostingController = UIHostingController(rootView: swiftUIView)
            print("SwiftUIView initialized")
        } else {
            hostingController = nil
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let controller = hostingController {
            // Add the hosting controller as a child view controller
            addChild(controller)
            
            // Add the hosting controller's view to your view hierarchy
            controller.modalPresentationStyle = .currentContext
            controller.view.frame = view.bounds // set the frame
            controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.addSubview(controller.view)
            
            // Notify the hosting controller that it's been added
            controller.didMove(toParent: self)
            print("SwiftUIView added")
        }
    }
}
