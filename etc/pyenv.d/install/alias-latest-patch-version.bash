# See https://github.com/pyenv/pyenv/wiki/Authoring-plugins

# before_install_func() {
# }

# Detect if the installation command made use of the `M.m:latest` format, and if so, create a symlink that points
# `M.m` to the `M.m.p` directory that was installed.
after_install_func() {
    if [ "${DEFINITION}" != "${DEFINITION_PREFIX}" ]; then
        echo "Setting alias '${DEFINITION_PREFIX}' for '${PREFIX}'"
        ln -sf "${DEFINITION}" "${PREFIX}/../${DEFINITION_PREFIX}"
    fi
}

# before_install "before_install_func"
after_install "after_install_func"