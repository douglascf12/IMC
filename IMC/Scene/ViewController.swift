import UIKit

protocol Displaying: AnyObject {
    // todo
}

class ViewController: UIViewController {
    var interactor: Interacting
    
    init(interactor: Interacting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .green
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Displaying
extension ViewController: Displaying {
    // todo
}
