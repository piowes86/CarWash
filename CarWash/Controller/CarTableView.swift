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
                carTableView.reloadData()
            }
        } else {
            for car in carListObject.carList {
                carList.append(car)
            }
        }
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
        cell.brandLogoImage.image = setCarLogo(carBrand: carList[indexPath.row].brand)
        cell.executionTimeLabel.text = carList[indexPath.row].adoptionDate
        cell.serviceTypeLabel.text = carList[indexPath.row].status != "done" ? "FULL CLEANING" : "DONE"
        
        cell.executionTimeLabel.text = carList[indexPath.row].adoptionDate
        
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
    
    func setCarLogo(carBrand: String) -> UIImage {
        
        if carBrand == "Mercedes" {
            return UIImage(named: "mercedes_logo")!
        } else if carBrand == "BMW" {
            return UIImage(named: "bmw_logo")!
        } else {
            return UIImage(named: "audi_logo")!
        }
    }
    
}

