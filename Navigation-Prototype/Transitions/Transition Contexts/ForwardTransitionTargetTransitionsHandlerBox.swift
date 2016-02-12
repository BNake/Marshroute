/// Варианты хранения обработчика переходов показываемого модуля
enum ForwardTransitionTargetTransitionsHandlerBox {
    case Animating(StrongBox<AnimatingTransitionsHandler>)
    case Containing(StrongBox<ContainingTransitionsHandler>)
    case Pending // обработчик переходов будет выставлен позже
}

// MARK: - convenience
extension ForwardTransitionTargetTransitionsHandlerBox {
    init(animatingTransitionsHandler: AnimatingTransitionsHandler) {
        self = .Animating(StrongBox<AnimatingTransitionsHandler>(animatingTransitionsHandler))
    }
    
    init(containingTransitionsHandler: ContainingTransitionsHandler) {
        self = .Containing(StrongBox<ContainingTransitionsHandler>(containingTransitionsHandler))
    }
}

// MARK: - helpers
extension ForwardTransitionTargetTransitionsHandlerBox {
    func unbox() -> TransitionsHandler?
    {
        switch self {
        case .Animating(let weakBox):
            return weakBox.unbox()
            
        case .Containing(let weakBox):
            return weakBox.unbox()
            
        case .Pending:
            return nil
        }
    }
    
    func unboxAnimatingTransitionsHandler() -> AnimatingTransitionsHandler?
    {
        switch self {
        case .Animating(let weakBox):
            return weakBox.unbox()
            
        default:
            return nil
        }
    }
    
    func unboxContainingTransitionsHandler() -> ContainingTransitionsHandler?
    {
        switch self {
        case .Containing(let weakBox):
            return weakBox.unbox()
            
        default:
            return nil
        }
    }
}