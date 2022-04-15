# See https://github.com/pyenv/pyenv/wiki/Authoring-plugins

# alias_latest_patch_version__before_install_func() {
# }

# Detect if the installation command made use of the `M.m:latest` format, and if so, create a symlink that points
# `M.m` to the `M.m.p` directory that was installed.
alias_latest_patch_version__after_install_func() {
    if [ "${DEFINITION}" != "${DEFINITION_PREFIX}" ]; then
        echo "Setting alias '${DEFINITION_PREFIX}' for '${PREFIX}'"
        LINK_NAME="${PREFIX}/../${DEFINITION_PREFIX}"

        # Delete any existing symlink (eg from a previous version).
        # This is done separately from the ln command which though is capable of replacing an existing
        # directory symlink via -sfT, but the T option is not available on some systems (eg MacOS).
        #   (If you are tempted to just use `ln -sf` (without the T) be advised that this will not replace an existing
        #   directory symlink. ln will silently *not* overwrite an existing directory symlink.
        #   See https://stackoverflow.com/questions/40806543/ln-sf-does-not-overwrite-a-symlink-to-a-directory)
        rm -f "${LINK_NAME}"

        # Create a relative symlink to the installed directory.
        ln -s "${DEFINITION}" "${LINK_NAME}"
    fi
}

# before_install "alias_latest_patch_version__before_install_func"
after_install "alias_latest_patch_version__after_install_func"