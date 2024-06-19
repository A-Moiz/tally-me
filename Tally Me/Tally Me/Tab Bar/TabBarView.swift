//
//  HomeView.swift
//  Tally Me
//
//  Created by Abdul Moiz on 19/06/2024.
//

import SwiftUI

struct TabBarView: View {
    @State private var activeTab: Tab = .home
    @Namespace private var animation
    @Environment(\.colorScheme) var colourScheme
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                Text("Home")
                    .tag(Tab.home)
                    .toolbar(.hidden, for: .tabBar)
                
                ProfileView()
                    .tag(Tab.profile)
                    .toolbar(.hidden, for: .tabBar)
            }
            
            CustomTabBar()
        }
    }
    
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(tint: .orange, inactiveTint: .orange, tab: $0, animation: animation, activeTab: $activeTab)
            }
        }
        .padding(.horizontal, 15)
        .padding(.top, 10)
        .background(content: {
            Rectangle()
                //.fill(.white)
                .fill((colourScheme == .dark ? .black : .white))
                .ignoresSafeArea()
                .shadow(color: .orange.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
        })
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}

struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .white : inactiveTint)
                .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58 : 35)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? tint : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            activeTab = tab
        }
    }
}

#Preview {
    TabBarView()
}
