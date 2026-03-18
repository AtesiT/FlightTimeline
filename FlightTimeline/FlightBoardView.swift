import SwiftUI

struct FlightBoardView: View {
    let title: String
    let fligths: [FlightInformation]
    
    var body: some View {
        Text(title)
            .font(.largeTitle )
    }
}

#Preview {
    FlightBoardView(
        title: "Board Title",
        fligths: FlightInformation.generateFlights()
    )
}
