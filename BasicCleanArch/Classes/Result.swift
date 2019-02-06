import Foundation

/// Enum associated with a result or an error.
public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
