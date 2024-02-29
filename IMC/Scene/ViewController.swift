import UIKit

protocol Displaying: AnyObject {
    func showResult(result: String, image: String)
}

class ViewController: UIViewController {
    var interactor: Interacting
    
    private lazy var myView: View = {
        let view = View()
        view.delegate = self
        return view
    }()
    
    init(interactor: Interacting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - ViewDelegate
extension ViewController: ViewDelegate {
    func calculate(weight: Double, height: Double) {
        interactor.calculate(weight: weight, height: height)
    }
}

// MARK: - Displaying
extension ViewController: Displaying {
    func showResult(result: String, image: String) {
        myView.setup(result: result, image: image)
    }
}
