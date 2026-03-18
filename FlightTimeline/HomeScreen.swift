import SwiftUI

struct HomeScreen: View {
    //  Во flights будет находится сгенерированный массив
    private let flights = FlightInformation.generateFlights()
    
    var body: some View {
        Image(systemName: "airplane")
            .resizable()
            .frame(width: 250, height: 250)
            .opacity(0.1)
            .rotationEffect(.degrees(-90))
    }
}

#Preview {
    HomeScreen()
}
