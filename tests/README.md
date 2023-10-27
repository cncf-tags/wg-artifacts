# Conformance

The goal of the conformance tests is:

1. To demonstrably understand what the capabilities of individual packages are.

2. To evaluate if standardization is currently feasible.

3. To assess if further enhancements can be suggested and implemented.

## Developer Guide

The conformance tests are in the `tests/` directory.

Look at [PKGMGR_TEMPLATE.bash](./PKGMGR_TEMPLATE.bash) and add your
implementation. For example, [rpm.bash](./rpm.bash)

Add your package manager name to `PKGMGRS` list on Line 1 in
[conformance.bats](./conformance.bats)

From the top-level Makefile, invoke:

```bash
make conformance
```
