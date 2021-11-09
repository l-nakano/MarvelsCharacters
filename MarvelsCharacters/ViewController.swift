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
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var previousPageButton: UIButton!
    @IBOutlet weak var nextPageButton: UIButton!
    
    let charactersRepository = CharactersRepository()
    var charactersList: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersRepository.getCharacterList { characters in
            self.charactersList = characters
            self.pageControl.numberOfPages = characters.count / 4
            self.updateView()
        }
    }
    
    func updateView() {
        self.personagem1ImageView.image = UIImage(systemName: "photo")
        self.personagem1Label.text = charactersList[pageControl.currentPage * 4].name
        self.personagem2ImageView.image = UIImage(systemName: "photo")
        self.personagem2Label.text = charactersList[pageControl.currentPage * 4 + 1].name
        self.personagem3ImageView.image = UIImage(systemName: "photo")
        self.personagem3Label.text = charactersList[pageControl.currentPage * 4 + 2].name
        self.personagem4ImageView.image = UIImage(systemName: "photo")
        self.personagem4Label.text = charactersList[pageControl.currentPage * 4 + 3].name
        
        switch pageControl.currentPage {
        case 0:
            previousPageButton.alpha = 0
        case pageControl.numberOfPages - 1:
            nextPageButton.alpha = 0
        default:
            previousPageButton.alpha = 1
            nextPageButton.alpha = 1
        }
    }
    
    @IBAction func previousPageButtonPressed(_ sender: Any) {
        pageControl.currentPage -= 1
        updateView()
    }
    
    @IBAction func nextPageButtonPressed(_ sender: Any) {
        pageControl.currentPage += 1
        updateView()
    }
    
}

