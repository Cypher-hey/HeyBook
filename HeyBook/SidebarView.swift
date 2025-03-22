import SwiftUI

struct SidebarView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            // Semi-transparent background
            if isShowing {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isShowing = false
                        }
                    }
            }
            
            // Sidebar content
            HStack {
                Spacer()
                
                ZStack {
                    // Sidebar background
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.white)
                        .frame(width: UIScreen.main.bounds.width * 0.75)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: -5, y: 0)
                    
                    // Sidebar content
                    VStack(alignment: .leading, spacing: 0) {
                        // Header
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                withAnimation {
                                    isShowing = false
                                }
                            }) {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.gray)
                                    .padding()
                            }
                        }
                        
                        // User info
                        VStack(alignment: .center, spacing: 10) {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70)
                                .foregroundColor(.blue)
                            
                            Text("用户名")
                                .font(.headline)
                            
                            Text("普通会员")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        
                        Divider()
                        
                        // Menu items
                        ScrollView {
                            VStack(spacing: 0) {
                                SidebarMenuItem(icon: "house.fill", title: "首页")
                                SidebarMenuItem(icon: "star.fill", title: "我的关注")
                                SidebarMenuItem(icon: "bookmark.fill", title: "我的收藏")
                                SidebarMenuItem(icon: "clock.fill", title: "浏览历史")
                                SidebarMenuItem(icon: "bell.fill", title: "消息中心")
                                SidebarMenuItem(icon: "envelope.fill", title: "意见反馈")
                                SidebarMenuItem(icon: "gearshape.fill", title: "设置")
                                SidebarMenuItem(icon: "info.circle.fill", title: "关于我们")
                            }
                        }
                        
                        Spacer()
                        
                        // Logout button
                        Button(action: {
                            // Logout action
                        }) {
                            HStack {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                    .foregroundColor(.red)
                                
                                Text("退出登录")
                                    .foregroundColor(.red)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.75)
                }
                .offset(x: isShowing ? 0 : UIScreen.main.bounds.width)
                .animation(.default, value: isShowing)
            }
        }
        .ignoresSafeArea()
    }
}

struct SidebarMenuItem: View {
    let icon: String
    let title: String
    
    var body: some View {
        Button(action: {
            // Menu item action
        }) {
            HStack(spacing: 15) {
                Image(systemName: icon)
                    .font(.system(size: 18))
                    .foregroundColor(.blue)
                    .frame(width: 24)
                
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
        }
        .background(Color.white)
    }
} 