//
//  KeyInfoView.swift
//  Linc
//
//  Created by Suenn Wern Tan on 11/11/2025.
//
import SwiftUI

// A small data model for each "card"
struct ActionItem: Identifiable {
    let id = UUID()
    let symbol: String   // SF Symbol name
    let title: String
    let subtitle: String
}

// The visual card UI
struct KeyInfoView: View {
    let item: ActionItem

    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            // icon in the top-left
            ZStack(){
                Image(item.symbol)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.primary300)
                //                .background(Color.clear)
                //                .cornerRadius(10)
            }
            // Title and subtitle
            VStack(alignment: .leading, spacing: 4){
                Text(item.title)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.primary)
                    .fixedSize(horizontal: false, vertical: true) // allow multiline
                
                Text(item.subtitle)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
        }
        .padding(12)
//        .padding(.vertical, 12)
//        .padding(.horizontal, 10)
//        .frame(width: 170, height: 170)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.primary300, lineWidth: 0.5)
        )
        .shadow(color: Color.black.opacity(0.02), radius: 1, x: 0, y: 1)
    }
}

// The grid that arranges the cards
struct KeyInfoGridView: View {
    let items: [ActionItem] = [
        ActionItem(symbol: "home", title: "Mom got home safely", subtitle: "Got home at 15:30"),
        ActionItem(symbol: "document", title: "Store discharge papers", subtitle: "Keep for doctor visit"),
        ActionItem(symbol: "phonebook", title: "Save doctor's number", subtitle: "04-5734-3523"),
        ActionItem(symbol: "home-1", title: "Phone nearby", subtitle: "Emergency numbers visible")
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Hour 1 critical actions")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black.opacity(0.6))
                .padding(.horizontal, 20)
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(items) { item in
                    KeyInfoView(item: item)
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.vertical, 15)
    }
}

#Preview(){
    KeyInfoGridView()
}
