import UIKit

class CustomCarCell: UITableViewCell {

    @IBOutlet var statusCarImage: UIImageView!
    @IBOutlet var executionTimeLabel: UILabel!
    @IBOutlet var serviceTypeLabel: UILabel!
    @IBOutlet var responsiblePersonAcronym: UIImageView!
    @IBOutlet var responsiblePersonAcronymLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
