import SwiftUI

struct ContentView: View {
    @State private var selectedBottomTab: Int = 0
    @State private var showSidebar: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack(spacing: 0) {
                    // Main content based on bottom tab selection
                    switch selectedBottomTab {
                    case 0:
                        HomeView()
                    case 1:
                        RecentView()
                    case 2:
                        ProfileView()
                    default:
                        HomeView()
                    }
                    
                    // Bottom tab bar
                    CustomTabBar(selectedTab: $selectedBottomTab)
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            // Back button action
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                        }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text("HeyBook")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            withAnimation {
                                showSidebar.toggle()
                            }
                        }) {
                            Image(systemName: "person.circle")
                                .foregroundColor(.black)
                                .frame(width: 30, height: 30)
                        }
                    }
                }
            }
            
            // Sidebar overlay
            SidebarView(isShowing: $showSidebar)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 