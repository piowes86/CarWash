import UIKit

class CarTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Instance variables -
    
    var carList = [Car]()
    var delegate = UIApplication.shared.delegate as! AppDelegate
    lazy var carListObject = delegate.carListGlobal
    
    // MARK: IBOutlets -
    
    @IBOutlet weak var carTableView: UITableView!
    
    // MARK: System Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carTableView.delegate = self
        carTableView.dataSource = self
        
        carTableView.register(UINib(nibName: "CarCell", bundle: nil), forCellReuseIdentifier: "customCarCell")
        carTableView.preservesSuperviewLayoutMargins = false
        carTableView.separatorInset = UIEdgeInsets.zero // Remove TableView default spacing from left
        carTableView.layoutMargins = UIEdgeInsets.zero
        carTableView.tableFooterView = UIView() // Remove empty rows from bottom
        
        self.tabBarController?.tabBar.barTintColor = UIColor.black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        carList = [];
        
        if self.restorationIdentifier == "Pending" {
            for car in carListObject.carList {
                car.status == "new" ? carList.append(car) : nil
            }
        } else {
            for car in carListObject.carList {
                carList.append(car)
            }
        }
        
        carTableView.reloadData()
    }
    
    // MARK: TableView Methods -
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCarCell", for: indexPath) as! CustomCarCell
        
        let images = setImagesWithStatus(carStatus: carList[indexPath.row].status)
        
        cell.statusCarImage.image = images.0!
        
        if let image = images.1 {
            cell.responsiblePersonAcronym.isHidden = false
            cell.responsiblePersonAcronym.image = image
            cell.responsiblePersonAcronymLabel.isHidden = false
            cell.responsiblePersonAcronymLabel.text = carList[indexPath.row].responsiblePersonAcronym
        } else {
            cell.responsiblePersonAcronym.isHidden = true
            cell.responsiblePersonAcronym.image = nil
            cell.responsiblePersonAcronymLabel.isHidden = true
            cell.responsiblePersonAcronymLabel.text = ""
        }
        
        cell.executionTimeLabel.text = carList[indexPath.row].status != "done" ? "Due to: \(carList[indexPath.row].adoptionDate)" : ""
        cell.serviceTypeLabel.text = carList[indexPath.row].status != "done" ? "FULL CLEANING" : "DONE"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "CarDetails", sender: tableView.cellForRow(at: indexPath))
    }
    
    // MARK: Seague -
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CarDetails" {
            
            let cell  = sender as! CustomCarCell
            let indexPath = carTableView.indexPath(for: cell)
            
            if let vc = segue.destination as? CarDetails {
                vc.carDetails = self.carList[(indexPath?.row)!]
            }
        }
    }
    
    func setImagesWithStatus(carStatus: String) -> (UIImage?, UIImage?) {
        
        var statusLogo: UIImage?
        var responsiblePersonAcronymBackground: UIImage?
        
        switch carStatus {
        case "ongoing":
            statusLogo = UIImage(named: "orange_car")!
            responsiblePersonAcronymBackground = UIImage(named: "yellow_background")
        case "done":
            statusLogo = UIImage(named: "green_car")!
            responsiblePersonAcronymBackground = UIImage(named: "gray_background")
        default:
            statusLogo = UIImage(named: "red_car")!
            responsiblePersonAcronymBackground = UIImage(named: "")
        }
        
        return (statusLogo, responsiblePersonAcronymBackground)
    }
    
}

