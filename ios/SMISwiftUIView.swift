//
//  SMISwiftUIView.swift
//  SalesforceMessaging
//
//  Created by Paul Goergen on 2/27/25.
//


import SwiftUI
import SMIClientUI
import SMIClientCore

struct SalesforceSwiftUIView: View {
    @State var config: UIConfiguration
    
    var body: some View {
        return Interface(config)
    }
 }
