# RPM Package Manager

[https://rpm.org/](https://rpm.org/)

[RPM Reference Manual](https://rpm-software-management.github.io/rpm/manual/)

Note that `rpm` command only tracks installed packages.

## List of Packages :green_circle:*

`rpm -qa`

## Filter a List of Packages :green_circle:

`rpm -qa --qf|--queryformat QUERYFMT`

For example,

`rpm -qa --qf '(%{INSTALLTIME:date}): %{NAME}-%{VERSION}\n'`

## List versions :green_circle:

`rpm -qa --qf '%{NAME}-%{VERSION}\n'`

## De-dupability :red_circle:

N/A

## Multi-Architecture Support :green_circle:

[Multi-architectural RPM Building](https://tldp.org/HOWTO/RPM-HOWTO/multi-arch.html)

## Dependency Tracking :green_circle:

`rpm -q --whatprovides <>`

`rpm -q --whatrequires <>`
