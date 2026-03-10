import SwiftUI

struct TimelineView: UIViewControllerRepresentable {
    let flights: [String]
    
    //  После того, как создаём метод - убираем слово some и устанавливаем ViewController, который хотим получить. После этого вызываем метод updateUIViewController
    func makeUIViewController(context: Context) -> UITableViewController {
        UITableViewController()
    }
    
    func updateUIViewController(_ uiViewController: UITableViewController, context: Context) {
        let timelineTableViewCell = UINib(nibName: "TimelineTableViewCell", bundle: nil)
        
        uiViewController.tableView.register(
            timelineTableViewCell,
            forCellReuseIdentifier: "TimelineTableViewCell"
        )
        
        uiViewController.tableView.dataSource = context.coordinator
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(flights: flights)
    }
}

extension TimelineView {
    final class Coordinator: NSObject, UITableViewDataSource {
        var flights: [String]
        
        init(flights: [String]) {
            self.flights = flights
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            flights.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let flight = flights[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
            cell.descriptionLabel.text = flight
            return cell
        }
        
        
    }
}

#Preview {
    TimelineView(flights: ["London - Berlin", "Los Angeles - New York"])
}
