PKGMGRS=(rpm yum)

for pkgmgr in ${PKGMGRS[@]}; do
  load ${pkgmgr}
done

function setup() {
  echo
}

function teardown() {
  echo
}

@test "list all packages" {
  for pkgmgr in ${PKGMGRS[@]}; do
    echo
    echo "@@@ ${pkgmgr} @@@"
    echo
    func="${pkgmgr}"_list_packages
    echo "${pkgmgr}: ${func}"
    echo
    run "${func}"
    [ "$status" -eq 0 ] || exit "$status"
  done
}

@test "filter a list of packages" {
  for pkgmgr in ${PKGMGRS[@]}; do
    echo
    echo "@@@ ${pkgmgr} @@@"
    echo
    func="${pkgmgr}"_filter_package_list
    echo "${pkgmgr}: ${func}"
    echo
    run "${func}"
    [ "$status" -eq 0 ] || exit "$status"
  done
}

@test "list versions" {
  for pkgmgr in ${PKGMGRS[@]}; do
    echo
    echo "@@@ ${pkgmgr} @@@"
    echo
    func="${pkgmgr}"_list_versions
    echo "${pkgmgr}: ${func}"
    echo
    run "${func}"
    [ "$status" -eq 0 ] || exit "$status"
  done
}

@test "dedupability" {
  for pkgmgr in ${PKGMGRS[@]}; do
    echo
    echo "@@@ ${pkgmgr} @@@"
    echo
    func="${pkgmgr}"_dedupability
    echo "${pkgmgr}: ${func}"
    echo
    run "${func}"
    [ "$status" -eq 0 ] || exit "$status"
  done
}

@test "multi-arch support" {
  for pkgmgr in ${PKGMGRS[@]}; do
    echo
    echo "@@@ ${pkgmgr} @@@"
    echo
    func="${pkgmgr}"_multi_arch_support
    echo "${pkgmgr}: ${func}"
    echo
    run "${func}"
    [ "$status" -eq 0 ] || exit "$status"
  done
}

@test "dependency tracking" {
  for pkgmgr in ${PKGMGRS[@]}; do
    echo
    echo "@@@ ${pkgmgr} @@@"
    echo
    func="${pkgmgr}"_dependency_tracking
    echo "${pkgmgr}: ${func}"
    echo
    run "${func}"
    [ "$status" -eq 0 ] || exit "$status"
  done
}
