//
//  InsightsView.swift
//  Linc
//
//  Created by Suenn Wern Tan on 11/11/2025.
//

import SwiftUI

struct InsightsView: View {
    var body: some View {
        ZStack(alignment: .top){
            BackgroundView()
            VStack{
                TopBarView().padding(.horizontal)
                ScrollView{
                    VStack(spacing: 24){
                        BannerView(name:"Margaret Chen", days:"Day 1, Hour 1").padding(.horizontal)
                        KeyInfoGridView().padding(.horizontal)
                        AlertView()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    InsightsView()
}
