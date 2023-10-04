function yum_list_packages() {
  podman run rockylinux:9 bash -c "\
    yum list available; \
    yum list installed; \
    yum list all; \
  "
}

function yum_filter_package_list() {
  podman run rockylinux:9 bash -c "\
    yum list glibc*; \
    yum list all | grep glibc*; \
  "
}

function yum_list_versions() {
  podman run rockylinux:9 bash -c "\
    yum list --showduplicates glibc*; \
  "
}

function yum_dedupability() {
  echo "n/a"
}

function yum_multi_arch_support() {
  podman run rockylinux:9 bash -c "\
    yum search package | grep x86_64; \
    yum list glibc*.x86_64; \
  "
}

function yum_dependency_tracking() {
  podman run rockylinux:9 bash -c "\
    yum deplist glibc*; \
    yum provides glibc*; \
    yum repoquery --requires --resolve glibc*; \
  "
}
