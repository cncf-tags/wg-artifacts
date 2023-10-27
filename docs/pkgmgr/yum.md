# YUM Package Manager

[Yellowdog Updater Modified (YUM) package manager](http://yum.baseurl.org/)

Related to [RPM Package manager](./rpm.md)

NOTE: Creating a YUM Repository

[Create an Nginx-based YUM/DNF repository on Red Hat Enterprise Linux 8](https://www.redhat.com/sysadmin/nginx-based-yum-dnf-repo)

`yum install createrepo`

`createrepo --database /mnt/local_repo`

## List of Packages :green_circle:*

List all available packages:

`yum list available`

List all installed packages:

`yum list installed`

List installed and available packages:

`yum list all`

List installed and available kernel package:

`yum list kernel`

## Filter a List of Packages :green_circle:

`yum list <package-regex>`

For example,

`yum list cl-*`

## List versions :green_circle:

`yum list --showduplicates <package>`

## De-dupability :red_circle:

N/A

## Multi-Architecture Support :green_circle:

Similar to [RPM multi-arch](./rpm.md)

## Dependency Tracking :green_circle:

List dependencies and packages providing them:

`yum deplist <package>`

Show package that contains file:

`yum provides <filename>`

Show dependent package:

`yum repoquery --requires --resolve <package>`
