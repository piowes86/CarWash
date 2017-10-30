import UIKit

class CarTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Instance variables -
    
    var carList = [Car]()
    var carListObject = CarList()
    
    // MARK: IBOutlets -
    
    @IBOutlet weak var carTableView: UITableView!
    
    // MARK: System Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carList = carListObject.carList
        
        carTableView.delegate = self
        carTableView.dataSource = self
        
        carTableView.separatorInset = UIEdgeInsets.zero // Remove TableView default spacing from left
        carTableView.tableFooterView = UIView() // Remove empty rows from bottom
    }
    
    // MARK: TableView Methods -
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath)
        cell.textLabel?.text = carList[indexPath.row].plate
        
        return cell
    }
    
    // MARK: Seague -
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "CarDetails" {
            let cell  = sender as! UITableViewCell
            let indexPath = carTableView.indexPath(for: cell)
            
            if let vc = segue.destination as? CarDetails {
                vc.carDetails = self.carList[(indexPath?.row)!]
            }
        }
    }
}

