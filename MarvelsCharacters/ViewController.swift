import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var charactersTableView: UITableView!
    
    let adapter = CharacterListAdapter()
    let charactersRepository = CharactersRepository()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersTableView.dataSource = adapter
        charactersRepository.getCharacterList { characters in
            self.adapter.characters = characters
            self.charactersTableView.reloadData()
        }
    }

}

