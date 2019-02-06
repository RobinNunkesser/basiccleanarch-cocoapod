import Foundation

public protocol UseCase {
    associatedtype DisplayerType : Displayer
    associatedtype PresenterType : Presenter
    associatedtype RequestType
    
    var presenter : PresenterType { get }

    init(presenter : PresenterType)
    
    func execute(request : RequestType, displayer : DisplayerType)
}
