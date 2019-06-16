import UIKit
import AlamofireImage

class GameController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchActive : Bool = false
    var games:[Game] = [Game]()
    var filtered:[Game] = [Game]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchBar.text = ""
        searchActive = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchData()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }   

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameSegue" {
            if let detailGame = segue.destination as?
                GameDetailController {
                let cell = sender as! GameCell
                let indexPath = self.collectionView.indexPath(for: cell)
                if searchActive == false {
                    detailGame.game = games[(indexPath?.row)!]
                } else {
                    detailGame.game = filtered[(indexPath?.row)!]
                }
            }
        }
    }
}

// MARK: UICollectionViewDataSource

extension GameController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameCell", for: indexPath) as! GameCell
        
        let game: Game
        
        if(searchActive == true){
            game = filtered[indexPath.row]
        } else {
            game = games[indexPath.row]
        }
        
        cell.name?.text = game.name
        cell.platform?.text = game.platform
            
        cell.price?.text = String().currencyFormatter(price: game.price)
        
        cell.image.af_setImage(withURL: URL(string: game.image)!,
                               placeholderImage: UIImage(named: "super_mario"),
                               imageTransition: .crossDissolve(0.2),
                               completion: { response in
                                cell.image?.image = response.result.value
        })
        return cell
    }
}

extension GameController {
    
    fileprivate func fetchData() {
        Service.shared.fetchGames(completionHandler: {(games, err) in
            if let err = err {
                print("Failed to fetch games:", err)
                return
            }
            self.updateGames(listGame: games as! [Game])
        })
    }
    
    fileprivate func updateGames(listGame:[Game]) {
        for game in listGame {
            if !self.games.contains(where: { $0.id == game.id }) {
                self.games.append(game)
            }
        }
        self.collectionView.reloadData()
    }
}

// MARK: SearchBarDelegate

extension GameController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchString = searchText
        if searchString != "", searchString.count > 0 {
            searchActive = true
            filtered = games.filter {
                return $0.name.range(of: searchString, options: .caseInsensitive) != nil
            }
        } else {
            searchActive = false
        }
        self.collectionView.reloadData()
    }
}
