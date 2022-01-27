# See https://github.com/pyenv/pyenv/wiki/Authoring-plugins

before_install_func() {
}

after_install_func() {
    # echo "DEFINITION_PREFIX=${DEFINITION_PREFIX} DEFINITION=${DEFINITION} PREFIX=${PREFIX}"
    if [ "${DEFINITION}" != "${DEFINITION_PREFIX}" ]; then
    # DEFINITION_PREFIX=3.11 DEFINITION=3.11.0a4 PREFIX=/home/brandon/.pyenv/versions/3.11.0a4
        echo "Setting alias '${DEFINITION_PREFIX}' for '${PREFIX}'"
        echo "ln -sf ${DEFINITION} ${PREFIX}/../${DEFINITION_PREFIX}"
        ln -sf "${DEFINITION}" "${PREFIX}/../${DEFINITION_PREFIX}"
    fi
}

before_install 'before_install_func'
after_install "after_install_func"