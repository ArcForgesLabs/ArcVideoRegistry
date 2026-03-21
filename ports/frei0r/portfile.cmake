vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ArcForgesLabs/frei0r
    REF ccbac4e6c448355d5b8b235d73a5cb06776583a9
    SHA512 6f4af97ec6e1b6e3c4f35b0c3cf6c4b9cebd1852083cccb774991966bdc367924e47f686178820baca6b725ea508d8630f952204b6c8c1eeb5d82370a862b470
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    INVERTED_FEATURES
        opencv  WITHOUT_OPENCV
        cairo   WITHOUT_CAIRO
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
        -DWITHOUT_GAVL=ON
        -DWITHOUT_FACERECOGNITION=ON
)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

set(VCPKG_POLICY_DLLS_WITHOUT_LIBS enabled)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")
