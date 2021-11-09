import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var personagem1ImageView: UIImageView!
    @IBOutlet weak var personagem1Label: UILabel!
    @IBOutlet weak var personagem2ImageView: UIImageView!
    @IBOutlet weak var personagem2Label: UILabel!
    @IBOutlet weak var personagem3ImageView: UIImageView!
    @IBOutlet weak var personagem3Label: UILabel!
    @IBOutlet weak var personagem4ImageView: UIImageView!
    @IBOutlet weak var personagem4Label: UILabel!
    
    let charactersRepository = CharactersRepository()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersRepository.getCharacterList { characters in
            self.personagem1ImageView.image = UIImage(systemName: "photo")
            self.personagem1Label.text = characters[0].name
            self.personagem2ImageView.image = UIImage(systemName: "photo")
            self.personagem2Label.text = characters[1].name
            self.personagem3ImageView.image = UIImage(systemName: "photo")
            self.personagem3Label.text = characters[2].name
            self.personagem4ImageView.image = UIImage(systemName: "photo")
            self.personagem4Label.text = characters[3].name
        }
    }

}

