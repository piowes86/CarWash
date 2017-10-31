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
        
        for car in carListObject.carList {
            !car.cleaned ? carList.append(car) : nil
        }
        
        carTableView.delegate = self
        carTableView.dataSource = self
        
        carTableView.register(UINib(nibName: "CarCell", bundle: nil), forCellReuseIdentifier: "customCarCell")
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCarCell", for: indexPath) as! CustomCarCell
        cell.brandLogoImage.image = setCarLogo(carBrand: carList[indexPath.row].brand)
        cell.modelNameLabel.text = carList[indexPath.row].model
        cell.plateLabel.text = carList[indexPath.row].plate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "CarDetails", sender: tableView)
        
        var storyboard = storyboard()
        
        UIStoryboard; *storyboard = [UIStoryboard, storyboardWithName:@"Main" bundle:nil];
        NSString* viewType = "YourVCIdentifier";//u can have ContactVC or NavC as other options depending on ur condition
        UIViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:viewType];
        
        [self.navigationController pushViewController:viewController animated:YES];
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

