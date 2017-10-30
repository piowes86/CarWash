import UIKit

class CarDetails: UIViewController {
    
    // MARK: Instance variables -
    
    var carDetails : Car!
    
    // MARK: IBOutlets -
    
    @IBOutlet weak var plateLabel: UILabel!
    
    // MARK: System Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       plateLabel.text = carDetails.plate
        
    }
    
}
