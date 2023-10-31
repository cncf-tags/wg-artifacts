# OCI Package Manager

[OCI Distribution Spec](https://github.com/opencontainers/distribution-spec)

## List of Packages :red_circle:*

OCI had initially added support for a `_catalog` API, however it turned out to be problematic across various implementations. The `_catalog` API was marked reserved assuring a new implementation wouldn't collide with the existing implementations.

## Filter a List of Packages :red_circle:

The OCI Distribution spec supports a `_tag` listing API, which partially equates to a versioning API, however the spec doesn't currently support server side filtering for the repositories.

## List versions :yellow_circle:*

In OCI, a `:tag` provides string based versioning. While users can implement semantic versioning within the tag, the server has no standard enforcement.  There is no standard way to know that a tag is a specific version (e.g., `v1.2.3`), floating tag (e.g., `latest`, `stable`, `v1`, `v1.2`), or referrers API fallback tag (e.g., `sha256-deadbeef...`).

## De-dupability :green_circle:

The package manager has the ability to efficiently, and securely store duplicate elements of different packages within the service. The client has the ability to pull unique elements of a package, making the retrieval of a package more efficient.

## Multi-Architecture Support :green_circle:

- [OCI Image config](https://github.com/opencontainers/image-spec/blob/main/config.md#properties0) provides for specifying the platform and architecture of an specific image.
- [OCI Index](https://github.com/opencontainers/image-spec/blob/main/image-index.md) provides a mechanism to collect multiple platforms and architectures under a single artifact.

## Dependency Tracking :green_circle:

- [OCI Manifests](https://github.com/opencontainers/image-spec/blob/main/manifest.md) enables referencing blobs by digest.  This enables the registry to track the use of the same blob by other OCI artifacts.
- [OCI Index's `manifests`](https://github.com/opencontainers/image-spec/blob/main/image-index.md) field enables architecture to artifact tracking.  The existence of the index also allows a single reference to be independent of the artifact's architecture.
- The Tag API enables a means for registries to implement a tag history and/or deletion of older versions
