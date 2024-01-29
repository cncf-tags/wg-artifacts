---
tags: cncf,wg-artifacts
breaks: false
---

# Search API

The [distribution spec](https://github.com/opencontainers/distribution-spec)
allows for OPTIONAL [extensions](https://github.com/opencontainers/distribution-spec/blob/main/extensions/README.md) that registry operators may
implement.

```http
GET /v2/_<extension>/<component>/<module>[?<key>=<value>&...]
```

One use case that is rising in prominence is standardized _search_ capability
within registries. This capability can be organized under _cncf as follows.

```http
GET `/v2/_cncf/ext/search[?<key>=<value>&...]`
```

The prefix `/v2/_cncf` is chosen so that it is compatible with OCI and yet can independently be developed.

# Search vs List?

In this document, if not explicitly called out, it is understood that Search is
a truncated List based on certain criteria.

# Search Use Cases

Search for:

* Repository name

Return a list of repositories matching _name_. If _name_ is not specified, return all repositories (similar to /v2/_catalog query)

```http
GET `/v2/_cncf/ext/search[?repository=<name>]`
```

** For all the following search queries, an additional _repository=<repository>_ query param can be added to further qualify the search.

* Image name

Return a list of images in a _repository_ matching _name_. If _name_ is not specified, return all images (similar to /v2/<>/tags/list query)

```http
GET `/v2/_cncf/ext/search[?repository=<repository>&image=<name>]`
```

* MediaType

Return a list of images matching _name_ media-type. If _name_ is not specified, return all images.

```http
GET `/v2/_cncf/ext/search[?mediaType=<name>]`
```

* ArtifactType

Return a list of images matching _name_ artifact-type. If _name_ is not specified, return all images.

```http
GET `/v2/_cncf/ext/search[?artifactType=<name>]`
```

* Annotation

Return a list of images matching _name_ annotation. If _name_ is not specified, return all images.

```http
GET `/v2/_cncf/ext/search[?annotation=<name>]`
```

* Digest

Return a list of images matching _hash_ digest. If _hash_ is not specified, return all images.

```http
GET `/v2/_cncf/ext/search[?digest=<hash>]`
```

* Free-form global search

Return a list of repositories and images matching _name_ name. If _name_ is not specified, return all repositories and images.

```http
GET `/v2/_cncf/ext/search[?global=<key>]`
```

* Artifact content search

Return a list of images containing a _key_ within artifact contents.

```http
GET `/v2/_cncf/ext/search[?artifactType=<application/spdx>&key=<key>]`
```

# Prefix Match

TBD

# Regex

TBD

# Pagination

Refer to [listing tags](https://github.com/opencontainers/distribution-spec/blob/main/spec.md#listing-tags) section.

# Implementation Guidelines

Not to prescribe an implementation but [GraphQL](https://en.wikipedia.org/wiki/GraphQL) could be a choice.
TBD

# Scalability

When a registry has a very large number of repositories and images, then compiling and returning the results could be problematic.
TBD

# References

[OCI Distribution Spec Extensions](./_cncf.md)

[CNCF WG Artifacts](https://github.com/cncf-tags/wg-artifacts)
