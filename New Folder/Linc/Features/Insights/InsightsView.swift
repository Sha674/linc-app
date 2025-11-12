//
//  InsightsView.swift
//  Linc
//
//  Created by Suenn Wern Tan on 11/11/2025.
//

import SwiftUI

struct InsightsView: View {
    @Binding var showTabView: Bool
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack(alignment: .top){
            BackgroundView()
            VStack{
                TopBarView(onBack: { dismiss() })
                ScrollView{
                    VStack(spacing: 24){
                        BannerView(name:"Margaret Chen", days:"Day 1, Hour 1")
                        KeyInfoGridView()
                        AlertView()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 20)
                }
            }
        }
        .onAppear { showTabView = false }
        .onDisappear { showTabView = true }
        // Ẩn thanh điều hướng mặc định để không có mũi tên hệ thống
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    InsightsView(showTabView: .constant(true))
}
