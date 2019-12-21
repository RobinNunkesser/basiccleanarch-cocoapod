import Foundation

/// A `UseCase` is typically implemented by an interactor.
/// It executes the business logic of the use case.
public protocol UseCase {
    associatedtype DisplayerType : Displayer
    associatedtype PresenterType : Presenter
    associatedtype RequestType
    
    var presenter : PresenterType { get }

    /// Returns a new UseCase.
    ///
    /// - parameter presenter: The presenter to use.
    init(presenter : PresenterType)
    
    /// Executes the UseCase.
    ///
    /// - parameter request: Encapsulated request parameters.
    /// - parameter displayer: The Displayer to use for the result.
    /// - parameter resultCode: Used to distinguish similar requests.
    func execute(request : RequestType,
                 displayer : DisplayerType,
                 resultCode: Int)
}

extension UseCase {
    /// Executes the UseCase.
    ///
    /// - parameter request: Encapsulated request parameters.
    /// - parameter displayer: The Displayer to use for the result.
    public func execute(request : RequestType, displayer : DisplayerType)
    {
        return execute(request: request, displayer: displayer, resultCode: 0)
    }
}
