#!/bin/bash

set -eu

# Trivy ships a single static binary, so the .deb is identical across every
# Debian/Ubuntu release. We publish to a single codename-agnostic `generic`
# distribution, which is the value used in the install docs.
cd deb

echo "Adding deb package to generic"
reprepro includedeb generic ../dist/*Linux-32bit.deb
reprepro includedeb generic ../dist/*Linux-64bit.deb
reprepro includedeb generic ../dist/*Linux-ARM64.deb

# git runs inside `deb/`, so "git add ." stages only `deb/` contents.
git add .
git commit -m "Update deb packages"
git push origin main
