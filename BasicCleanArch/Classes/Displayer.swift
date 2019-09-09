import Foundation

/// A `Displayer` is used to display the result of a use case that changes the
/// displayed view.
public protocol Displayer {
    associatedtype ViewModelType

    /// Displays data from a ViewModel
    ///
    /// - parameter success: The result to display.
    /// - parameter resultCode: Used to distinguish similar requests.
    func display(success: ViewModelType, resultCode: Int)
    
    /// Displays data from an Error.
    ///
    /// - parameter failure: The error to display.
    func display(failure: Error)
}

extension Displayer {
    /// Displays data from a ViewModel
    ///
    /// - parameter success: The result to display.
    public func display(success: ViewModelType)
    {
        return display(success: success, resultCode: 0)
    }
}
