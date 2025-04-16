import ManifoldCPP
import ManifoldBridge

public protocol Vector3<Scalar> {
    associatedtype Scalar: BinaryFloatingPoint
    
    var x: Scalar { get }
    var y: Scalar { get }
    var z: Scalar { get }
}

internal extension Vector3 {
    var vec3: manifold.vec3 { .init(Double(x), Double(y), Double(z)) }
}

extension manifold.vec3: Vector3 {}

extension bridge.vec3f: Vector3 {}

public protocol Vector2 {
    var x: Double { get }
    var y: Double { get }
}

internal extension Vector2 {
    var vec2: manifold.vec2 { .init(x, y) }
}

extension manifold.vec2: Vector2 {}
