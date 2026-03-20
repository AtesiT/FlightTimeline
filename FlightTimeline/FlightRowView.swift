import SwiftUI

struct FlightRowView: View {
    let flight: FlightInformation
    
    @State private var isPresented = false
    
    var body: some View {
        Button(action: {isPresented.toggle()}) {
            HStack {
                Text("\(flight.airline) \(flight.number)")
                    .frame(width: 120, alignment: .leading)
                
                Text("\(flight.otherAirport)")
                    .frame(alignment: .leading)
                
                Spacer()
                
                Text("\(flight.flightStatus)")
            }
        }
        .sheet(isPresented: $isPresented) {
            FlightDetailsView(flight: flight, isPresented: $isPresented)
        }
    }
}

#Preview {
    FlightRowView(flight: FlightInformation.generateFlight())
}
