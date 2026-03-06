vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ArcForgesLabs/ArcVideoFoundation
    REF bb75843b443ea4cafc102d8c7ffa8cff73e4ce79
    SHA512 4e41fd0b796014f6af5c0c4325a8f39cf2d331decfec748a4a75e3ca584d0165bd879b1e0b2f326ac65382062acaf7af37da1a9f4f5a43ece9d2bbf292bc8d81
    HEAD_REF dac4eca29ef3ca6a6e7a71c232b3ca3c90a3e7a9
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DUSE_WERROR=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/arcvideo-foundation")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
