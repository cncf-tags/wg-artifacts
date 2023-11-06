# Alpine Package Manager

[Apk Spec](https://wiki.alpinelinux.org/wiki/Apk_spec)

The storage format is extremely CDNs friendly.  The repository is at <http://dl-cdn.alpinelinux.org/alpine/edge/main/>.  Unde that tree is the supported architectures.  Each architecture directory has all the packages (only latest versions) as `.apk` files and the catalog as a [APKINDEX.tar.gz](http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/APKINDEX.tar.gz) file.  The catalog is 1131 kB in size and contains a signature and a APKINDEX file.  The APKINDEX contains records such as the following.

```txt
C:Q1aVyJS38Adc3RqaZo3JRcof6s0io=
P:abseil-cpp-raw-logging-internal
V:20230802.1-r0
A:x86_64
S:4654
I:28672
T:Abseil Common C++ library: abseil-cpp-raw-logging-internal
U:https://abseil.io/
L:Apache-2.0
o:abseil-cpp
m:Duncan Bellamy <dunk@denkimushi.com>
t:1695239181
c:a7532679dae7dd51190bd902dbc66a8fece2ee4c
D:so:libc.musl-x86_64.so.1 so:libgcc_s.so.1 so:libstdc++.so.6
p:so:libabsl_raw_logging_internal.so.2308.0.0=2308.0.0
```

```txt
C:Q1fJozvRZ1d0CP+wjtG8gSoBhfD+0=
P:abseil-cpp-base
V:20230802.1-r0
A:x86_64
S:8912
I:32768
T:Abseil Common C++ library: abseil-cpp-base
U:https://abseil.io/
L:Apache-2.0
o:abseil-cpp
m:Duncan Bellamy <dunk@denkimushi.com>
t:1695239181
c:a7532679dae7dd51190bd902dbc66a8fece2ee4c
D:so:libabsl_raw_logging_internal.so.2308.0.0 so:libabsl_spinlock_wait.so.2308.0.0 so:libc.musl-x86_64.so.1 so:libgcc_s.so.1 so:libstdc++.so.6
p:so:libabsl_base.so.2308.0.0=2308.0.0
```

The details of the metadata are described in the [Apk Spec](https://wiki.alpinelinux.org/wiki/Apk_spec).  The `D:` denotes the dependencies.  The dependencies are **not** package dependencies.  They are references to what a package provides which is in the `p:` field.  For example the second package `abseil-cpp-base` depends on `so:libabsl_raw_logging_internal.so.2308.0.0` which is provided by the first package `abseil-cpp-raw-logging-internal` which has the field `p:so:libabsl_raw_logging_internal.so.2308.0.0=2308.0.0`.

APKINDEX's uses the SHA1 hash (field `C:`) to ensure integrity of the downloaded package.  It is not the digest of the `.apk` file but instead the digest of the "control stream" that is within the `.apk` file.  The `.apk` packages may also contain a signature.

## List of Packages :green_circle:

The catalog contains the list of all packages.

## Filter a List of Packages :green_circle:

Once the catalog is obtained there is sufficient metadata to perform filtering queries.

## List versions :red_circle:

The catalog only contains the most recent version of each package so listing versions seems to be impossible.

## De-dupability :yellow_circle:

The files are organized by package name with the package's metadata included in the file contents.  As such there is no real possibly of a hash collision of the contents.  In other words, each .apk file is guaranteed to be unique.  The only way to achieve de-duplication of data within packages is to break them up into increasingly smaller packages that depend on one another.

## Multi-Architecture Support :green_circle:

APK supports multiple architectures.

## Dependency Tracking :green_circle:

Dependency tracking can easily be done once the catalog is obtained.
