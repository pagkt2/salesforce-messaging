//
//  SMISwiftUIView.swift
//  SalesforceMessaging
//
//  Created by Paul Goergen on 2/27/25.
//


import SwiftUI
import SMIClientUI

// https://developer.salesforce.com/docs/service/messaging-in-app/guide/ios-ui-sdk.html#step-3-add-the-view-to-your-app

struct SalesforceSwiftUIView: View {
    @State var config: UIConfiguration
    
    var body: some View {
        return Interface(config)
    }
 }
