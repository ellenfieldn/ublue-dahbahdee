#!/bin/bash

set -ouex pipefail

mkdir -p /var/lib/alternatives

### Remove CLI Wrap
# ublue-os/main does a command called rpm-ostree cliwrap that makes dnf be a 
# symlink to rpm-ostree.
# This breaks the bootc image builder.
# We need to remove the cliwrap and make dnf5 the default package manager.
echo "::group:: ===Remove CLI Wrap==="
/tmp/remove-cliwrap.sh
echo "::endgroup::"

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
#dnf install -y tmux 

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

#systemctl enable podman.socket
