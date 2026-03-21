vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ArcForgesLabs/mlt
    REF 2d426cca3581fb81929d8e3d1f5ff1e84162b357
    SHA512 3f295d6aca431204e71b833284a7c0ffc72eb2c9782fbff64301d339fa1cd42e673be498b661bfc48f110b110fb03b9342ee98f1492cbdda96172e9b7dca8935
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        qt6     MOD_QT6
        opencv  MOD_OPENCV
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
        -DWINDOWS_DEPLOY=OFF
        -DBUILD_TESTING=OFF
        -DBUILD_DOCS=OFF
        -DCLANG_FORMAT=OFF
        -DMOD_SDL1=OFF
        -DMOD_SOX=OFF
        -DMOD_MOVIT=OFF
        -DMOD_PLUSGPL=OFF
        -DMOD_XINE=OFF
        -DMOD_JACKRACK=OFF
        -DMOD_RTAUDIO=OFF
        -DMOD_DECKLINK=OFF
        -DMOD_NDI=OFF
        -DMOD_SPATIALAUDIO=OFF
        -DMOD_GLAXNIMATE_QT6=OFF
        -DMOD_RESAMPLE=OFF
        -DMOD_VIDSTAB=OFF
        -DSWIG_CSHARP=OFF
        -DSWIG_JAVA=OFF
        -DSWIG_LUA=OFF
        -DSWIG_NODEJS=OFF
        -DSWIG_PERL=OFF
        -DSWIG_PHP=OFF
        -DSWIG_PYTHON=OFF
        -DSWIG_RUBY=OFF
        -DSWIG_TCL=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME Mlt7 CONFIG_PATH "lib/cmake/Mlt7")
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

set(VCPKG_POLICY_DLLS_WITHOUT_LIBS enabled)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")
