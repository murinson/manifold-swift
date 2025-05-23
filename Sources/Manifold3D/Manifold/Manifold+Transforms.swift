import ManifoldCPP

public extension Manifold {
    func transform(_ transform: any Matrix3x4) -> Self {
        Self(mesh.Transform(transform.mat3x4))
    }

    func translate(_ translation: any Vector3) -> Self {
        Self(mesh.Translate(translation.vec3))
    }

    func scale(_ scale: any Vector3) -> Self {
        Self(mesh.Scale(scale.vec3))
    }

    func rotate(_ rotation: any Vector3) -> Self {
        Self(mesh.Rotate(Double(rotation.x), Double(rotation.y), Double(rotation.z)))
    }

    func mirror(_ normal: any Vector3) -> Self {
        Self(mesh.Mirror(normal.vec3))
    }
}
