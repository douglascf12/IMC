protocol Interacting: AnyObject {
    func calculate(weight: Double, height: Double)
}

final class Interactor {
    private let presenter: Presenting
    
    init(presenter: Presenting) {
        self.presenter = presenter
    }
}

// MARK: - Interacting
extension Interactor: Interacting {
    func calculate(weight: Double, height: Double) {
        let imc = weight / (height * height)
        var typeWeight = String()
        var imageName = String()
        
        switch imc {
        case 0..<16:
            typeWeight = "Magreza"
            imageName = "abaixo"
        case 16..<18.5:
            typeWeight = "Abaixo do peso"
            imageName = "abaixo"
        case 18.5..<25:
            typeWeight = "Peso ideal"
            imageName = "ideal"
        case 25..<30:
            typeWeight = "Sobrepeso"
            imageName = "sobre"
        default:
            typeWeight = "Obesidade"
            imageName = "obesidade"
        }
        
        presenter.displayResult(imc: Int(imc), typeWeight: typeWeight, imageName: imageName)
    }
}
