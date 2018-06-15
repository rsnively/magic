import CoreGraphics
import Foundation
import SpriteKit

func +(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func -(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func *(point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func /(point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

func +(left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width + right.width, height: left.height + right.height)
}

func -(left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width - right.width, height: left.height - right.height)
}

func *(size: CGSize, scalar: CGFloat) -> CGSize {
    return CGSize(width: size.width * scalar, height: size.height * scalar)
}

func /(size: CGSize, scalar: CGFloat) -> CGSize {
    return CGSize(width: size.width / scalar, height: size.height / scalar)
}

extension SKSpriteNode {
    func getLeftBoundary() -> CGFloat {
        return self.position.x - self.size.width / 2.0
    }
    func getRightBoundary() -> CGFloat {
        return self.position.x + self.size.width / 2.0
    }
    func getBottomBoundary() -> CGFloat {
        return self.position.y - self.size.height / 2.0
    }
    func getTopBoundary() -> CGFloat {
        return self.position.y + self.size.height / 2.0
    }
    
    func setLeftBoundary(_ x: CGFloat) {
        self.position.x = x + self.size.width / 2.0
    }
    func setRightBoundary(_ x: CGFloat) {
        self.position.x = x - self.size.width / 2.0
    }
    func setTopBoundary(_ y: CGFloat) {
        self.position.y = y - self.size.height / 2.0
    }
    func setBottomBoundary(_ y: CGFloat) {
        self.position.y = y + self.size.height / 2.0
    }
}

