import SwiftUI

struct RecentView: View {
    // Sample data for recently viewed items
    let recentItems = [
        RecentItem(title: "最近查看的内容 1", date: "今天 10:30", category: "分类一 > 子分类1-2"),
        RecentItem(title: "最近查看的内容 2", date: "今天 09:15", category: "分类三 > 子分类3-1"),
        RecentItem(title: "最近查看的内容 3", date: "昨天 16:45", category: "分类二 > 子分类2-3"),
        RecentItem(title: "最近查看的内容 4", date: "昨天 14:20", category: "分类五 > 子分类5-2"),
        RecentItem(title: "最近查看的内容 5", date: "前天 11:10", category: "分类四 > 子分类4-1"),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("最近浏览")
                .font(.headline)
                .padding()
            
            if recentItems.isEmpty {
                // Empty state
                VStack {
                    Image(systemName: "clock.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                    
                    Text("暂无最近浏览记录")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(.top)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                // Recent items list
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(recentItems) { item in
                            RecentItemView(item: item)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

struct RecentItem: Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let category: String
}

struct RecentItemView: View {
    let item: RecentItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(item.title)
                .font(.headline)
                .foregroundColor(.black)
            
            HStack {
                Text(item.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text(item.category)
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(10)
    }
} 