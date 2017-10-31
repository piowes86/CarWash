import Foundation

enum CarType {
    case sedan
    case wagon
    case coupe
    case suv
    case truck
    case van
    case hatchback
}

class Car {
    
    var plate : String = ""
    var brand : String = ""
    var model : String = ""
    var type : CarType!
    var cleaned : Bool = false
    var adoptionDate : String = ""
    var washingDate : String = ""
    var completionTimeLimit : String = ""
    
    init(plate: String, brand: String, model: String, type: CarType, cleaned: Bool, adoptionDate: String, washingDate: String, completionTimeLimit: String) {
        
        self.plate = plate
        self.brand = brand
        self.model = model
        self.type = type
        self.cleaned = cleaned
        self.adoptionDate = adoptionDate
        self.washingDate = washingDate
        self.completionTimeLimit = completionTimeLimit
    }
}