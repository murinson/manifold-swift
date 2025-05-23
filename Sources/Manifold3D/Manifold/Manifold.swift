import ManifoldCPP

public struct Manifold: @unchecked Sendable {
    internal let mesh: manifold.Manifold

    internal init(_ mesh: manifold.Manifold) {
        self.mesh = mesh
    }
}

public extension Manifold {
    init(_ meshGL: MeshGL64) throws(Error) {
        self.init(manifold.Manifold(meshGL.meshGL))
        if isEmpty, let error = self.status {
            throw error
        }
    }
    
    init(_ meshGL: MeshGL) throws(Error) {
        self.init(manifold.Manifold(meshGL.meshGL))
        if isEmpty, let error = self.status {
            throw error
        }
    }
    
    func meshGL(normalChannelIndex: Int = -1) -> MeshGL {
        MeshGL(meshGL: mesh.GetMeshGL(Int32(normalChannelIndex)))
    }

    func meshGL64(normalChannelIndex: Int = -1) -> MeshGL64 {
        MeshGL64(meshGL: mesh.GetMeshGL64(Int32(normalChannelIndex)))
    }

    var status: Error? {
        Error(mesh.Status())
    }

    func minimumGap(to other: Manifold, searchLength: Double) -> Double {
        mesh.MinGap(other.mesh, searchLength)
    }

    func overlapCount(with other: Manifold) -> Int {
        mesh.NumOverlaps(other.mesh)
    }

    enum Error: Swift.Error {
        case nonFiniteVertex
        case notManifold
        case vertexOutOfBounds
        case propertiesWrongLength
        case missingPositionProperties
        case mergeVectorsDifferentLengths
        case mergeIndexOutOfBounds
        case transformWrongLength
        case runIndexWrongLength
        case faceIDWrongLength
        case invalidConstruction

        internal init?(_ error: manifold.Manifold.Error) {
            switch error {
            case .NoError: return nil
            case .NonFiniteVertex: self = .nonFiniteVertex
            case .NotManifold: self = .notManifold
            case .VertexOutOfBounds: self = .vertexOutOfBounds
            case .PropertiesWrongLength: self = .propertiesWrongLength
            case .MissingPositionProperties: self = .missingPositionProperties
            case .MergeVectorsDifferentLengths: self = .mergeVectorsDifferentLengths
            case .MergeIndexOutOfBounds: self = .mergeIndexOutOfBounds
            case .TransformWrongLength: self = .transformWrongLength
            case .RunIndexWrongLength: self = .runIndexWrongLength
            case .FaceIDWrongLength: self = .faceIDWrongLength
            case .InvalidConstruction: self = .invalidConstruction
            @unknown default:
                assertionFailure("Unknown error")
                return nil
            }
        }
    }
}
