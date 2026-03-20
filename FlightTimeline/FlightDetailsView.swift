import SwiftUI

struct FlightDetailsView: View {
    let flight: FlightInformation
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            //  Добавляем HStack и Spacer ниже, чтобы сместить влево текст
            HStack {
                Text("\(flight.airline) - Flight \(flight.number)")
                    .font(.title)
                Spacer()
                
                Button("Done") {
                    isPresented.toggle()
                }
            }
            
            Text("\(flight.direction == .arrival ? "From" : "To") \(flight.otherAirport)")
            
            Text("\(flight.flightStatus)")
                .foregroundStyle(Color(flight.timelineColor))
            
            Spacer()
            
            
        }
        .padding()
        .font(.headline)
    }
}

#Preview {
    FlightDetailsView(flight: FlightInformation.generateFlight(), isPresented: .constant(true))
}
