import SwiftUI

struct HomeView: View {
    //  Во flights будет находится сгенерированный массив
    private let flights = FlightInformation.generateFlights()
    
    var body: some View {
        ZStack {
            Image(systemName: "airplane")
                .resizable()
                .frame(width: 250, height: 250)
                .opacity(0.1)
                .rotationEffect(.degrees(-90))
            
            VStack {
                NavigationLink("Arrivals") {
                    FlightBoardView(title: "Arrivals", fligths: flights)
                }
                
                NavigationLink("Departures") {
                    FlightBoardView(title: "Departures", fligths: flights)
                }

                NavigationLink("Flight Timeline") {
                    TimelineView(flights: flights)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
