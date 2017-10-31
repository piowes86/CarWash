 import UIKit
 
 class CarDetails: UIViewController {
    
    // MARK: Instance variables -
    
    var carDetails : Car!
    var carDoorStatus = false
    var paymentStatus = false
    
    // MARK: IBOutlets -
    
    @IBOutlet weak var brandLogo: UIImageView!
    
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var plateLabel: UILabel!
    @IBOutlet weak var cleanedLabel: UILabel!
    @IBOutlet weak var adoptionDateLabel: UILabel!
    @IBOutlet weak var completionTimeLimitLabel: UILabel!
    
    @IBOutlet weak var openCloseCarButton: UIButton!
    @IBOutlet weak var payForCarWashButton: UIButton!
    
    // MARK: System Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCarLogo(carBrand: carDetails.brand)
        modelLabel.text = carDetails.model
        typeLabel.text = getCarType(carType: carDetails.type)
        plateLabel.text = carDetails.plate
        cleanedLabel.text = getCarStatus(status: carDetails.cleaned)
        adoptionDateLabel.text = carDetails.adoptionDate
        completionTimeLimitLabel.text = carDetails.completionTimeLimit
    }
    
    // MARK: IBActions -
    
    @IBAction func openCLoseCar(_ sender: UIButton) {
        
        if carDoorStatus {
            openCloseCarButton.setTitle("Open Car", for: .normal)
            openCloseCarButton.backgroundColor = UIColor(red: 78/255, green: 180/255, blue: 242/255, alpha: 1.0)
        } else {
            openCloseCarButton.setTitle("Close Car", for: .normal)
            openCloseCarButton.backgroundColor = UIColor(red: 238/255, green: 80/255, blue: 80/255, alpha: 1.0)
        }
        
        carDoorStatus = !carDoorStatus
    }
    
    @IBAction func payForCarWash(_ sender: UIButton) {
        
        if !paymentStatus {
            payForCarWashButton.setTitle("CarWash Paid", for: .normal)
            payForCarWashButton.isEnabled = false
            payForCarWashButton.backgroundColor = UIColor(red: 238/255, green: 80/255, blue: 80/255, alpha: 1.0)
            paymentStatus = true
        }
    }
    
    // MARK: Custom Methods -
    
    func getCarType(carType: CarType) -> String {
        
        return "Sedan"
    }
    
    func setCarLogo(carBrand: String) {
        
        if carBrand == "Mercedes" {
            brandLogo.image = UIImage(named: "mercedes_logo")
        } else if carBrand == "BMW" {
            brandLogo.image = UIImage(named: "bmw_logo")
        } else {
            brandLogo.image = UIImage(named: "audi_logo")
        }
    }
    
    func getCarStatus(status: Bool) -> String {
        
        return status ? "Cleaned" : "Not Cleaned"
    }
 }
 

