import SwiftUI

struct FlightBoardView: View {
    let title: String
    let fligths: [FlightInformation]
    
    var body: some View {
        //  В данном случае, ForEach - структура, которая перебирает массивы. На основе каждого элемента создаёт новое представление.
        ForEach(
            //  Передаём упорядоченную коллекцию (set не сможем передать)
            fligths,
            //  Создавая представление, мы должны присвоить уникальный ID. В нашем случае, у нас массив с уникальными элементами, не повторяются. Затем, ниже будет блок замыкания, на основе которых, мы будет создавать эти представления
            id: \.self) { flight in
                Text("\(flight.airline) \(flight.number)")
            }
    }
}

#Preview {
    FlightBoardView(
        title: "Board Title",
        fligths: FlightInformation.generateFlights()
    )
}
