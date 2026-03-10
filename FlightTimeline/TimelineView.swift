import SwiftUI

struct TimelineView: UIViewControllerRepresentable {
    
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
    }
    
}

#Preview {
    TimelineView()
}
