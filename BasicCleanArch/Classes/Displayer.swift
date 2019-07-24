import Foundation

/// A `Displayer` is used to display the result of a use case that changes the
/// displayed view.
public protocol Displayer {
    associatedtype ViewModelType

    /// Displays data from a ViewModel
    ///
    /// - parameter success: The result to display.
    func display(success: ViewModelType)
    
    /// Displays data from an Error.
    ///
    /// - parameter failure: The error to display.
    func display(failure: Error)
}
