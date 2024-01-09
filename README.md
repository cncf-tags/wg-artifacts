<!-- template begins here-->

# Welcome to the CNCF Artifacts Working Group

[![CI](https://github.com/cncf-tags/wg-artifacts/actions/workflows/testing.yml/badge.svg)](https://github.com/cncf-tags/wg-artifacts/actions/workflows/testing.yml)

<!-- Mission Statement -->

In the distributed world of cloud-native computing different artifacts and
packages are used to transport configuration and code for the many services and
capabilities that comprise and support workloads and applications. As an
example, today ArtifactHub advertises that it can crawl about 20 such artifact
types [1]. These "cloud-native" bundles add to the previous proliferation of
package and artifact types for software dependencies such as Maven and npm and
for system packages like deb and rpm. This abundance of package types and
formats adds complexity and risk for cloud application developers and
architects trying to provision and run cloud-native workloads. Different tools
and controllers must be carefully learned and installed to bundle, unbundle,
verify and deploy each artifact type. This complexity slows product development
by users, impedes innovation and collaboration amongst projects, and increases
risks of insecure configuration. To reduce this complexity and facilitate
collaboration and innovation, WG Artifacts will gather stakeholders from many
CNCF and open source projects offering packaging, distribution and deployment
mechanisms for bundles of configuration and code.

<!-- More information about crafting your mission statement with examples -->

The [charter](charter.md) describes the goals and activites of this group.

Old working document of the [charter](https://docs.google.com/document/d/1w_lo2RZDKeEzQg4DMV-9Tq4ir_znONj_ypJ27CUfMgY/).

<!-- https://contribute.cncf.io/maintainers/governance/charter/ -->

The CNCF Artifacts Working Group is under the [App Delivery Technical Advisory Group](https://github.com/cncf/tag-app-delivery/tree/main/artifacts-wg) hosted
by the [Cloud Native Computing Foundation (CNCF)](https://cncf.io).

## Chairs

- Alex Flom (@afflom)
- Ramkumar Chinchani (@rchincha)

## Use Cases

<!-- embed docs/use-cases.md -->

A list of common use cases that are implemented across various package managers.

<!---                                                         | Alpine          | Cargo          | Carvel         | Helm           | Maven          | npm            | OCI             | PyPi            | rpm            | --->
<!-- markdownlint-disable-next-line MD033 -->
| Use Case /<BR>Package Manager                               | [Alpine](./pkgmgr/alpine.md) </BR>(APK) | Cargo | Carvel | Helm | Maven | npm | [OCI](./pkgmgr/oci.md) | [PyPi](./pkgmgr/pypi.md) | rpm |
| - | - | - | - | - | - | - | - | - | - |
| **[List of Packages](docs/use-cases.md#list-of-packages)**                   | :green_circle:  | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: |  :red_circle:*  | :green_circle:  | :white_circle: |
| **[Filter a List of Packages](docs/use-cases.md#filter-a-list-of-packages)** | :green_circle:  | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: |  :red_circle:   | :yellow_circle: | :white_circle: |
| **[List versions](docs/use-cases.md#list-versions)**                         | :red_circle:    | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :yellow_circle:*| :green_circle:  | :white_circle: |
| **[De-dupability](docs/use-cases.md#de-dupability)**                         | :yellow_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :green_circle:  | :green_circle:  | :white_circle: |
| **[Multi-Arch Support](docs/use-cases#multi-architecture-support)**       | :green_circle:  | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :green_circle:  | :green_circle:  | :white_circle: |
| **[Dependency Tracking](docs/use-cases.md#dependency-tracking)**             | :green_circle:  | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :green_circle:  | :green_circle:  | :white_circle: |
| **\<use-case\>**                                            | :white_circle:  | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle:  | :yellow_circle: | :white_circle: |
<!---                                                         | Alpine          | Cargo          | Carvel         | Helm           | Maven          | npm            | OCI             | PyPi            | rpm            | --->

## Getting Started

<!-- Include enough details to get started using, or at least building, the
project here and link to other docs with more detail as needed.  Depending on
the nature of the project and its current development status, this might
include:
* quick installation/build instructions
* a few simple examples of use
* basic prerequisites
-->

Currently, the working group is evaluating the current state of various
software ecosystems and whether it is feasible to standardize and also
suggest changes.

```bash
# Clone this repository
git clone https://github.com/cncf-tags/wg-artifacts.git

# Enter cloned dir
cd wg-artifacts

# Check metadata query support across software ecosystems
make conformance
```

## Contributing
<!-- Template: https://github.com/cncf/project-template/blob/main/CONTRIBUTING.md -->

Our project welcomes contributions from any member of our community. To get
started contributing, please see our [Contributor Guide](CONTRIBUTING.md).

[Meeting Notes](https://docs.google.com/document/d/1E7iKPOuyA1jxPe8vDG8aPd8jtnCEbpDpCifXDvDCnA0/)

## Scope
<!-- If this section is too long, you might consider moving it to a SCOPE.md -->
<!-- More information about creating your scope with links to examples -->
<!-- https://contribute.cncf.io/maintainers/governance/charter/ -->

- Define a set of query interfaces that can standardized across various software ecosystems.

## Communications

<!-- Fill in the communications channels you actually use.  These should all be public channels anyone
can join, and there should be several ways that users and contributors can reach project maintainers. 
If you have recurring/regular meetings, list those or a link to a publicy-readable calendar so that
prospective contributors know when and where to engage with you. -->

- Slack Channel:

[Slack channel](https://cloud-native.slack.com/archives/C04UQDWS4M7)

- Public Meeting Schedule and Links:

This working group meets on 2nd and 4th Friday of each month @ 1700 UTC

Zoom: [https://zoom.us/j/7276783015?pwd=R0RJMkRzQ1ZjcmE0WERGcTJTOEVyUT09](https://zoom.us/j/7276783015?pwd=R0RJMkRzQ1ZjcmE0WERGcTJTOEVyUT09)
Passcode: 77777

Agendas and notes: [https://docs.google.com/document/d/1E7iKPOuyA1jxPe8vDG8aPd8jtnCEbpDpCifXDvDCnA0/](https://docs.google.com/document/d/1E7iKPOuyA1jxPe8vDG8aPd8jtnCEbpDpCifXDvDCnA0/)

[CNCF Community](https://community.cncf.io/tag-app-delivery/)

WG Artifacts - Project Meeting
TAG App Delivery

## Resources

[Meeting Notes](https://docs.google.com/document/d/1E7iKPOuyA1jxPe8vDG8aPd8jtnCEbpDpCifXDvDCnA0/)

## License

<!-- Template: https://github.com/cncf/project-template/blob/main/LICENSE -->
This project is licensed under [Apache 2.0](LICENSE)

## Conduct

<!-- Template: https://github.com/cncf/project-template/blob/main/CODE_OF_CONDUCT.md -->
We follow the [CNCF Code of Conduct](CODE_OF_CONDUCT.md).
