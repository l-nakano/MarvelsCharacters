import UIKit

final class CharacterListAdapter: NSObject, UITableViewDataSource, UITableViewDelegate {
    var characters: [Character] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count > 0 ? 4 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = characters[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharacterCell
        cell.configure(using: character)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "NOME E PERSONAGEM"
    }
    
}
