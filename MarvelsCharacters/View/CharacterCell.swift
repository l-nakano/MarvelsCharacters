import UIKit

final class CharacterCell: UITableViewCell {
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    func configure(using character: Character) {
        nameLabel.text = character.name
        characterImageView.image = UIImage(systemName: "photo")
    }
}
