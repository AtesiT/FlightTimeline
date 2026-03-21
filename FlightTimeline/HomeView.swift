import SwiftUI

enum Route: Hashable {
    case arrivals
    case departures
    case timeline
    
    var title: String {
        switch self {
        case .arrivals: return "Arrivals"
        case .departures: return "Departures"
        case .timeline: return "Flight Timeline"
        }
    }
}

struct HomeView: View {
    //  Во flights будет находится сгенерированный массив
    private let flights = FlightInformation.generateFlights()
    
    private var arrivals: [FlightInformation] {
        flights.filter { $0.direction == .arrival }
    }
    
    private var departures: [FlightInformation] {
        flights.filter { $0.direction == .departure }
    }
    
    var body: some View {
        //  NavigationStack позволяет сделать кликабельными ссылки (из серого цвета станут синими)
        NavigationStack {
            ZStack {
                Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .opacity(0.1)
                    .rotationEffect(.degrees(-90))
                
                VStack(alignment: .leading, spacing: 10) {
                    NavigationLink(Route.arrivals.title, value: Route.arrivals)
                    NavigationLink(Route.departures.title, value: Route.departures)
                    NavigationLink(Route.timeline.title, value: Route.timeline)
                    
                    Spacer()
                }
                .font(.title)
                .padding()
            }
            .navigationTitle("Airport")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .arrivals:
                    FlightBoardView(title: Route.arrivals.title, fligths: arrivals)
                case .departures:
                    FlightBoardView(title: Route.departures.title, fligths: departures)
                case .timeline:
                    TimelineView(flights: flights)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
