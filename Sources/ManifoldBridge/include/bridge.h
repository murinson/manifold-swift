#include "manifold/manifold.h"

namespace bridge {
using vec3f = manifold::la::vec<float, 3>;

manifold::Manifold Warp(const manifold::Manifold& mesh, void(^block)(manifold::vec3&));
manifold::CrossSection Warp(const manifold::CrossSection& crossSection, void(^block)(manifold::vec2&));

manifold::Manifold SetProperties(const manifold::Manifold manifold, int numProp, void(^block)(double *newProp, manifold::vec3 position, const double *oldProp));

manifold::Manifold LevelSet(double(^block)(manifold::vec3),
                            manifold::Box bounds,
                            double edgeLength,
                            double level,
                            double tolerance,
                            bool canParallel);
}
