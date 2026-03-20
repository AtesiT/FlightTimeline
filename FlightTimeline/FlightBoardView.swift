import SwiftUI

struct FlightBoardView: View {
    let title: String
    let fligths: [FlightInformation]
    
    @State private var hiddenCancelled = false
    
    private var showFlights: [FlightInformation] {
        hiddenCancelled ? fligths.filter { $0.status != .cancelled } : fligths
    }
    
    var body: some View {
        //  В данном случае, ForEach - структура, которая перебирает массивы. На основе каждого элемента создаёт новое представление. Передаем упорядоченную коллекцию.
        List(showFlights)
            //  Создавая представление, мы должны присвоить уникальный ID. В нашем случае, у нас массив с уникальными элементами, не повторяются. Затем, ниже будет блок замыкания, на основе которых, мы будет создавать эти представления
            { flight in
                FlightRowView(flight: flight)
            }
            .listStyle(.plain)
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Toggle("Hide canceled", isOn: $hiddenCancelled)
//                        .toggleStyle(.switch)
                }
            }
    }
}

#Preview {
    FlightBoardView(
        title: "Board Title",
        fligths: FlightInformation.generateFlights()
    )
}
