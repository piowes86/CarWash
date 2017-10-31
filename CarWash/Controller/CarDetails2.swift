import UIKit

class CarDetails2: UIViewController {
    
    // MARK: Instance variables -
    
    var carDetails : Car!
    
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
    }
    
    @IBAction func payForCarWash(_ sender: UIButton) {
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

