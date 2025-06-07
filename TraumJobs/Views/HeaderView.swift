//
//  HeaderView.swift
//  TraumJobs
//
//  Created by Rylie Castell on 07.06.25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("TraumJobs")
                .font(Fonts.headerText)
        }
        .padding()
        .padding(.top, -24)
        .frame(maxWidth: .infinity)
        .background(Color("PrimaryColor"))
    }
}

#Preview {
    HeaderView()
}
