# PyPI Package Manager

[pypi.org](https://pypi.org)

Public Python packages are primarily stored at the [Python Package Index](https://pypi.org).  This document will focus on a examples from PyPi.org but keep in mind private and other public python package repositories exist and all follow the same API.

Binary packages are often in Wheel format (zip file format with a .whl extension) and source packages (.tar.gz).  

Python's packaging ecosystem has gone through much evolution over the years.  Backwards compatibility is a major consideration as they move forward.

## List of Packages :green_circle:

The entire package catalog is retrieved by a single HTTP GET request to <https://pypi.org/simple>.  As of 2023-10-13, the HTML file returned is 28.1 MB and contains 487,228 packages.  Below is a snippet of interestingly named packages called `aaaa`, `aaaaa`, etc.

```html
<a href="/simple/aaaa/">aaaa</a>
<a href="/simple/aaaaa/">aaaaa</a>
<a href="/simple/aaaaaaaaaaaaaaaaaaa-aaaaaaaaa-aaaaaaasa-aaaaaaasa-aaaaasaa-aaaaaaasa-bbbbbbbbbbb/">Aaaaaaaaaaaaaaaaaaa-aaaaaaaaa-aaaaaaasa-aaaaaaasa-aaaaasaa-aaaaaaasa-bbbbbbbbbbb</a>
<a href="/simple/aaaaaatest/">aaaaaatest</a>
<a href="/simple/aaaabpackage/">aaaabpackage</a>
```

The entire Python Package Index is 17.2 TiB in size.  There are 4,969,409 releases of python packages being served.

## Filter a List of Packages :yellow_circle:

There is catalog only contains the package names.  Therefore filtering on metadata is not possible with a more expensive query that retrieves the data for each package (487k HTTP GET requests is prohibitive).  There is no downloadable catalog that contains all the information in a concise format for Python.

## List versions :green_circle:

To get details information about a Python package tools do a single HTTP GET request to <https://pypi.org/simple/PACKAGE-NAME>.  The response is a HTML document that contains lines such as

Here is a snippet for the popular package `numpy`, retrieved from <https://pypi.org/simple/numpy>.  The file is 1627 kB.

```html
<a href="https://files.pythonhosted.org/packages/83/68/4416a59370addad4dcee0ba726109f7b1f39cebda825a66381f5e654d797/numpy-1.6.1.win32-py2.5.exe#sha256=9f8d76534aba9087d5db281d75f578a076290f191a27bea6899ff7d76d86263d" >numpy-1.6.1.win32-py2.5.exe</a><br />
<a href="https://files.pythonhosted.org/packages/23/36/35495262d6faf673f2a0948cd2be2bf19f59877c45cba9d4c0b345c5288b/numpy-1.26.0-cp39-cp39-musllinux_1_1_x86_64.whl#sha256=b44e6a09afc12952a7d2a58ca0a2429ee0d49a4f89d83a0a11052da696440e49" data-requires-python="&lt;3.13,&gt;=3.9" data-dist-info-metadata="sha256=4a120e41f66312dbf31e1ee06d58f1c0fb25c020b4e6f97b260d2d0125e328a0" data-core-metadata="sha256=4a120e41f66312dbf31e1ee06d58f1c0fb25c020b4e6f97b260d2d0125e328a0">numpy-1.26.0-cp39-cp39-musllinux_1_1_x86_64.whl</a><br />
<a href="https://files.pythonhosted.org/packages/4b/80/3ae14edb54426376bb1182a236763b39980ab609424825da55f3dbff0629/numpy-1.26.0-cp39-cp39-win32.whl#sha256=5671338034b820c8d58c81ad1dafc0ed5a00771a82fccc71d6438df00302094b" data-requires-python="&lt;3.13,&gt;=3.9" data-dist-info-metadata="sha256=c0dcd8951914d2310fa1033d67acd56270cf8932cb0f7ce8a576efce57f262e6" data-core-metadata="sha256=c0dcd8951914d2310fa1033d67acd56270cf8932cb0f7ce8a576efce57f262e6">numpy-1.26.0-cp39-cp39-win32.whl</a><br />
<a href="https://files.pythonhosted.org/packages/55/b3/b13bce39ba82b7398c06d10446f5ffd5c07db39b09bd37370dc720c7951c/numpy-1.26.0.tar.gz#sha256=f93fc78fe8bf15afe2b8d6b6499f1c73953169fad1e9a8dd086cdff3190e7fdf" data-requires-python="&lt;3.13,&gt;=3.9" >numpy-1.26.0.tar.gz</a><br />
```

The provided metadata for a package at this level is:

- package name
- package version
- python version
- architecture
- digest of metadata and if it is available

In some of the packages listed above the metadata is available.  Below is the metadata with the license and description omitted retrieved from <https://files.pythonhosted.org/packages/23/36/35495262d6faf673f2a0948cd2be2bf19f59877c45cba9d4c0b345c5288b/numpy-1.26.0-cp39-cp39-musllinux_1_1_x86_64.whl.metadata>

```txt
Metadata-Version: 2.1
Name: numpy
Version: 1.26.0
Summary: Fundamental package for array computing in Python
Home-page: https://numpy.org
Author: Travis E. Oliphant et al.
Maintainer-Email: NumPy Developers <numpy-discussion@python.org>
License: OMITTED (license)
Classifier: Development Status :: 5 - Production/Stable
Classifier: Intended Audience :: Science/Research
Classifier: Intended Audience :: Developers
Classifier: License :: OSI Approved :: BSD License
Classifier: Programming Language :: C
Classifier: Programming Language :: Python
Classifier: Programming Language :: Python :: 3
Classifier: Programming Language :: Python :: 3.9
Classifier: Programming Language :: Python :: 3.10
Classifier: Programming Language :: Python :: 3.11
Classifier: Programming Language :: Python :: 3.12
Classifier: Programming Language :: Python :: 3 :: Only
Classifier: Programming Language :: Python :: Implementation :: CPython
Classifier: Topic :: Software Development
Classifier: Topic :: Scientific/Engineering
Classifier: Typing :: Typed
Classifier: Operating System :: Microsoft :: Windows
Classifier: Operating System :: POSIX
Classifier: Operating System :: Unix
Classifier: Operating System :: MacOS
Project-URL: Homepage, https://numpy.org
Project-URL: Documentation, https://numpy.org/doc/
Project-URL: Source, https://github.com/numpy/numpy
Project-URL: Download, https://pypi.org/project/numpy/#files
Project-URL: Tracker, https://github.com/numpy/numpy/issues
Requires-Python: <3.13,>=3.9
Description-Content-Type: text/markdown

OMITTED (Description)
```

## De-dupability :green_circle:

The files are all hosted on https://files.pythonhosted.org and stored at locations based on their SHA-256 digest so the they support deuplication of packages.

## Multi-Architecture Support :green_circle:

The package name encodes the supported architectures.

## Dependency Tracking :yellow_circle:

Up until recently PyPi did not serve metadata.  So a client tool would have to download the entire wheel to determine its dependencies.  With the metadata API the dependencies of a package are more easily obtained.  Here is the metadata for tensorflow.  The `Requires-Dist:` are the dependencies.

```txt
Metadata-Version: 2.1
Name: tensorflow
Version: 2.14.0
Summary: TensorFlow is an open source machine learning framework for everyone.
Home-page: https://www.tensorflow.org/
Author: Google Inc.
Author-email: packages@tensorflow.org
License: Apache 2.0
Download-URL: https://github.com/tensorflow/tensorflow/tags
Keywords: tensorflow tensor machine learning
Platform: UNKNOWN
Requires-Python: >=3.9
Description-Content-Type: text/markdown
Requires-Dist: tensorflow-macos (==2.14.0) ; platform_system == "Darwin" and platform_machine == "arm64"
Requires-Dist: tensorflow-cpu-aws (==2.14.0) ; platform_system == "Linux" and (platform_machine == "arm64" or platform_machine == "aarch64")
Requires-Dist: tensorflow-intel (==2.14.0) ; platform_system == "Windows"
Provides-Extra: and-cuda
Requires-Dist: nvidia-cublas-cu11 (==11.11.3.6) ; extra == 'and-cuda'
Requires-Dist: nvidia-cuda-cupti-cu11 (==11.8.87) ; extra == 'and-cuda'
Requires-Dist: nvidia-cuda-nvcc-cu11 (==11.8.89) ; extra == 'and-cuda'
Requires-Dist: nvidia-cuda-runtime-cu11 (==11.8.89) ; extra == 'and-cuda'
Requires-Dist: nvidia-cudnn-cu11 (==8.7.0.84) ; extra == 'and-cuda'
Requires-Dist: nvidia-cufft-cu11 (==10.9.0.58) ; extra == 'and-cuda'
Requires-Dist: nvidia-curand-cu11 (==10.3.0.86) ; extra == 'and-cuda'
Requires-Dist: nvidia-cusolver-cu11 (==11.4.1.48) ; extra == 'and-cuda'
Requires-Dist: nvidia-cusparse-cu11 (==11.7.5.86) ; extra == 'and-cuda'
Requires-Dist: nvidia-nccl-cu11 (==2.16.5) ; extra == 'and-cuda'
Requires-Dist: tensorrt (==8.5.3.1) ; extra == 'and-cuda'
```

## Old Content To Be Removed Once Incorporated

The python package index specification requires an endpoint to list all the available packages (e.g., on PyPI https://pypi.org/simple/) and one for each package (e.g, for numpy https://pypi.org/simple/numpy/) which includes all the versions for all the architectures and platforms. Both endpoints use specially crafted HTML but a newer specification allows for the same information to be in JSON. The HTML contains hyperlinks to the package archive files. “pip install” only looks for packages by package name thus only uses the later interface but some tools and/or subcommands that search for packages might require the former. PyPI currently has a major design problem in that to determine the package dependencies the package manager has to fully download the package. The metadata is not available outside of the package archive. As such, there is very minimal metadata available about packages directly available from the python package index interface. It includes information like package name, version, architecture, platform, and python version all extracted from the filename of the archive. They also have the concept of “yanked” packages.

The part of this interface that does map very well to OCI is that they store data. In PyPI.org’s case they even reference packages (distribution files) by hash. Storing each package (e.g., numpy) in its own repository and then using a single multi-arch image to represent each version of the package (e.g., reg.example.com/python/numpy:v1.4.5) works however with OCI one cannot reliably list repos under a given path (i.e., reg.example.com/v2/_catalog is not universally available and does not restrict by path) thus providing the package catalog is not possible when storing it in this format. An alternative storage format is to put all the packages in a single repository and then use the tag as the package name. Each multi-arch image then contains all the versions and all the arch/platforms for that project. By listing all the OCI tags one can easily list all the packages. This obviously feels like a hack. When storing python packages in the most straightforward way, OCI lacks the functionality to list all packages efficiently because it lacks the ability to list repositories or search across repositories.
