# PyPI Package Manager

[pypi.org](https://pypi.org)

Public Python packages are primarily stored at the [Python Package Index](https://pypi.org).  This document will focus on a examples from PyPi.org but keep in mind private and other public python package repositories exist and all follow the same API.

Binary packages (called python distributions) are often in Wheel format (zip file format with a .whl extension) and source packages (.tar.gz).

The tools that interact with package indices include `pip`, `poetry`, `pipenv`, etc.

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

There is catalog only contains the package names.  Therefore filtering on metadata is not possible with a more expensive query that retrieves the data for each package (487k HTTP GET requests is prohibitive).  There is no downloadable catalog that contains all the information in a concise format.

## List versions :green_circle:

To get details information about a Python package tools do a single HTTP GET request to <https://pypi.org/simple/PACKAGE-NAME>.  The response is a HTML document where the `<a>` tags contain the information.

Here is a snippet for the popular package `scipy`, retrieved from <https://pypi.org/simple/scipy>.  The file is 520 kB.

```html
<a href="https://files.pythonhosted.org/packages/82/0d/987404674724e5bbdd9341ab8bf1a7c52a4082d4ba1ab5ff81ee2ebe8456/scipy-0.8.0.tar.gz#sha256=b12937bd3a71ace8d7d6b7e19f8f220630969c2822e6248fc0bbc8f2cc18d825" >scipy-0.8.0.tar.gz</a><br />
...
<a href="https://files.pythonhosted.org/packages/34/60/31ab759c4305d0cd4aac316c7c580d955800980eb97c2c1e67502b2daed9/scipy-1.11.3-cp39-cp39-musllinux_1_1_x86_64.whl#sha256=15f237e890c24aef6891c7d008f9ff7e758c6ef39a2b5df264650eb7900403c0" data-requires-python="&lt;3.13,&gt;=3.9" data-dist-info-metadata="sha256=283424f25638d7175400f2c268d9c5c2b72adf5a1cf8da1bde2c96194d3e43ff" data-core-metadata="sha256=283424f25638d7175400f2c268d9c5c2b72adf5a1cf8da1bde2c96194d3e43ff">scipy-1.11.3-cp39-cp39-musllinux_1_1_x86_64.whl</a><br />
<a href="https://files.pythonhosted.org/packages/23/86/57a03f715b1398c6c5efa5e62e34d683b6c4b609b0e51df58d48aedde84a/scipy-1.11.3-cp39-cp39-win_amd64.whl#sha256=4b4bb134c7aa457e26cc6ea482b016fef45db71417d55cc6d8f43d799cdf9ef2" data-requires-python="&lt;3.13,&gt;=3.9" data-dist-info-metadata="sha256=ede2b55e44e34b899856916f89459da4450e92ec46632ea777a59908e31d36da" data-core-metadata="sha256=ede2b55e44e34b899856916f89459da4450e92ec46632ea777a59908e31d36da">scipy-1.11.3-cp39-cp39-win_amd64.whl</a><br />
<a href="https://files.pythonhosted.org/packages/39/7b/9f265b7f074195392e893a5cdc66116c2f7a31fd5f3d9cceff661ec6df82/scipy-1.11.3.tar.gz#sha256=bba4d955f54edd61899776bad459bf7326e14b9fa1c552181f0479cc60a568cd" data-requires-python="&lt;3.13,&gt;=3.9" >scipy-1.11.3.tar.gz</a><br />
```

The provided metadata for a package at this level is:

- package name
- package version
- python version
- architecture
- platform
- digest of metadata and if it is available

In some of the packages listed above the metadata is available.  Below is the metadata with the license and description omitted retrieved from <https://files.pythonhosted.org/packages/34/60/31ab759c4305d0cd4aac316c7c580d955800980eb97c2c1e67502b2daed9/scipy-1.11.3-cp39-cp39-musllinux_1_1_x86_64.whl.metadata>

```txt
Metadata-Version: 2.1
Name: scipy
Version: 1.11.3
Summary: Fundamental algorithms for scientific computing in Python
Home-page: https://scipy.org/
Maintainer-Email: SciPy Developers <scipy-dev@python.org>
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
Classifier: Topic :: Software Development :: Libraries
Classifier: Topic :: Scientific/Engineering
Classifier: Operating System :: Microsoft :: Windows
Classifier: Operating System :: POSIX :: Linux
Classifier: Operating System :: POSIX
Classifier: Operating System :: Unix
Classifier: Operating System :: MacOS
Project-URL: Homepage, https://scipy.org/
Project-URL: Documentation, https://docs.scipy.org/doc/scipy/
Project-URL: Source, https://github.com/scipy/scipy
Project-URL: Download, https://github.com/scipy/scipy/releases
Project-URL: Tracker, https://github.com/scipy/scipy/issues
Requires-Python: <3.13,>=3.9
Requires-Dist: numpy<1.28.0,>=1.21.6
Requires-Dist: pytest; extra == "test"
Requires-Dist: pytest-cov; extra == "test"
Requires-Dist: pytest-timeout; extra == "test"
Requires-Dist: pytest-xdist; extra == "test"
Requires-Dist: asv; extra == "test"
Requires-Dist: mpmath; extra == "test"
Requires-Dist: gmpy2; extra == "test"
Requires-Dist: threadpoolctl; extra == "test"
Requires-Dist: scikit-umfpack; extra == "test"
Requires-Dist: pooch; extra == "test"
Requires-Dist: sphinx!=4.1.0; extra == "doc"
Requires-Dist: pydata-sphinx-theme==0.9.0; extra == "doc"
Requires-Dist: sphinx-design>=0.2.0; extra == "doc"
Requires-Dist: matplotlib>2; extra == "doc"
Requires-Dist: numpydoc; extra == "doc"
Requires-Dist: jupytext; extra == "doc"
Requires-Dist: myst-nb; extra == "doc"
Requires-Dist: pooch; extra == "doc"
Requires-Dist: mypy; extra == "dev"
Requires-Dist: typing_extensions; extra == "dev"
Requires-Dist: types-psutil; extra == "dev"
Requires-Dist: pycodestyle; extra == "dev"
Requires-Dist: ruff; extra == "dev"
Requires-Dist: cython-lint>=0.12.2; extra == "dev"
Requires-Dist: rich-click; extra == "dev"
Requires-Dist: click; extra == "dev"
Requires-Dist: doit>=0.36.0; extra == "dev"
Requires-Dist: pydevtool; extra == "dev"
Provides-Extra: test
Provides-Extra: doc
Provides-Extra: dev
Description-Content-Type: text/x-rst

OMITTED (Description)
```

Commands to install packages (e.g., `pip install`) only look at <https://pypi.org/simple/PACKAGE-NAME> and not catalog at <https://pypi.org/simple>.  Packages can be marked as "Yanked" and thus skipped when finding installation candidates.

## De-dupability :green_circle:

The packages are all hosted on <https://files.pythonhosted.org> and stored at paths based on their SHA-256 digest so the they support deduplication of packages.

## Multi-Architecture Support :green_circle:

The package name encodes the supported architectures.

## Dependency Tracking :yellow_circle:

Up until recently PyPi did not serve metadata.  So a client tool would have to download the entire wheel to determine its dependencies.  With the metadata API, the dependencies of a package are more easily obtained.  In the `scipy` example above, the `Requires-Dist:` entried denote the dependencies.  (Dist stands for Distribution which is what Python calls packages).

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

## Mapping to OCI

The part of this interface that does map very well to OCI is how they store packages. In PyPI.org’s case they even reference packages (distribution files) by hash but this is not required by the specification for python packages repositories.

Storing each package (e.g., scipy) in its own repository and then using a single multi-arch image to represent each version of the package (e.g., `reg.example.com/python/scipy:v1.4.5`) works however with OCI one cannot reliably list repos under a given path (i.e., `reg.example.com/v2/_catalog` is not universally available and does not restrict by path) thus providing the package catalog is not possible when storing it in this format.

An alternative storage format is to put all the packages in a single repository and then use the tag as the package name. Each multi-arch image then contains all the versions and all the arch/platforms for that project. By listing all the OCI tags one can easily list all the packages. This obviously feels like a hack. When storing python packages in the most straightforward way, **OCI lacks the functionality to list all packages efficiently because it lacks the ability to list repositories or search across repositories**.
