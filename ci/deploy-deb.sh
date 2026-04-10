#!/bin/bash

set -eu

# "sid" and "experimental" are Debian pseudo-distributions, not stable releases.
# They are included in `debian-distro-info --supported` output but have no reprepro
# distributions entry and are not meaningful targets for a package repository.
DEBIAN_RELEASES=$(debian-distro-info --supported | grep -vE "^(experimental|sid)$")
UBUNTU_RELEASES=$(sort -u <(ubuntu-distro-info --supported-esm) <(ubuntu-distro-info --supported))

cd deb

for release in generic ${DEBIAN_RELEASES[@]} ${UBUNTU_RELEASES[@]}; do
  echo "Removing deb package of $release"
  reprepro -A i386 remove $release trivy
  reprepro -A amd64 remove $release trivy
  reprepro -A arm64 remove $release trivy
done

for release in generic ${DEBIAN_RELEASES[@]} ${UBUNTU_RELEASES[@]}; do
  echo "Adding deb package to $release"
  reprepro includedeb $release ../dist/*Linux-32bit.deb
  reprepro includedeb $release ../dist/*Linux-64bit.deb
  reprepro includedeb $release ../dist/*Linux-ARM64.deb
done

# git runs inside `deb/`, so "git add ." stages only `deb/` contents.
git add .
git commit -m "Update deb packages"
git push origin main
