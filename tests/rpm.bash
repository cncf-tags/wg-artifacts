function rpm_list_packages() {
  podman run rockylinux:9 bash -c "\
    rpm -qa; \
  "
}

function rpm_filter_package_list() {
  podman run rockylinux:9 bash -c "\
    rpm -qa | grep glibc*; \
    rpm -qa --qf '(%{INSTALLTIME:date}): %{NAME}-%{VERSION}' glibc*; \
  "
}

function rpm_list_versions() {
  podman run rockylinux:9 bash -c "\
    rpm -qa --qf '%{NAME}-%{VERSION}' glibc*; \
  "
}

function rpm_dedupability() {
  echo "n/a"
}

function rpm_multi_arch_support() {
  podman run rockylinux:9 bash -c "\
    rpm -q glibc.x86_64; \
    rpm -qa --qf '%{NAME}-%{VERSION}-%{ARCH}' glibc; \
  "
}

function rpm_dependency_tracking() {
  podman run rockylinux:9 bash -c "\
    rpm -q --whatprovides glibc; \
    rpm -q --whatrequires glibc; \
  "
}
