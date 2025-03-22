import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Profile header
                VStack(spacing: 15) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .foregroundColor(.blue)
                    
                    Text("用户名")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("user@example.com")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 20)
                
                // Profile menu items
                VStack(spacing: 0) {
                    ProfileMenuItem(icon: "bookmark.fill", title: "我的收藏", count: 12)
                    ProfileMenuItem(icon: "clock.fill", title: "浏览历史", count: 34)
                    ProfileMenuItem(icon: "bell.fill", title: "消息通知", count: 5)
                    ProfileMenuItem(icon: "gearshape.fill", title: "设置", count: nil)
                    ProfileMenuItem(icon: "questionmark.circle.fill", title: "帮助与反馈", count: nil)
                }
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                
                // App info
                VStack(spacing: 5) {
                    Text("HeyBook")
                        .font(.headline)
                    
                    Text("Version 1.0.0")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.top, 30)
                .padding(.bottom, 20)
            }
            .padding(.top)
        }
        .background(Color.gray.opacity(0.05))
    }
}

struct ProfileMenuItem: View {
    let icon: String
    let title: String
    let count: Int?
    
    var body: some View {
        Button(action: {
            // Menu item action
        }) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 18))
                    .foregroundColor(.blue)
                    .frame(width: 30)
                
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                
                Spacer()
                
                if let count = count {
                    Text("\(count)")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 15)
            .padding(.horizontal)
        }
        .background(Color.white)
        Divider()
            .padding(.leading, 55)
    }
} 