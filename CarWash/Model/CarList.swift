import Foundation

class CarList {
    
    var carList = [Car]()
    
    init() {
        
        carList.append(Car(plate: "SHA ZP 8987", brand: "Audi", model: "A5", type: .sedan, cleaned: false, adoptionDate: "28.10.2017", washingDate: "", completionTimeLimit: "10.11.2017"))
        carList.append(Car(plate: "AA SF 4894", brand: "Mercedes", model: "CLS", type: .sedan, cleaned: false, adoptionDate: "29.10.2017", washingDate: "", completionTimeLimit: "2.11.2017"))
        carList.append(Car(plate: "OG AE 8974", brand: "Audi", model: "A4", type: .sedan, cleaned: false, adoptionDate: "29.10.2017", washingDate: "", completionTimeLimit: "7.11.2017"))
        carList.append(Car(plate: "MA SG 844", brand: "BMW", model: "7", type: .sedan, cleaned: false, adoptionDate: "29.10.2017", washingDate: "", completionTimeLimit: "4.11.2017"))
        carList.append(Car(plate: "RW KL 8848", brand: "BMW", model: "M5", type: .sedan, cleaned: false, adoptionDate: "30.10.2017", washingDate: "", completionTimeLimit: "10.11.2017"))
        carList.append(Car(plate: "LR WN 894", brand: "Audi", model: "A8", type: .sedan, cleaned: false, adoptionDate: "30.10.2017", washingDate: "", completionTimeLimit: "12.11.2017"))
        carList.append(Car(plate: "WT TN 1981", brand: "Audi", model: "A7", type: .sedan, cleaned: false, adoptionDate: "20.10.2017", washingDate: "", completionTimeLimit: "5.11.2017"))
        carList.append(Car(plate: "RV AG 4949", brand: "Mercedes", model: "E", type: .sedan, cleaned: false, adoptionDate: "30.10.2017", washingDate: "", completionTimeLimit: "4.11.2017"))
        carList.append(Car(plate: "TUT LI 9797", brand: "Mercedes", model: "S", type: .sedan, cleaned: false, adoptionDate: "31.10.2017", washingDate: "", completionTimeLimit: "3.11.2017"))
        carList.append(Car(plate: "KA AG 9844", brand: "Mercedes", model: "C", type: .sedan, cleaned: false, adoptionDate: "31.10.2017", washingDate: "", completionTimeLimit: "10.11.2017"))
        carList.append(Car(plate: "FR JR 5894", brand: "Audi", model: "A6", type: .sedan, cleaned: false, adoptionDate: "31.10.2017", washingDate: "", completionTimeLimit: "11.11.2017"))
    }
    
}
