import UIKit

///Стили переходов
enum TransitionStyle {
    case Modal
    
    case Push
    
    case PopoverFromView(
        sourceView: UIView,
        sourceRect: CGRect
    )
    
    case PopoverFromButtonItem(
        buttonItem: UIBarButtonItem
    )
}