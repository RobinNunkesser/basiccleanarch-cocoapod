import Foundation

public protocol Presenter {
    
    associatedtype Entity
    associatedtype ViewModel
    
    func present(entity: Entity) -> ViewModel
}
