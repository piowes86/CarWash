 import UIKit
 import MapKit
 
 class CarDetails: UIViewController {
    
    // MARK: Instance variables -
    
    var carDetails : Car!
    var delegate = UIApplication.shared.delegate as! AppDelegate
    lazy var carListObject = delegate.carListGlobal
    var carDoorStatus = false
    var paymentStatus = false
    let regionRadius: CLLocationDistance = 1000 // For need of setting mapView
    
    // MARK: IBOutlets -
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var personAcronymButton: UIButton!
    @IBOutlet weak var brandLogo: UIImageView!
    @IBOutlet weak var plateLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var lockUnlockSg: UISegmentedControl!
    @IBOutlet var responsiblePersonLabel: UILabel!
    @IBOutlet var mapView: MKMapView!
    
    // MARK: System Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCarLogo(carBrand: carDetails.brand)
        plateLabel.text = carDetails.plate
        
        lockUnlockSg.isHidden = true
        responsiblePersonLabel.isHidden = false
        personAcronymButton.isHidden = true
        
        let initialLocation = CLLocation(latitude: 52.389030, longitude: 13.509986)
        centerMapOnLocation(location: initialLocation)
    }
    
    // MARK: IBActions -
    
    @IBAction func startNewRequest(_ sender: UIButton) {
        
        startButton.isHidden = true
        lockUnlockSg.isHidden = false
        lockUnlockSg.selectedSegmentIndex = 0
        lockUnlockSg.isSelected = true
        responsiblePersonLabel.isHidden = true
        titleLabel.text = ""
        personAcronymButton.isHidden = false
        
        updateCarStatus(car: carDetails, status: "ongoing")
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
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func updateCarStatus(car: Car, status: String) {
        carListObject.carList.lazy.filter{ $0.plate == car.plate }.first?.status = status
        
    }
 }
 

