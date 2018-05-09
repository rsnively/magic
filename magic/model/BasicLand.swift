import Foundation

func getColorForLandType(subtype:Subtype) -> Color? {
    switch subtype {
    case .Forest: return Color.Green
    case .Island: return Color.Blue
    case .Mountain: return Color.Red
    case .Plains: return Color.White
    case .Swamp: return Color.Black
    default: return nil
    }
}
