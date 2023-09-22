# Artifact Use Cases by Package Manager

A list of common use cases that are implemented across various package managers.

<!---                                                         | Alpine         | Cargo          | Carvel         | Helm           | Maven          | npm            | OCI            | PyP            | rpm            | --->
| Use Case /<BR>Package Manager                               | Alpine </BR>(APK) | Cargo | Carvel | Helm | Maven | npm | [OCI](./pkgmgr/oci.md) | [PyPi](./pkgmgr/pypi.md) | rpm |
| - | - | - | - | - | - | - | - | - | - |
| **[List of Packages](#list-of-packages)**                   | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: |  :red_circle:* | :white_circle: | :white_circle: |
| **[Filter a List of Packages](#filter-a-list-of-packages)** | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: |  :red_circle:  | :white_circle: | :white_circle: |
| **[List versions](#list-versions)**                         | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :green_circle:*| :white_circle: | :white_circle: |
| **[De-dupability](#de-dupability)**                         | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :green_circle: | :white_circle: | :white_circle: |
| **[Multi-Arch Support](#multi-architecture-support)**       | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :green_circle: | :white_circle: | :white_circle: |
| **[Dependency Tracking](#dependency-tracking)**             | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :green_circle: | :white_circle: | :white_circle: |
| **\<use-case\>**                                            | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: | :white_circle: |
<!---                                                         | Alpine         | Cargo          | Carvel         | Helm           | Maven          | npm            | OCI            | PyP            | rpm            | --->

## Use Case Details

<TODO:>
- Capture the differences between the client and the server. For example, putting the burden on the client to do filtering doesn't scale more than dozen packages. 

### List of Packages

The package manager provides a means to list the all the packages. The client can page through results, and may implement client side filtering, however a package manager with thousands of packages may not scale well, requiring [server side filtering](#filter-a-list-of-packages).

### Filter a List of Packages

The package manager accepts filtering parameters to limit the [list of packages](#list-of-packages) to match some criteria.

### List Versions

The package manager provides an API, listing the versions

### De-dupability

The package manager has the ability to efficiently, and securely store duplicate elements of different packages within the service. The client has the ability to pull unique elements of a package, making the GET of a package more efficient.

### Multi-Architecture Support

The package manager provides a means to query for a package, specific to a OS Platform and architecture.

### Dependency Tracking

<TODO:>
...for package manager lifecycle management. 
- [ ] Can the server track the dependencies of a specific package?
- [ ] Can the server track cross package dependencies?
