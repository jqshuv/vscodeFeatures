#!/bin/bash
set -e

# The install.sh script is the installation entrypoint for any dev container 'features' in this repository. 
#
# The tooling will parse the devcontainer-features.json + user devcontainer, and write 
# any build-time arguments into a feature-set scoped "devcontainer-features.env"
# The author is free to source that file and use it however they would like.
set -a
. ./devcontainer-features.env
set +a


if [ ! -z ${_BUILD_ARG_PAX} ]; then
    echo "Activating feature 'pax'"

    # Build args are exposed to this entire feature set following the pattern:  _BUILD_ARG_<FEATURE ID>_<OPTION NAME>
    GREETING=${_BUILD_ARG_HELLOWORLD_GREETING:-undefined}

    wget https://github.com/froehlichA/pax/releases/latest/download/pax -O /usr/pax
    

    chmod +x /usr/pax
    sudo cp /usr/pax /usr/local/bin/pax
    sudo chmod +x /usr/local/bin/pax
fi


