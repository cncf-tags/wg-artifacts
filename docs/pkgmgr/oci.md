# OCI Package Manager

[OCI Distribution Spec](https://github.com/opencontainers/distribution-spec)

## List of Packages :red_circle:*

OCI had initially added support for a `_catalog` API, however it turned out to be problematic across various implementations. The `_catalog` API was marked reserved assuring a new implementation wouldn't collide with the existing implementations.

## Filter a List of Packages :red_circle:

The OCI Distribution spec supports a `_tag` listing API, which partially equates to a versioning API, however the spec doesn't currently support server side filtering for the repositories.

## List versions :green_circle:*

In OCI, a `:tag` provides string based versioning. While users can implement semantic versioning within the tag, the server has no standard enforcement.

## De-dupability :green_circle:

The package manager has the ability to efficiently, and securely store duplicate elements of different packages within the service. The client has the ability to pull unique elements of a package, making the GET of a package more efficient.

## Multi-Architecture Support :green_circle:

<TODO:> elaborate details

- OCI Image.config provides for platform and architecture
- OCI Index...

## Dependency Tracking :green_circle:

<TODO:> elaborate details

- OCI Image: `layers` enables blob tracking
- OCI Index: `manifests` enables architecture to artifact tracking
- The Tag API enables a means for registries to implement a tag history and/or deletion of older versions