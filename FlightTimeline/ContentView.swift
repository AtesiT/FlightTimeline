import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
            //  Размещаем иконки в TabBar с помощью tabItem
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Home")
                }
            UserProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    ContentView()
}
