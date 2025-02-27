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
    let hostingController: UIHostingController<SalesforceSwiftUIView>!
    
    required init(config: UIConfiguration) {
        let swiftUIView = SalesforceSwiftUIView(config: config)
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
