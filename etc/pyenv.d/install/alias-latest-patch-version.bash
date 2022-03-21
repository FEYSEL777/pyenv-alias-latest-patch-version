# See https://github.com/pyenv/pyenv/wiki/Authoring-plugins

# alias_latest_patch_version__before_install_func() {
# }

# Detect if the installation command made use of the `M.m:latest` format, and if so, create a symlink that points
# `M.m` to the `M.m.p` directory that was installed.
alias_latest_patch_version__after_install_func() {
    if [ "${DEFINITION}" != "${DEFINITION_PREFIX}" ]; then
        echo "Setting alias '${DEFINITION_PREFIX}' for '${PREFIX}'"
        # Create a relative symlink to the installed directory. The `f` ensures we overwrite any existing symlink
        # (eg from a previous version).  The `T` is also necessary in this case, otherwise ln will silently *not*
        # overwrite an existing directory symlink.
        # (See https://stackoverflow.com/questions/40806543/ln-sf-does-not-overwrite-a-symlink-to-a-directory)
        ln -sfT "${DEFINITION}" "${PREFIX}/../${DEFINITION_PREFIX}"
    fi
}

# before_install "alias_latest_patch_version__before_install_func"
after_install "alias_latest_patch_version__after_install_func"