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
    
    @IBOutlet var personAcronymButton: UIBarButtonItem!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var brandLogo: UIImageView!
    @IBOutlet weak var plateLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var lockUnlockSg: UISegmentedControl!
    @IBOutlet var responsiblePersonLabel: UILabel!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var finishButton: UIButton!
    
    // MARK: System Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 52.389030, longitude: 13.509986)
        centerMapOnLocation(location: initialLocation)
        
        lockUnlockSg.selectedSegmentIndex = 0
        personAcronymButton.title = ""
        
        checkCarStatus()
    }
    
    // MARK: IBActions -
    
    @IBAction func startNewRequest(_ sender: UIButton) {
        
        updateCarStatus(car: carDetails, status: "ongoing")
        carListObject.carList.lazy.filter{ $0.plate == self.carDetails.plate }.first?.responsiblePerson = "David Underhill"
        checkCarStatus()
    }
    
    @IBAction func lockUnlockCar(_ sender: UISegmentedControl) {
        finishButton.isHidden = false;
        checkCarStatus()
    }
    
    @IBAction func finishButton(_ sender: UIButton) {
        
        carListObject.carList.lazy.filter{ $0.plate == self.carDetails.plate }.first?.status = "done"
        finishButton.isEnabled = false
        checkCarStatus()
    }
    
    // MARK: Custom Methods -
    
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
    
    func checkCarStatus() {
        
        if carDetails.status == "ongoing" {
            
            titleLabel.text = ""
            personAcronymButton.title = "DU"
            startButton.isHidden = true
            lockUnlockSg.isHidden = false
            lockUnlockSg.isSelected = true
            responsiblePersonLabel.isHidden = false
        } else if carDetails.status == "new" {
            
            plateLabel.text = carDetails.plate
            lockUnlockSg.isHidden = true
            responsiblePersonLabel.isHidden = true
            finishButton.isHidden = true;
        } else {
            
            lockUnlockSg.isEnabled = false
            finishButton.isHidden = false
            finishButton.tintColor = UIColor.darkGray
            finishButton.backgroundColor = UIColor.gray
            titleLabel.text = "Car wash request"
        }
        
    }
 }
 

