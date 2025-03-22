import SwiftUI

struct HomeView: View {
    @State private var selectedFirstTab: Int = 0
    @State private var selectedSecondTab: Int = 0
    
    // Sample data for first-level tabs
    let firstLevelTabs = ["分类一", "分类二", "分类三", "分类四", "分类五"]
    
    // Sample data for second-level tabs based on first-level selection
    let secondLevelTabs: [[String]] = [
        ["子分类1-1", "子分类1-2", "子分类1-3"],
        ["子分类2-1", "子分类2-2", "子分类2-3", "子分类2-4"],
        ["子分类3-1", "子分类3-2"],
        ["子分类4-1", "子分类4-2", "子分类4-3", "子分类4-4", "子分类4-5"],
        ["子分类5-1", "子分类5-2", "子分类5-3"]
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // First level tab bar
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<firstLevelTabs.count, id: \.self) { index in
                        FirstLevelTabItem(
                            title: firstLevelTabs[index],
                            isSelected: index == selectedFirstTab
                        )
                        .onTapGesture {
                            selectedFirstTab = index
                            selectedSecondTab = 0  // Reset second tab when first tab changes
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
            }
            .background(Color.white)
            
            // Second level tab bar
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<secondLevelTabs[selectedFirstTab].count, id: \.self) { index in
                        SecondLevelTabItem(
                            title: secondLevelTabs[selectedFirstTab][index],
                            isSelected: index == selectedSecondTab
                        )
                        .onTapGesture {
                            selectedSecondTab = index
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
            }
            .background(Color.gray.opacity(0.1))
            
            // Content area based on selected tabs
            ZStack {
                if hasSampleContent(firstTab: selectedFirstTab, secondTab: selectedSecondTab) {
                    ScrollView {
                        LazyVStack(spacing: 15) {
                            ForEach(1...10, id: \.self) { item in
                                ListItemView(title: "内容 \(item)", 
                                             firstTab: firstLevelTabs[selectedFirstTab], 
                                             secondTab: secondLevelTabs[selectedFirstTab][selectedSecondTab])
                            }
                        }
                        .padding()
                    }
                } else {
                    // Empty state
                    VStack {
                        Image(systemName: "tray")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        
                        Text("当前为空")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding(.top)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    // Function to determine if a tab combination has content (for demo purposes)
    private func hasSampleContent(firstTab: Int, secondTab: Int) -> Bool {
        // For demo, let's just show some tabs as empty
        return !((firstTab == 1 && secondTab == 2) || 
                 (firstTab == 3 && secondTab == 1) || 
                 (firstTab == 4 && secondTab == 0))
    }
}

struct FirstLevelTabItem: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Text(title)
            .font(.system(size: 16, weight: isSelected ? .bold : .regular))
            .foregroundColor(isSelected ? .blue : .black)
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(isSelected ? Color.blue.opacity(0.1) : Color.clear)
            .cornerRadius(16)
    }
}

struct SecondLevelTabItem: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Text(title)
            .font(.system(size: 14))
            .foregroundColor(isSelected ? .blue : .gray)
            .padding(.vertical, 6)
            .padding(.horizontal, 10)
            .background(isSelected ? Color.blue.opacity(0.1) : Color.clear)
            .cornerRadius(12)
    }
}

struct ListItemView: View {
    let title: String
    let firstTab: String
    let secondTab: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.bottom, 4)
            
            Text("分类: \(firstTab) > \(secondTab)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
} 